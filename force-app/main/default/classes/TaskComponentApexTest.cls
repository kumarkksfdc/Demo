@IsTest  
public class TaskComponentApexTest {
    @TestSetup  
    public static void setup() {
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        insert testAccount;
        
        Contact cont = new Contact();
        cont.FirstName='Test';
        cont.LastName='Test';
        cont.Accountid= testAccount.id;
        insert cont;
        
        task task=new task();
        task.WhatId = testAccount.id;
        task.WhoId = cont.Id;
        task.Subject = 'Other';
        task.status = 'Not Started';
        task.description = 'New  Work';
        insert task;
    }
    @IsTest
    public static void TaskComponentApexTestMethod() {
        Account acc=[select id,name,ownerId from account limit 1];
        
        UserRole r = new UserRole(DeveloperName = 'test', Name = 'bajaj');
        insert r;
        User u = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard User'].Id,
            LastName = 'Bajaj finance',
            Email = 'bajaj@gmail.com',
            Username = 'bajaj@gmail.com' + System.currentTimeMillis(),
            CompanyName = 'BAJAJ',
            Title = 'title',
            Alias = 'alias',
            TimeZoneSidKey = 'America/Los_Angeles',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            UserRoleId = r.Id
        );
        insert u;
        User us = [select FirstName, Id, LastName, UserRoleId, UserRole.Name from User where id=:u.id];
        UserRole role = [Select Id, Name, DeveloperName, ParentRoleId From UserRole Where Id=:us.UserRoleId];
        
        TaskComponentApex.getAccountOwner(acc.Id);
        TaskComponentApex.getselectOptions(acc.Id);
        TaskComponentApex.getUsersList(us.id);
        
    }
    @IsTest
    public static void TaskComponentApexTestMethod1() {
        List<User> ulist = [select FirstName, Id, LastName, UserRoleId,Name from User ];
        Account acc=[select id,name,ownerId from account limit 1];
        list<contact> contactlist = [select FirstName,accountId,Id, LastName from contact where accountId=:acc.Id];
        User us = [select FirstName, Id, LastName, UserRoleId,Name from User limit 1];
        Task tas=[select id,WhatId,OwnerId,Priority,Status,Subject,ActivityDate,Type from Task where WhatId=:acc.id];
        tas.OwnerId=us.Id;
        update tas;
        TaskComponentApex.saveTask(tas, contactlist,ulist);
    }
}