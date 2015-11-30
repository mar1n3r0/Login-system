<?php 

require_once 'core/init.php';
date_default_timezone_set('Europe/Sofia');

if(Input::exists()) {
    if(Token::check(Input::get('token'))) {
        
    
        $validate = new Validate();
        $validation = $validate->check($_POST, array(
            'username' => array(
                'required' => true,
                'min' => 3,
                'max' => 20,
                'unique' => 'users',
                'alpha' => true
            ),
            'password' => array(
                'required' => true,
                'min' => 6,
                'max' => 64
            ),
            'password_again' => array(
                'required' => true,
                'matches' => 'password'
            ),
            'name' => array(
                'required' => true
            )
        ));

        if($validation->passed()) {
            
            $user = new User();
            $salt = utf8_decode(Hash::salt(32));
            
            try{
                
                $user->create('users', array(
                'username' => Input::get('username'),
                'password' => Hash::make(Input::get('password'), $salt),
                'salt' => $salt,
                'name' => Input::get('name'),
                'joined' => date('Y-m-d H:i:s'),
                'group' => 1
            ));
                 Session::flash('home', 'You have successfully registered and can now log in!');
                 Redirect::to('login.php');
            } catch (Exception $ex) {
                 Redirect::to(404);
                die($ex->getMessage());
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
        <label for="password_again">Enter your password again</label>
        <input type="password" name ="password_again" id="password_again">
    </div>
    <div class ="field">
        <label for="name">Name</label>
        <input type="text" name ="name" value="<?php echo escape(Input::get('name')); ?>" id="name">
    </div>
    <input type="hidden" name="token" value="<?php echo Token::generate() ?>">
    <input type="submit" value="Register">
</form>
