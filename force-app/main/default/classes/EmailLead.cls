public class EmailLead {
    public static void AfterInsert(List<lead> leads){
        list<String> toadd=new list<String>();
        for(lead l:leads){
            toadd.add(l.email);
        }
    	messaging.SingleEmailMessage email1=new messaging.SingleEmailMessage();
        email1.setToAddresses(toadd);
        string[] ccadd=new string[]{'kankarikuma927@gmail.com'};
        email1.setccAddresses(ccadd);
        email1.setsubject('conformation mail');
        email1.setplaintextbody('congratulations you have created a lead sucessfully');
        email1.setsenderDisplayname('KUMAR');
        messaging.Email[] email=new messaging.Email[]{email1};
            messaging.sendemail(email);
          }
    
}