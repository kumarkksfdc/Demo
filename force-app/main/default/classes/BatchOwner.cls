Global class BatchOwner implements database.Batchable<SObject> {
    Global Database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator('select email__c,phone__c from owner__c');
    }
    global void execute(database.BatchableContext bc,list<owner__c> scope){
        for(owner__c o:scope){
            o.email__c='kumar@gmail.com';
            o.phone__c='8096874369';
        }
    update scope;
    }
    Global void finish(database.BatchableContext bc){
        system.debug('update successfully'); 
    }
}