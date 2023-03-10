<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailForm.aspx.cs" Inherits="MailApp.MailForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://fonts.googleapis.com/css2?family=Almarai&display=swap" rel="stylesheet">
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="center">
            <asp:Button class="button bt-clear" ID="btClear" runat="server" Text="Clear" OnClick="btClear_Click" />
        </div>
        <table class="message">
            <tr>
                <td class="auto-style1"><asp:Label ID="lbFrom" runat="server" Text="From"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox class="textbox" ID="tbFrom" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style1"><asp:Label ID="lbTo" runat="server" Text="To"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox class="textbox" ID="tbTo" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style1"><asp:Label ID="lbSubject" runat="server" Text="Subject"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox class="textbox" ID="tbSubject" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style1"><asp:Label ID="lbText" runat="server" Text="Text"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox class="textbox" ID="tbText" runat="server" AutoPostBack="True" Height="180px" TextMode="MultiLine" style="resize:none;"></asp:TextBox></td>
            </tr>
        </table>
        <table class="serwer">
            <tr>
                <td class="auto-style1"><asp:Label ID="lbSerwerSMTP" runat="server" Text="Serwer SMTP"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox class="textbox" ID="tbSerwer" runat="server">127.0.0.1</asp:TextBox><br /></td>
            </tr>
            <tr>
                <td class="auto-style1"><asp:Label ID="lbPort" runat="server" Text="Port" Visible="False"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox class="textbox" ID="tbPort" runat="server" OnTextChanged="tbPort_TextChanged" Visible="False"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style3"><asp:Button class="button bt-change" ID="btChangeServer" runat="server" OnClick="btChangeServer_Click" Text="Change server" />
            </table>
        <div class="not-row center">
            <asp:Button class="button bt-send" ID="btSend" runat="server" Text="Send" OnClick="btSend_Click" />
            <asp:Label ID="lbInfo1" runat="server"></asp:Label>
        </div>
        <table class="serwer-2">
            <tr>
                <td class="auto-style1"><asp:Label ID="lbUser" runat="server" Text="User" Visible="False"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox class="textbox" ID="tbUser" runat="server" Visible="False"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style1"><asp:Label ID="lbPass" runat="server" Text="Password" Visible="False"></asp:Label></td>
                <td class="auto-style2"><asp:TextBox class="textbox" ID="tbPass" runat="server" TextMode="Password" Visible="False"></asp:TextBox></td>
            </tr>
        </table>
        <table class="attachments">
            <tr>
                <td><asp:Label ID="lbAttachments" runat="server" Text="Attachments:"></asp:Label></td>
                <td class="upload"><asp:FileUpload ID="FileUpload1" runat="server"/></td>
                <td><asp:Button class="button bt-save" ID="btSave" runat="server" Text="Save" OnClick="btSave_Click" /></td>    
            <tr>
                <td colspan="3" class="auto-style3"><asp:ListBox class="listbox" ID="lboxAttachments" runat="server"></asp:ListBox></td>
            </tr>
            <tr>
                <td colspan="3" class="auto-style3"><asp:Label ID="lbInfo2" runat="server"></asp:Label></td>
            </tr>
        </table>
    </form>
</body>
</html>
