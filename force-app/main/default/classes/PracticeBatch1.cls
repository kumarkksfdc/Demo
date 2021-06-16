//sending email when a field update 
global class PracticeBatch1 implements Database.batchable<SObject> {
    global database.QueryLocator Start(Database.batchableContext kk){
        return database.getquerylocator('select Contact_no__c,Email_Id__c from New_Student_Reg__c'); 
    }
    global void execute(database.BatchableContext kk,list<New_Student_Reg__c> scope){
        for(New_Student_Reg__c ns:scope){
            ns.Contact_no__c='9916398398';
            update scope;
        }
    }
    global void finish(Database.BatchableContext kk) {
     AsyncApexJob a = [Select Id, Status,ExtendedStatus,NumberOfErrors,JobItemsProcessed,
                       TotalJobItems, CreatedBy.Email from AsyncApexJob where Id =:kk.getJobId()];
          
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            //String[] toAddresses = new String[] {'kankarikumar927@gmail.com'};
           // list<New_Student_Reg__c> toAddresses=new list<New_Student_Reg__c>('select id,Email_Id__c from New_Student_Reg__c');
           // mail.setToAddresses(toAddresses);
            mail.setSubject('Match Merge Batch ' + a.Status);
            mail.setPlainTextBody('records processed ' + a.TotalJobItems +
           'with '+ a.NumberOfErrors + ' failures.');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
 		}
    }