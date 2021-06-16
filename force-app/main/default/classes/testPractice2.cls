@isTest
private class testPractice2 {
    @isTest 
    static void mytest1(){
        New_Student_Reg__c n=new New_Student_Reg__c();
        n.name='kumar';
        n.HM__Email_Id__c='kumar@gmail.com';
        n.HM__Institutes__c=n.Id;
        insert n;
        
        IT_Courses__c itc=new IT_Courses__c();
        itc.Name='test';
        insert itc;
        
        Non_IT_Courses__c nonit=new Non_IT_Courses__c();
        nonit.name='test1';
        insert nonit;
        
        Institutes__c i=new Institutes__c();
        i.name='kk';
        insert i;
    }
}