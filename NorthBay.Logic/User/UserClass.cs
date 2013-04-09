using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web.Security;
using NorthBay.Framework.Authentication;
using NorthBay.Framework.Security;
using NorthBay.Utility;

namespace NorthBay.Logic.User
{
    public class UserClass : BaseBo<Framework.Database.User>
    {
        public bool AuthenticateUser(string email, string password)
        {
            using (var context = Db.DataContext())
            {
                //Authenticate User, hashing password with MD5
                var query = context.Users.Where(x => x.Email.Equals(email) && x.Password.Equals(SecurityHelper.Hash(password)));

                if (query.Count() != 1)
                    return false; //login fail

                //Get User Object
                var user = query.ToList()[0];

                //Create User Session
                UserSession.Create(user);

                return true;
            }
        }

        public void CheckAuthentication(FormsAuthenticationEventArgs e)
        {
            var ticket = UserSession.GetTicket();

            //Check if ticket is null
            if (ticket == null)
                return;

            //Get Id
            var id = TextHelper.ToInteger(ticket.Name);
            if (id == null)
                return;

            //Get user roles
            var roles = GetRolesById((int)id);
            if (roles == null)
                return;

            //Let us set the Pricipal with our user specific details
            e.User = new GenericPrincipal(new GenericIdentity(TextHelper.ToString(id), "Forms"), new[] { TextHelper.ToString(roles) });

        }

        private int? GetRolesById(int id)
        {
            //Get user object
            var user = Db.Select<Framework.Database.User>(id);

            //return
            return user.UserRoleId;
        }

        public bool Logout()
        {
            return UserCookie.Remove();
        }

        public List<Framework.Database.User> SelectAllPatients()
        {
            using(var context = Db.DataContext())
            {
                return context.Users.Where(x => x.UserRole.UserRoleId == 3).ToList();
            }
        }
    }
}
