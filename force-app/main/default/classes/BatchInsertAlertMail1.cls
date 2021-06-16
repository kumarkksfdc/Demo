Global class BatchInsertAlertMail1 Implements Database.Batchable<SObject>{
    Global database.QueryLocator start(database.BatchableContext kk){
        return database.getQueryLocator('select id,name from account');
    }
    Global void Execute(database.BatchableContext k1,list<account> mm){
        for(account a:mm){
            a.industry='energy';
            a.Email__c='kumar123@gmail.com';
        }update mm;
    }
    Global void finish(database.BatchableContext pp){
        messaging.SingleEmailMessage s=new messaging.SingleEmailMessage();
        asyncapexjob status=[select id,status,numberoferrors,createdby.email from asyncapexjob 
                             where id=:pp.getjobid()];
        list<string> toadd=new list<string>();   
        toadd.add(status.createdby.email);
        s.settoAddresses(toadd);
        s.setsubject('AlertMail');
        s.setplaintextbody('WFYTFTYTSDF');
        list<messaging.Email> email=new list<messaging.Email>{s};
            messaging.sendEmail(email);
    }
    
    
}