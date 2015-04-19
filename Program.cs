using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.WindowsAzure.MobileServices;
using System.Windows.Forms;


namespace ConsoleApplication1
{
    public class LoginInfo
    {
        public string Id { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string DomainKey { get; set; }
    }

    class Program
    {
        public static MobileServiceClient MobileService = new MobileServiceClient(
            "https://cyborggangsta.azure-mobile.net/",
            "VoVhDketKMHxkPzYfBSpJUvvKuAgHk36");
        
        [STAThreadAttribute]
        static void Main(string[] args)
        {
            while (true)
            {
                Boolean fillData = true;

                String console = Console.ReadLine();
                if (console.Equals("ZXc9869Y69U69b", StringComparison.Ordinal))
                {
                    fillData = true;
                    Console.WriteLine("\n\n\nYou have 8 seconds to navigate to the login field!" +
                        "\n\n\n\n BEGIN!!!!!!!!!!! \n\n\n");
                    for (int i = 8; i > 0; i--)
                    {
                        Console.WriteLine("Time remaining = " + i + "seconds!");
                        System.Threading.Thread.Sleep(1000);

                    }
                }
                if (console.Equals("Done", StringComparison.Ordinal))
                    return;

                if (fillData)
                {
                    Task t = getTable();
                    t.Wait();
                    LoginInfo needed = findEntry(getUrlFromClipboard());
                    writeUsername(needed.UserName);
                    writePassword(needed.Password);
                }

                Console.WriteLine("Would you like to log in again? If so complete activation gesture.");
            }
        }

        static void addRandomContent(){
             String[] usernameList = { "JohnDoe1@email.com", "JaneDoe1@email.com", "JohnDoe2@email.com",
                                                "JaneDoe2@email.com", "JohnDoe3@email.com" };
                    String[] siteList = { "facebook", "netflix", "dominos", "reddit", "google", "microsoft" };
                    for (int i = 0; i < usernameList.Length; i++)
                    {
                        Task t = writeToDB(new LoginInfo { UserName = usernameList[i], Password = generatePass(10), DomainKey = siteList[i]});
                        t.Wait();
                    }
        }



        static LoginInfo findEntry(String url){
            for (int i = 0; i < logs.Count; i++)
            {
                if (url.Contains(logs[i].DomainKey))
                    return logs[i];
            }
            Console.WriteLine("You suck. You haven't added that site to the database.");
            Application.Exit();
            return null;
        }

        //read the url from the clipboard
         static String getUrlFromClipboard()
        {
            bool hasString = Clipboard.ContainsText();
            String url = null;
            if (hasString)
                url = System.Windows.Forms.Clipboard.GetText();
            return url;
        }

        //write the username to the field using sendKeys
        static void writeUsername(String username)
        {
            //System.Threading.Thread.Sleep(5000);
            SendKeys.SendWait(username + "{TAB}");
        }

        //write the password to the field using sendKeys
        static void writePassword(String password)
        {
            //System.Threading.Thread.Sleep(5000);
            SendKeys.SendWait(password + "{ENTER}");
            //SendKeys.SendWait(password);
        }

       async static Task writeToDB(LoginInfo item)
        {
            await MobileService.GetTable<LoginInfo>().InsertAsync(item);
        }

       static List<LoginInfo> logs = null;

       async static Task getTable()
       {
           logs = await MobileService.GetTable<LoginInfo>().ToListAsync();
       }

       static string generatePass(int length)
       {
           string pass = "";
           Random rng = new Random();
           for (int i = 0; i < length; i++)
           {
               int add = 96;
               while(add > 96 || add < 81)
                    add = rng.Next(48, 112);
               if (add < 91)
                   pass += Convert.ToChar(90 - add);
               pass += (char)add;
           }
           return pass;
       }
    }
}