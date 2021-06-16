//write a schedulable Batch Apex and schedule it
Global class PracticeSchedule2 implements database.Batchable<Sobject>,Schedulable{
    global database.QueryLocator start(database.batchableContext kk){
        return database.getQueryLocator('select Phone from Account');
    }
    global void execute(database.BatchableContext kk ,list<Account> scope){
        for(Account a:scope){
            a.Phone='8096874369';
            update scope;
        }
    }
    global void finish(database.BatchableContext kk){
        
    }
    global void execute(schedulableContext sc){
        PracticeSchedule2 p=new PracticeSchedule2();
        database.executebatch(p,40);
    }
}
//execution:
//PracticeBatch p=new PracticeBatch();
//id jobid=database.executeBatch(p,20);
//PracticeSchedule2 s=new PracticeSchedule2();
//string Expression='0 0 11 4 3 ?';
//id jobid=system.schedule('scheduled',Expression,s);