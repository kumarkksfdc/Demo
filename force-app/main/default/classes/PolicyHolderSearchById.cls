public class PolicyHolderSearchById {
    public string name='kumar';
    public string postaladdress='500036';
    public void searchForContacts(){
        list<contact> con=[select ID,lastname,firstname from contact 
                           where (lastname=:name AND MailingPostalCode=:postaladdress)];
    	system.debug('con');
    }
}