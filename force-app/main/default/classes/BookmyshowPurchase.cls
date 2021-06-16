public class BookmyshowPurchase {
    public List<Id> key;
    public void purchase(list<Purchase__C> purch){
        key=new list<Id>();
        for(Purchase__c p: purch){
          	key.add(p.id);          
        }
        Purchase__c p =[select Id,Name,Category__c,Date__c,Mail_id__c,Mobile_Number__c,Movie__c,No_of_Tickets__c,Purchase_Id__c,Theater__c from Purchase__c where id in:key];
    	Account acc= [select id,phone,Email__c,Name,Account_Id__c from Account where phone=:string.valueof(p.Mobile_Number__c)];
    	Contact con = new Contact();
        con.LastName=acc.Name;
        con.FirstName=p.Name;
        con.AccountId=acc.Account_Id__c;
        con.Purchase_Id__c=p.Purchase_Id__c;
        con.End_Date__c=p.Date__c;
        insert con;
    }
}