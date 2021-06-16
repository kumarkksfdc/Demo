public class ContactSearch {
    public string name;
    public string postaladdress;
    public void searchForContacts(){
        list<contact> con=[select ID,lastname,firstname from contact 
                           where (lastname=:name AND MailingPostalCode=:postaladdress)];
    	system.debug('con');
    }

    /* public static List<Contact> searchForContacts(String lastName, String mailingPostalCode) {
        List<Contact> conList = [SELECT Id, Name, LastName, MailingPostalCode
                                 FROM Contact
                                 WHERE LastName = :lastName AND MailingPostalCode = :mailingPostalCode];
        return conList;
    }   */
}