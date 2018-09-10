package exception;

import sun.rmi.runtime.Log;

public class LoginFailException extends Exception {
    public LoginFailException(){
        super("Incorrect username or password.");
    }
}
