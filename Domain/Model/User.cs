


namespace LacquaMessenger.Domain.Models
{
    public class User
    {
        public string PhoneNumber { get; private set; }
        public string UserName { get; private set; }
        public WhatsUser WhatsUser { get; private set; }
        public int IdContato { get; set; }

        public User(string phone, string name, int Contato = 0)
        {
            PhoneNumber = phone;
            UserName = name;
            IdContato = Contato;
        }

        //public static User UserExists(string phoneNum, string nickName)
        //{

        //    WhatsUserManager man = new WhatsUserManager();
        //    var whatsUser = man.CreateUser(phoneNum, phoneNum);

        //    var tmpUser = new User(phoneNum, nickName);
        //    tmpUser.SetUser(whatsUser);
        //    return tmpUser;
        //}

        public void SetUser(WhatsUser user)
        {
            if (WhatsUser != null)
                return;

            WhatsUser = user;
        }

    }
}
