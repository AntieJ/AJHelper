#gmailer

$fromEmail = Read-Host 'From Email'
$passwordSecure = Read-Host 'Password' -AsSecureString
$credentials = new-object Management.Automation.PSCredential ($FromEmail, $passwordSecure)
$To = Read-Host 'To Email'
$Subject = Read-Host 'Subject'
$Body = Read-Host 'Body'

$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"

Send-MailMessage -From $fromEmail -to $To -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential $credentials -BodyAsHtml
