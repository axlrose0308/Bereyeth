package model;

public class Email {

    public static final int SEMINAR_CHANGED = 1;
    public static final int SEMINAR_CANCELLED = 2;

    private String host;

    private String sender;

    private String senderName;

    private String senderPssword;

    /**
     * Receiver addresses，divided by ";"
     */
    private String[] recipients;

    private String subject;

    private String content;

    public Email(String[] recipients, int messageType, Seminar seminar){
        setRecipients(recipients);
        setSubject("Notification of Seminar");
        setContent(messageType, seminar);
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    private void setContent(int messageType, Seminar seminar){
        StringBuilder builder = new StringBuilder();
        builder.append("<html><body>Dear sir or madam, <br/><br/>");
        switch (messageType){
            case SEMINAR_CANCELLED:
                builder.append("We are sorry to inform you that seminar no. " + seminar.getId() + " " +
                        seminar.getSubject() + " in " + seminar.getHoldDate() + " at " + seminar.getTime()
                        + " has been cancelled.");
                break;
            case SEMINAR_CHANGED:
                builder.append("We are here to inform you that detail of seminar no. " + seminar.getId() +
                        " has been changed. Please check our website for up-to-date information.");
        }
        builder.append("<br/><br/>Best Regards, ");
        builder.append("<br/>Seminar management system");
        builder.append("</body></html>");
        setContent(builder.toString());
    }

    public String[] getRecipients() {
        return recipients;
    }

    public void setRecipients(String[] recipients) {
        this.recipients = recipients;
    }
}
