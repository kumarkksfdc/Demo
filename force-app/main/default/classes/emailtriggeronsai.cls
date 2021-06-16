public class emailtriggeronsai {
    public static void Afterinsert(list<sai__c> saitharun){
        list<string> toadd=new list<string>();
        list<string> m=new list<string>();
        for(sai__c s:saitharun){
        toadd.add(s.email__c);
            m.add(s.phn__c);
		messaging.SingleEmailMessage email1=new messaging.SingleEmailMessage();
    	email1.setToAddresses(toadd);
        email1.setsubject('welcome');
        email1.setplaintextbody('phone ni is :'+m);
        email1.setsenderDisplayname('kumar');
        messaging.Email[] emails=new messaging.Email[]{email1};
        messaging.sendemail(emails);
        }
}
}