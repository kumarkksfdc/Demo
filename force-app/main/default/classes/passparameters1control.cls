public with sharing class passparameters1control {

    public customer__c p { get; set; }
    public passparameters1control (){
    p=new customer__c();
    }

    public PageReference nextpage() {
   
    PageReference pr=new PageReference ('/apex/testpage2?name='+p.HM__companyname__c+'&lastname='+p.HM__emailid__c);
        return pr;
    }

}