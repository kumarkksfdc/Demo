public class customsetting{
    public List<Custom__c> code {get;set;}
   
    public customsetting()
    {
        Map<String,Custom__c> allCodes = Custom__c.getAll();
        code = allCodes.values();
    }  
   
}
//access single record:
//Custom__c c=Custom__c.getOrgDefaults();
//system.debug(c.phone__c);
//system.debug(c.email__c);

/*------------
 
Custom__c c=Custom__c.getInstance('kumar');
Custom__c c=Custom__c.getvalues('kumar');
system.debug(c.phone__c);
system.debug(c.email__c);
*/