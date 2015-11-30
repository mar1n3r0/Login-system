<?php

require_once 'core/init.php';

if(Session::exists('home')) {
    echo '<p>' . Session::flash('home') . '</p>';
}

$user = new User();

if($user->isLoggedIn()) {
?>
<p>Hello <a href="profile.php?user=<?php echo escape($user->data()->username); ?>"><?php echo escape($user->data()->username); ?></a></p>
<ul>
    <li><a href="logout.php">Log out</a></li>
    <li><a href="update.php">Update details</a></li>
    <li><a href="changepassword.php">Change password</a></li>
    <li><a href="profile.php">Profile</a></li>
</ul>
<?php

    if($user->hasPermission('moderator')) {
        echo "You are a moderator!";
    } 
}else {
    echo 'You need to <a href ="register.php">Register</a> or <a href="login.php">Login</a>';
}