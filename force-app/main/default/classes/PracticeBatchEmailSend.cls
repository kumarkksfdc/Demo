Global class PracticeBatchEmailSend implements Database.Batchable<SObject>, Database.Stateful{
    global list<string> ToAddress=new list<string>(); 
    
    global database.QueryLocator start(database.BatchableContext kk){
        return database.getquerylocator('select Contact_person__c,curr__c,Email__c from Institutes__c');
    }
    global void execute(database.BatchableContext kk,list<Institutes__c> institutes){
        for(Institutes__c ins: institutes){
            ins.Contact_no__c='8988898989';
            ToAddress.add(ins.Email__c);
        }update institutes;
    }
    list<string> updatedvalue=new list<string>();
    global void finish(database.BatchableContext kk){
        System.debug(ToAddress);
        list<Institutes__c> i=[select Contact_person__c,curr__c,Email__c,HM__Contact_no__c from Institutes__c];
        for(Institutes__c inst:i){
            updatedvalue.add(inst.HM__Contact_no__c);
            messaging.SingleEmailMessage mail=new messaging.SingleEmailMessage();
            mail.setToAddresses(ToAddress);
            string[] ccAddresses=new string[] {'kankarikumar927@gmail.com'};
                mail.setCcAddresses(ccAddresses);
            mail.setSubject('phone no update');
            mail.setplaintextbody('Phone no updated as:'+updatedvalue);
            list<messaging.Email> emails=new list<messaging.Email>{mail};
                messaging.sendemail(emails);  
        }
    }
}