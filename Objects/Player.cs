using System.Collections.Generic;
using System.Data.SqlClient;
using System;

namespace LemonadeStand
{
    public class Player
    {
        private int _id;
        private string _username;
        private string _password;
        private decimal _money;
        private int _count;

        public Player(string username, string password, int id = 0)
        {
            _id = id;
            _username = username;
            _password = password;
            _money = 20m;
            _count = 0;
        }

        public override bool Equals(System.Object otherPlayer)
        {
            if(!(otherPlayer is Player))
            {
                return false;
            }
            else
            {
                Player newPlayer = (Player) otherPlayer;
                bool idEquality = this.GetId() == newPlayer.GetId();
                bool usernameEquality = this.GetUsername() == newPlayer.GetUsername();
                bool passwordEquality = this.GetPassword() == newPlayer.GetPassword();
                bool moneyEquality = this.GetMoney() == newPlayer.GetMoney();
                bool countEquality = this.GetMoney() == newPlayer.GetMoney();
                return (idEquality && usernameEquality && passwordEquality && countEquality);
            }
        }


        public int GetId()
        {
            return _id;
        }
        public string GetUsername()
        {
            return _username;
        }
        public string GetPassword()
        {
            return _password;
        }

        public decimal GetMoney()
        {
            return _money;
        }

        public int GetCount()
        {
          return _count;
        }

        public Game AddGame()
        {
            Game newGame = new Game(this._id);
            this.AddCount();
            return newGame;
        }

        public void AddCount()
        {
          this._count ++;
          SqlConnection conn = DB.Connection();
          conn.Open();

          SqlCommand cmd = new SqlCommand("UPDATE players SET count=@Count WHERE id = @PlayerId;", conn);

          cmd.Parameters.Add(new SqlParameter("@PlayerId", this.GetId()));
          cmd.Parameters.Add(new SqlParameter("@Count", this._count.ToString()));

          cmd.ExecuteNonQuery();

          if (conn != null)
          {
              conn.Close();
          }
        }

        public void SetMoney(decimal money)
        {
            _money = money;
            SqlConnection conn = DB.Connection();
            conn.Open();

            SqlCommand cmd = new SqlCommand("UPDATE players SET money=@Money WHERE id = @PlayerId;", conn);

            cmd.Parameters.Add(new SqlParameter("@PlayerId", this.GetId()));
            cmd.Parameters.Add(new SqlParameter("@Money", money));

            cmd.ExecuteNonQuery();

            if (conn != null)
            {
                conn.Close();
            }
        }

        public void ResetMoneyAndCount()
        {
            SqlConnection conn = DB.Connection();
            conn.Open();

            SqlCommand cmd = new SqlCommand("UPDATE players SET money=@Money WHERE id = @PlayerId; UPDATE players SET count=@Count WHERE id = @PlayerId;", conn);

            cmd.Parameters.Add(new SqlParameter("@PlayerId", this.GetId()));
            cmd.Parameters.Add(new SqlParameter("@Money", 20m));
            cmd.Parameters.Add(new SqlParameter("@Count", "0"));

            cmd.ExecuteNonQuery();

            if (conn != null)
            {
                conn.Close();
            }
            _money = 20m;
            _count = 0;

        }


        public void Save()
        {
            SqlConnection conn = DB.Connection();
            conn.Open();

            SqlCommand cmd = new SqlCommand("INSERT INTO players (username, password, money, count) OUTPUT INSERTED.id VALUES (@Username, @Password, @Money, @Count);", conn);

            cmd.Parameters.Add(new SqlParameter("@Username", this.GetUsername()));
            cmd.Parameters.Add(new SqlParameter("@Password", this.GetPassword()));
            cmd.Parameters.Add(new SqlParameter("@Money", this.GetMoney()));
            cmd.Parameters.Add(new SqlParameter("@Count", this.GetCount().ToString()));

            SqlDataReader rdr = cmd.ExecuteReader();

            while(rdr.Read())
            {
                this._id = rdr.GetInt32(0);
            }

            if (rdr != null)
            {
                rdr.Close();
            }
            if (conn != null)
            {
                conn.Close();
            }
        }

        public void SaveScore()
        {
            SqlConnection conn = DB.Connection();
            conn.Open();

            SqlCommand cmd = new SqlCommand("INSERT INTO players_scores (player_id, score) VALUES (@PlayerId, @Score);", conn);

            cmd.Parameters.Add(new SqlParameter("@Score", this._money));
            cmd.Parameters.Add(new SqlParameter("@PlayerId", this.GetId()));

            cmd.ExecuteNonQuery();

            _count = 0;
            _money = 20m;

            if (conn != null)
            {
                conn.Close();
            }
        }

        public List<decimal> GetScores()
        {
            List<decimal> AllScores= new List<decimal> {};
            SqlConnection conn = DB.Connection();
            conn.Open();

            SqlCommand cmd = new SqlCommand("SELECT score FROM players_scores WHERE player_id = @PlayerId;", conn);
            cmd.Parameters.Add(new SqlParameter("@PlayerId", this._id));

            SqlDataReader rdr = cmd.ExecuteReader();

            while(rdr.Read())
            {
                decimal score = rdr.GetDecimal(0);
                AllScores.Add(score);
            }

            if(rdr != null)
            {
                rdr.Close();
            }

            if (conn != null)
            {
                conn.Close();
            }

            return AllScores;
        }

        public Dictionary<string, object> GetAverageScore()
        {
            decimal totalScore = 0m;
            decimal count = 0m;
            SqlConnection conn = DB.Connection();
            conn.Open();

            SqlCommand cmd = new SqlCommand("SELECT score FROM players_scores WHERE player_id = @PlayerId;", conn);
            cmd.Parameters.Add(new SqlParameter("@PlayerId", this._id));

            SqlDataReader rdr = cmd.ExecuteReader();

            while(rdr.Read())
            {
                decimal score = rdr.GetDecimal(0);
                totalScore += score;
                count ++;
            }

            if(rdr != null)
            {
                rdr.Close();
            }

            if (conn != null)
            {
                conn.Close();
            }

            Dictionary<string, object> averageScore = new Dictionary<string, object>{};
            decimal averageScoreDecimal = totalScore/count;
            string averageScoreString = String.Format("{0:C}", averageScoreDecimal);
            averageScore.Add("averageScoreDecimal", averageScoreDecimal);
            averageScore.Add("averageScoreString", averageScoreString);
            
            return averageScore;
        }

        public static Player Find(int playerId)
        {
            SqlConnection conn = DB.Connection();
            conn.Open();

            SqlCommand cmd = new SqlCommand("SELECT * FROM players WHERE id = @PlayerId;", conn);
            cmd.Parameters.Add(new SqlParameter("@PlayerId", playerId.ToString()));

            SqlDataReader rdr = cmd.ExecuteReader();

            int id = 0;
            string username = null;
            string password = null;
            decimal money = 0m;
            int count = 0;

            while(rdr.Read())
            {
                id = rdr.GetInt32(0);
                username = rdr.GetString(1);
                password = rdr.GetString(2);
                money = rdr.GetDecimal(3);
                count = rdr.GetInt32(4);
            }

            Player foundPlayer = new Player(username, password, id);
            foundPlayer._money = money;
            foundPlayer._count = count;
            if(rdr != null)
            {
                rdr.Close();
            }

            if(conn != null)
            {
                conn.Close();
            }

            return foundPlayer;
        }

        public static Player Search(string playerUsername, string playerPassword)
        {
            SqlConnection conn = DB.Connection();
            conn.Open();

            SqlCommand cmd = new SqlCommand("SELECT * FROM players WHERE username = @Username AND password = @Password;", conn);
            cmd.Parameters.Add(new SqlParameter("@Username", playerUsername));
            cmd.Parameters.Add(new SqlParameter("@Password", playerPassword));

            SqlDataReader rdr = cmd.ExecuteReader();

            int id = 0;
            string username = null;
            string password = null;
            decimal money = 0m;

            while(rdr.Read())
            {
                id = rdr.GetInt32(0);
                username = rdr.GetString(1);
                password = rdr.GetString(2);
                money = rdr.GetDecimal(3);
            }

            Player searchedPlayer = new Player(username, password, id);
            searchedPlayer._money = money;
            if(rdr != null)
            {
                rdr.Close();
            }

            if(conn != null)
            {
                conn.Close();
            }

            return searchedPlayer;
        }

        public static List<Player> GetAll()
        {
            List<Player> allPlayers = new List<Player>{};

            SqlConnection conn = DB.Connection();
            conn.Open();

            SqlCommand cmd = new SqlCommand("SELECT * FROM players", conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            while(rdr.Read())
            {
                int playerId = rdr.GetInt32(0);
                string username = rdr.GetString(1);
                string password = rdr.GetString(2);
                Player newPlayer = new Player(username, password, playerId);
                allPlayers.Add(newPlayer);
            }

            if (rdr != null)
            {
                rdr.Close();
            }
            if (conn != null)
            {
                conn.Close();
            }

            return allPlayers;
        }

        public static void DeleteAll()
        {
            SqlConnection conn = DB.Connection();
            conn.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM players; DELETE FROM players_scores", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }



    }
}
