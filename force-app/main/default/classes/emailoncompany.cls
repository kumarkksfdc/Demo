public class emailoncompany {
    public Static void afterinsert(list<Company__c> company){
        list<messaging.email> email=new list<messaging.email>();
        emailtemplate et=[select id from emailtemplate where name='EM'];
   		 for(Company__c c:company){
             messaging.SingleEmailMessage email1=new messaging.SingleEmailMessage();
             email1.settemplateid(c.Id);
             email1.settargetobjectid(c.Contact__c);
             email1.setwhatid(c.Id);
             email.add(email1);
   }
        messaging.sendemail(email);
    }
}