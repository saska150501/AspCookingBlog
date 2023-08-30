using CookingBlog.Application.Emails;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.Emails
{
    public class FakeEmailSender : IEmailSender
    {
        public void Send(EmailMessage email)
        {
            Console.WriteLine("Sending email to : " + email.To);
            Console.WriteLine("Title: " + email.Title);
            Console.WriteLine("Body: " + email.Body);
        }
    }
}
