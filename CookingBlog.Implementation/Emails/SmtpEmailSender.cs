using CookingBlog.Application.Emails;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace CookingBlog.Implementation.Emails
{
    public class SmtpEmailSender : IEmailSender
    {
        private readonly string _email;
        private readonly string _password;

        public SmtpEmailSender(string email, string password)
        {
            _email = email;
            _password = password;
        }

        public void Send(EmailMessage email)
        {
            //var smtp = new SmtpClient
            //{
            //    Host = "smtp.gmail.com",
            //    Port = 587,
            //    EnableSsl = true,
            //    DeliveryMethod = SmtpDeliveryMethod.Network,
            //    Credentials = new NetworkCredential(_email, _password),
            //    UseDefaultCredentials = false
            //};

            //var message = new MailMessage(_email, email.To);
            //message.Subject = email.Title;
            //message.Body = email.Body;
            //message.IsBodyHtml = true;

            //smtp.Send(message);
            try
            {
                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    Credentials = new NetworkCredential(_email, _password),
                    UseDefaultCredentials = false
                };

                var message = new MailMessage(_email, email.To);
                message.Subject = email.Title;
                message.Body = email.Body;
                message.IsBodyHtml = true;

                smtp.Send(message);
            }
            catch (SmtpException smtpEx)
            {
                // Obrada SMTP greške
                Console.WriteLine($"SMTP error: {smtpEx.Message}");
            }
            catch (Exception ex)
            {
                // Obrada drugih grešaka
                Console.WriteLine($"Error: {ex.Message}");
            }
        }
    }
}
