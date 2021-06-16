@isTest
private class test4 {
    testmethod static void mytest(){
        apex4 ap=new apex4();
        ap.Create();
        integer c=[select count() from account];
        system.assertEquals(1,c);
        ap.show();
        integer a=[select count() from contact where accountid=:ap.acc.id];
        system.assertEquals(1,a);
    }

}