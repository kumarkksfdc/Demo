public class futureMixDML {
   public void tarun(){
       userRole r=[select id from userRole where name='ceo' ]; 
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard Platform User'];
        user u=new user();
        u.lastname='ravulapally';
        u.Alias='arn';
        u.Email='Arun@gmail.com';
        u.Username='arun143@gmail.com';
        u.CommunityNickname='A*';
        u.UserRoleId=r.id;
        u.ProfileId=p.id;
        u.languagelocalekey='en_US'; 
        u.localesidkey='en_US';
        u.emailencodingkey='UTF-8';
        u.timezonesidkey='America/Los_Angeles';
        insert u;
        kumar();
    }
    @future
    public static void kumar(){
        account acc=new account();
        acc.name='tarun';
        acc.phone='2356';
        insert acc;
       
    }
}