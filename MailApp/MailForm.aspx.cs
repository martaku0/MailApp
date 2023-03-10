using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Collections;
using System.IO;

namespace MailApp
{
    public partial class MailForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btClear_Click(object sender, EventArgs e)
        {
            tbFrom.Text = "";
            tbTo.Text = "";
            tbSubject.Text = "";
            tbText.Text = "";
            tbSerwer.Text = "";
            lbInfo1.Text = "";
            lbInfo2.Text = "";
            lboxAttachments.Items.Clear();
            tbPort.Text = "";
            tbUser.Text = "";
            tbPass.Text = "";
        }

        protected void btSave_Click(object sender, EventArgs e)
        {
            if(FileUpload1.HasFile)
            {
                string fileName = FileUpload1.FileName;
                string serverPath = Server.MapPath("~/") + fileName;
                FileUpload1.SaveAs(serverPath);
                lboxAttachments.Items.Add(fileName);
                lbInfo2.Text = "Attachment downloaded";
            }
        }

        protected void btChangeServer_Click(object sender, EventArgs e)
        {
            if (lbPort.Visible == false)
            {
                lbPort.Visible = true;
                tbPort.Visible = true;
                lbUser.Visible = true;
                tbUser.Visible = true;
                lbPass.Visible = true;
                tbPass.Visible = true;
            }
            else
            {
                lbPort.Visible = false;
                tbPort.Visible = false;
                lbUser.Visible = false;
                tbUser.Visible = false;
                lbPass.Visible = false;
                tbPass.Visible = false;
            }
        }

        protected void tbPort_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btSend_Click(object sender, EventArgs e)
        {
            SmtpClient client;
            MailMessage message;
            ArrayList attachmentList = new ArrayList();
            try
            {
                message = new MailMessage(tbFrom.Text, tbTo.Text);
                message.Subject = tbSubject.Text;
                message.Body = tbText.Text;
                if (lbPort.Visible == true)
                {
                client = new SmtpClient(tbSerwer.Text, int.Parse(tbPort.Text));
                    client.UseDefaultCredentials = false;
                    client.EnableSsl = true;
                    client.Credentials = new System.Net.NetworkCredential(tbUser.Text, tbPass.Text);
                }
                else
                {
                    client = new SmtpClient(tbSerwer.Text);
                    client.Credentials = CredentialCache.DefaultNetworkCredentials;
                }
                for(int i = 0; i < lboxAttachments.Items.Count; i++)
                {
                    Attachment attachment = new Attachment(Server.MapPath("~/") + lboxAttachments.Items[i].ToString());
                    message.Attachments.Add(attachment);
                    attachmentList.Add(attachment);
                }
                client.Send(message);
                lbInfo1.Text = "Message sent";
                for(int j = 0; j < attachmentList.Count; j++)
                {
                    ((Attachment)attachmentList[j]).Dispose();
                }
                for(int i = 0; i < lboxAttachments.Items.Count; i++)
                {
                    File.Delete(Server.MapPath("~/") + lboxAttachments.Items[i].ToString());
                }
                lboxAttachments.Items.Clear();
            }
            catch(Exception ex)
            {
                lbInfo1.Text = "You can not send messages (" + ex.Message + ")";
            }
        }
    }
}