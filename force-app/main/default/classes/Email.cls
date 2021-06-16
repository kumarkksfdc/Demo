public class Email {
    
    public String toadd {set;get;}
    public String bccAdd {set;get;}
    public void plainText(){
        Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
        List<String> toList=new List<String>{'kankarikumar927@gmail.com'};
        List<String> toBcc=new List<String>{'kankarikumar927@gmail.com'};
        msg.setToAddresses(toList);
        msg.setBccAddresses(toBcc);
        msg.setSubject('Test Mail');
        msg.setPlainTextBody('This is a test email');
        msg.setSenderDisplayName('kk');
        Messaging.Email[] emails=new Messaging.Email[]{msg};
        Messaging.sendEmail(emails);
    }
}