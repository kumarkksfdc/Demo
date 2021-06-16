global class batchsaithaun implements database.Batchable<sobject>{
    global database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator('select phn__c,email__c from sai__c');
    }
    global void execute(database.BatchableContext bc,list<sai__c> saitharun){
        string em;
        for(sai__c s:saitharun){
            s.phn__c='9700124129';
            em=s.email__c;
        }
        update saitharun;
    }
    global void finish(database.BatchableContext bc){
        messaging.SingleEmailMessage email=new messaging.SingleEmailMessage();
        string[] toadd=new string[]{'kumar@gmail.com'};
        email.settoaddresses(toadd);
        email.setsubject('status of the job');
        string body='<h1> batch job:'+bc.getjobId();
        asyncapexjob job=[select NumberOfErrors,status,TotalJobItems from asyncapexjob where id=:bc.getjobid()];
        body=body+'<br/> TotalJobItems:'+job.TotalJobItems;
        body=body+'<br/> status:'+job.Status;
        email.sethtmlbody(body);
        messaging.Email[] emails=new messaging.Email[]{email};
        messaging.sendemail(emails);        
    }
}