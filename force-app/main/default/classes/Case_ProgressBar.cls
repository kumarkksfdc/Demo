public class Case_ProgressBar {
	@AuraEnabled
    public static List < String > getselectOptions() {
        string fld = 'Status';
        List < String > allOpts = new list < String > ();
        // Get the object type of the SObject.
        Schema.sObjectType objType = Case.getSObjectType();
        
        // Describe the SObject using its object type.
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
        
        // Get a map of fields for the SObject
        map < String, Schema.SObjectField > fieldMap = objDescribe.fields.getMap();
        
        // Get the list of picklist values for this field.
        list < Schema.PicklistEntry > values =
            fieldMap.get(fld).getDescribe().getPickListValues();
        
        // Add these values to the selectoption list.
        for (Schema.PicklistEntry a: values) {
            allOpts.add(a.getValue());
        }
        system.debug('allOpts ---->' + allOpts);
        return allOpts;
    }
    
    @AuraEnabled
    public static String progSteps(Id recId) {
        Case purchaseStep = [select Status from Case where id =: recId];
        String step = purchaseStep.Status;
        return step;
    }
}