using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LibraryHAO
{
    public class admin
    {
        private string username, password;

        public string Password
        {
            get { return password; }
            set { password = value; }
        }

        public string Username
        {
            get { return username; }
            set { username = value; }
        }

        public admin(string username, string password)
        {
            this.username = username;
            this.password = password;
        }

        public string toAuth()
        {
            string strSQL;
            strSQL = "select admin_pwd from t_admin where admin_name='" + Username + "'";
            return strSQL;
        }

    }
}
