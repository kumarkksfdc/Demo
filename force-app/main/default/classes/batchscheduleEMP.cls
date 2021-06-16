Global class batchscheduleEMP Implements database.Batchable<SObject>{
    global database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator('select employee_type__c,phone__c from employee__c');
    }
    global void execute(database.BatchableContext bc,list<employee__c> scope){
        for(employee__c e:scope){
            e.employee_type__c='contract';
            e.phone__c='9666222637';
        }
        update scope;
    }
    global void finish(database.BatchableContext bc){
        system.debug('update sucessfully');
    }
    public class schcontact implements schedulable{
        public void execute(SchedulableContext sc){
            batchscheduleEMP b=new batchscheduleEMP();
            database.executeBatch(b,5);
        }
    }
}