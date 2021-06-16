public class fetchContactDetails {
   @AuraEnabled

    public static list<Contact> fetchContactList(){

        return [select Id, name, Email from contact limit 10];             

    }
}