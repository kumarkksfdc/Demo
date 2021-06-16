@isTest
private class PracticeTest {
@isTest
    static void mytest(){
        Account a=new Account();
        a.name='kumar';
        a.Email__c='kumar@gmail.com';
        insert a;
        account b=[select phone from account where id=:a.id];
        system.assertEquals('124567891',b.Phone);
    }
}