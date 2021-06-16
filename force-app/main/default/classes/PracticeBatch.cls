Global class PracticeBatch implements database.Batchable<Sobject>{
    global database.QueryLocator start(database.batchableContext kk){
        return database.getQueryLocator('select Phone from Account');
    }
    global void execute(database.BatchableContext kk ,list<Account> scope){
        for(Account a:scope){
            a.Phone='9916398394';
            update scope;
        }
    }
    
    global void finish(database.BatchableContext kk){
        BatchExample e=new BatchExample();
    }
}
//execution:
//PracticeBatch p=new PracticeBatch();
//id jobid=database.executeBatch(p,20);