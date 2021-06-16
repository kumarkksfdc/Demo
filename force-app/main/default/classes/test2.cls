@isTest
private class test2 {
    @isTest
    static void mytest(){
        Apex2 ap=new Apex2();
        ap.create();
        system.assertEquals('damu', ap.acc.name);
        system.assertEquals('994875875', ap.acc.phone);
        ap.reset();
        system.assertEquals(null, ap.acc.name);
        system.assertEquals(null, ap.acc.phone);
        
    }

}