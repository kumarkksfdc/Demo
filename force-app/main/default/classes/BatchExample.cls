global class BatchExample  implements database.Batchable<sobject>{
    global database.QueryLocator start(database.BatchableContext df)
    {
        return database.getQueryLocator('select id,industry from account ORDER BY Name DESC limit 30');
    }
    global void execute(database.BatchableContext abc,list<account> acsList){
        for(account a:acsList){
            a.industry='Banking';
            a.Email__c='hyd@gmail.com';
        }
        update acsList;
    }
    global void finish(database.BatchableContext fr){
       /* asyncapexjob def=[select id,status,numberoferrors,totaljobitems,createdby.email from asyncapexjob 
                          where id=:fr.getjobId()];
        messaging.SingleEmailMessage se=new messaging.SingleEmailMessage();
        list<string> str=new list<string>();
        str.add(def.CreatedBy.email);
        se.setToAddresses(str);
        se.setsubject('hgefytesdy');
        se.setplaintextbody('WFYTFTYTSDF');
		list<messaging.email> me=new list<messaging.Email>();
        me.add(se);
        messaging.sendEmail(me);
        system.debug(def.CreatedBy.email);*/
    }
}