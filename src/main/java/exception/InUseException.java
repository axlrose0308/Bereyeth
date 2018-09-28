package exception;

public class InUseException extends Exception {
    public InUseException(String name){
        super( "Sorry, " + name + " is responsible for an unfinished seminar.");
    }
}
