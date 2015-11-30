<?php

class Cookie {
    public function exists($name) {
        return (isset($_COOKIE[$name])) ? true : false;
    }
    
    public function get($name) {
        return $_COOKIE[$name];
    }
    
    public function put($name, $value, $expire) {
        if(setcookie($name, $value, time() + $expire, '/')) {
            return true;
        }
        
        return false;
    }
    
    public function delete($name) {
        self::put($name, '', time() - 1);
    }
}
