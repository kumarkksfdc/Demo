@isTest
public class BatchExamplTest {
    static testMethod void BatchExamplTestMethod() {
        Account acc=new Account();
        acc.name='test';
        acc.phone='1234325167';
        insert acc;
        
        HM__SnapShot__c Op1=new HM__SnapShot__c();
        Op1.HM__Industry__c='Energy';
        Op1.HM__count__c=123;	
        Op1.HM__Created_Date__c=system.today();
        insert Op1;
        
        Test.StartTest();
        BatchExmpl b=new BatchExmpl();
        Id jobId=database.executeBatch(b, 200);
        Test.stopTest();
        
    }
}