global class BatchOptyExpl implements database.Batchable<Sobject> {
    global database.QueryLocator start(database.BatchableContext bc){
       return database.getQueryLocator('select stagename,type from opportunity'); 
    }
    global void execute(database.BatchableContext bc,list<opportunity> scope){
        for(opportunity op:scope){
            op.stagename='Closed Lost';
       }
        update scope;
   }
    global void finish(database.BatchableContext bc){
        
    }
}