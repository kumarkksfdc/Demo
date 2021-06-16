@isTest
private class test1 {
    @isTest
    Static void mytest(){
        Apex1 ap=new Apex1();
        ap.dis();
        system.assertEquals('kumar', ap.name);
        ap.dis1();
        system.assertEquals(40000, ap.sal);
        
        
    }

}