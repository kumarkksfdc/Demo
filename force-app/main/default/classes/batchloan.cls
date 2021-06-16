Global class batchloan implements database.Batchable<Sobject> {
    Global database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator('select loan_type__c from loan__c');
    }
    global void execute(database.BatchableContext bc,list<loan__c>scope){
        for(loan__c l:scope){
            l.loan_type__c='house';
        }
        update scope;
    }
    global void finish(database.BatchableContext bc){
        system.debug('success');
        
    }
}
/*execution
 * batchloan b=new batchloan();
id jobid=database.executeBatch(b,5);*/