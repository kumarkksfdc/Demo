Global class batchemp Implements database.Batchable<SObject>{
    global database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator('select employee_type__c,phone__c from employee__c');
    }
    global void execute(database.BatchableContext bc,list<employee__c> scope){
        for(employee__c e:scope){
            e.employee_type__c='contract';
            e.phone__c='8096874369';
        }
        update scope;
    }
    global void finish(database.BatchableContext bc){
        system.debug('update sucessfully');
    }
}