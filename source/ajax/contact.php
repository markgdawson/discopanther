<?php 
$errors = '';
$myemail = 'markgdawson@gmail.com';

if(empty($_POST['name'])  &&
   empty($_POST['email']) &&
   empty($_POST['message']))
 {
  $errors = "";
 }
 else 
 {
   if(empty($_POST['name'])  || 
      empty($_POST['email']) || 
      empty($_POST['message']))
   {
       $errors .= "\n all fields are required";
   }

   $name = $_POST['name']; 
   $email_address = $_POST['email']; 
   $message = $_POST['message']; 
   $tel = $_POST['tel']; 

   if (!preg_match(
   "/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/i", 
   $email_address))
   {
       $errors .= "\n invalid email address";
   }

   if( empty($errors))
   {
   	$to = $myemail; 
   	$email_subject = "Contact form submission: $name";
   	$email_body = "You have received a new message. ".
   	" Here are the details:\n Name: $name \n Email: $email_address \n Number: $tel \n Message \n $message"; 

   	$headers = "From: $myemail\n"; 
   	$headers .= "Reply-To: $email_address";

   	mail($to,$email_subject,$email_body,$headers);
   	//redirect to the 'thank you' page
   	header('Location: contact-thanks.html');
   } 
 }
?>

<i>
<?php
echo nl2br($errors);
?>
</i>
<form method="POST" name="contactform" action="contact.php"> 
<p>
<label for='name'>Name:</label> <br>
<input type="text" name="name">
</p>
<p>
<label for='email'>Email Address:</label> <br>
<input type="text" name="email"> <br>
</p>
<p>
<label for='email'>Phone Number:</label> <br>
<input type="text" name="tel"> <br>
</p>
<p>
<label for='message'>Message:</label> <br>
<textarea name="message"></textarea>
</p>
<input type="submit" value="Submit" name="Submit"><br>
</form>