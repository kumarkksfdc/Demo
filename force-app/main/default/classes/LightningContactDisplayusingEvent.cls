public class LightningContactDisplayusingEvent {
    @AuraEnabled
    /*public static Contact[] queryContactRecords(){
Contact[] a=[select Name,Email from Contact limit 10];
System.debug(a);
return a;
}
*/   public static Contact[] queryContactRecords(){
    Contact[] a=[select Name,AccountId from Contact limit 10];
    System.debug(a);
    return a;
}    
    
    
}