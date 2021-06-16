public with sharing class PassParamametersControl {
    
    public boolean input { get; set; }
    
    public boolean output { get; set; }
    
    public customer__C c { get; set; }
    public PassParamametersControl(){
        c=new customer__c();
        input=true;
        output=false;
    }
    
    public void save() {
        output=true;
        input=false;
        c.HM__companyname__c= ApexPages.currentPage().getParameters().get('name');
        c.HM__emailid__c= ApexPages.currentPage().getParameters().get('lastname');
        insert c;
        
    }
    
}