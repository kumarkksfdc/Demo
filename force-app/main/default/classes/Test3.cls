@isTest
private class Test3 {
    testmethod static void testMe(){
        Apex3 ap=new Apex3();
        ap.industry='Energy';
        ap.setData();
        System.assertEquals('1111',ap.phone);
        System.assertEquals('Warm',ap.rating);
        ap.industry='Banking';
        ap.setData();
        System.assertEquals('2222',ap.phone);
        System.assertEquals('Cold',ap.rating);
    }
}