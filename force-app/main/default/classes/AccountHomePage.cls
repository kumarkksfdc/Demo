public class AccountHomePage {
    public account acc   {set;get;}
    public AccountHomePage(apexpages.StandardController controller){
        acc=(account)controller.getrecord();
    }
    public pagereference save(){
        if([select count() from Account where name=:acc.Name]>0){            
            apexpages.addMessage(new apexpages.Message(apexpages.Severity.ERROR,'duplicate exist'));
            return null;
        }else{
            insert acc;
            messaging.SingleEmailMessage email1=new messaging.SingleEmailMessage();
            // email1.setToAddresses();
            string[] ccadd=new string[]{'kankarikuma927@gmail.com'};
                //email1.setccAddresses(ccadd);
            email1.setsubject('conformation mail');
            email1.setplaintextbody('congratulations you have created a lead sucessfully');
            email1.setsenderDisplayname('KUMAR');
            messaging.Email[] email=new messaging.Email[]{email1};
                messaging.sendemail(email);
            return new pagereference('/apex/test11?id='+acc.id);
        }
    }
}