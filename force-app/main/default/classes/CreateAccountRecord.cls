public class CreateAccountRecord {
    /*@AuraEnabled
public static void CreateAccountRecord (Account acc){
try{
System.debug('CreateAccountRecord:' + acc);

if(acc!=null){
insert acc;
}

} catch (Exception ex){
}
}  */  
    @AuraEnabled
    
    public static Account saveAccount (Account acc) {
        
        upsert acc;
        return acc;
    }
}