public class Listofaccountsapex{ 
    public List<Account> records {get; set;} 
    public Listofaccountsapex(){ 
        records = [select Name,HM__gender__c, AccountNumber from Account]; 
    } 
}