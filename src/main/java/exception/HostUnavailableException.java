package exception;

public class HostUnavailableException extends Exception {
    public HostUnavailableException(String hostName, String date){
        super( hostName + "is unavailable on "+ date);
    }
}
