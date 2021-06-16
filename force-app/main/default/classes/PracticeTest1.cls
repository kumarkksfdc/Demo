@isTest
private class PracticeTest1 {
@isTest
    static void mytest(){
        account a=new account();
        a.Name='kumaar';
        insert a;
        contact b=new contact();
        b.lastname='kuAAAAmaar';
        insert b;
        //contact con=[select lastname,firstname,accountid from contact limit 1 where id=:a.id];
        //system.assertEquals('kumaar',a.Name);
       	//system.assertEquals('venkey',con.LastName);
    }
}