<?php

require_once 'core/init.php';

if(Session::exists('home')) {
    echo '<p>' . Session::flash('home') . '</p>';
}

if(Input::exists()) {
    if(Token::check(Input::get('token'))) {
        
    
        $validate = new Validate();
        $validation = $validate->check($_POST, array(
            'username' => array( 'required' => true),
            'password' => array('required' => true)
        ));

        if($validation->passed()) {
            
            $user = new User();
                
                $remember = (Input::get('remember') === 'on') ? true : false;

                $login = $user->login(Input::get('username'), Input::get('password'), $remember);
                
                if($login) {
                    
                    Session::flash('home', 'You have successfully logged in.');
                    Redirect::to('index.php');
                    
                } else {
                    echo 'Failed';
                }
                
                 
           
        } else {
           foreach($validation->errors() as $error) {
               echo $error . '<br>';
           }
        }
    }
}

?>


<form action="" method="POST">
    <div class ="field">
        <label for="username">Username</label>
        <input type="text" name ="username" id="username" value="<?php echo escape(Input::get('username')); ?>" autocomplete="Off">
    </div>
        <div class ="field">
            <label for="password">Password</label>
            <input type="password" name ="password" id="password">
    </div>
    <div class ="field">
        <input type="checkbox" name="remember" id="remember">
        <label for="remember">Remember me</label>
    </div>
    <input type="hidden" name="token" value="<?php echo Token::generate() ?>">
    <input type="submit" value="Register">
</form>

