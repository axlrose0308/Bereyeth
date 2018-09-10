package exception;

import org.springframework.web.bind.annotation.RequestParam;

public class RegisteredException extends Exception {
    public RegisteredException(String email){
        super("Email "+email+" has already registered for this seminar.");
    }
}
