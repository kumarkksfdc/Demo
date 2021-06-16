Global class BatchOwner1 implements database.Batchable<SObject> {
    Global Database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator('select email__c,phone__c,salary__c from owner__c');
    }
    global void execute(database.BatchableContext bc,list<owner__c> scope){
        for(owner__c o:scope){
            if(o.salary__c < 2000){
                      }
        }
    delete scope;
    }
    Global void finish(database.BatchableContext bc){
        system.debug('update successfully'); 
    }
}