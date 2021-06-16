@isTest
public class BatchOwner1Test {
@isTest
    public static void mytest(){
        owner__c o=new owner__c();
        o.Name='kumar';
        o.email__c='kumar@gmail.com';
        o.salary__c=1000;
        insert o;
        test.starttest();
        BatchOwner1 ow=new BatchOwner1();
        database.executeBatch(ow);
       	test.stoptest();
    }
}