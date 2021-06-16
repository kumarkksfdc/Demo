@isTest
private class test6 {
	@isTest
    static void mytest(){
        apex6 ap=new Apex6();
        ap.accname='kumar';
        ap.Industry='banking';
        ap.Create();
        account acc=[select ownership from account where name=:ap.accname and industry=:ap.Industry];
        if(ap.Industry=='banking'){
            system.assertEquals('public', acc.Ownership);
        }else{
           system.assertEquals('private', acc.Ownership); 
        }
    }
}