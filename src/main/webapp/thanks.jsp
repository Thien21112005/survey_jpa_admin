<!doctype html>
<html>

<head>
  <meta charset="utf-8">
  <title>Murach's Java Servlets and JSP</title>
  <link rel="stylesheet" href="styles/main.css" type="text/css" />
</head>
<%--hehe--%>

<body>
<h1>Thanks for joining our email list</h1>
<p>Here is the information that you entered:</p>

<table>
  <tr>
    <td><label>Email:</label></td>
    <td><span>${user.email}</span></td>
  </tr>
  <tr>
    <td><label>First Name:</label></td>
    <td><span>${user.firstName}</span></td>
  </tr>
  <tr>
    <td><label>Last Name:</label></td>
    <td><span>${user.lastName}</span></td>
  </tr>
  <tr>
    <td><label>Date of Birth:</label></td>
    <td><span>${user.dateOfBirth}</span></td>
  </tr>
  <tr>
    <td><label>Heard About Us From:</label></td>
    <td><span>${user.hearAboutUs}</span></td>
  </tr>
  <tr>
    <td><label>Want Announcements:</label></td>
    <td><span>${user.wantAnnouncements ? '     Yes   ' : '   No    '}</span></td>
  </tr>
  <tr>
    <td><label>Want Emails:</label></td>
    <td><span>${user.wantEmails ? '   Yes' : '   No'}</span></td>
  </tr>
  <tr>
    <td><label>Contact Method:</label></td>
    <td><span>${user.contactMethod}</span></td>
  </tr>
</table>

<p>To enter another email address, click on the Back
  button in your browser or the Return button shown
  below.
</p>
<form action="" method="get">
  <input type="hidden" name="action" value="join">
  <input type="submit" value="Return">
</form>
</body>

</html>