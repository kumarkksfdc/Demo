public class EmpInformation1 {
    public string name {set;get;}
    public EmpInformation empinfo {set;get;}
    public EmpInformation1(){
        name='kumar';
        empinfo=new EmpInformation();
        
        empinfo.cos=new customer__c();
        empinfo.cos.branches__c='hyd';
        empinfo.cos.loan__c='house';     
        empinfo.cos.pancard__c=123456789; 
         
        empinfo.lon=new loan__c();
        empinfo.lon.amount__c=10000;
        empinfo.lon.loan_type__c='house';     
         
        
        
    }

}