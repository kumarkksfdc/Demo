@isTest
private class test5 {
    testmethod static void mytest(){
        apex5 ap=new apex5();
        ap.industry='banking';
        ap.call();
        system.assertEquals('kumar',ap.name);
        system.assertEquals('23553',ap.phone);
        ap.industry='energy';
        ap.call();
        system.assertEquals('kankari kumar',ap.name);
        system.assertEquals('23553123189',ap.phone);
    }

}