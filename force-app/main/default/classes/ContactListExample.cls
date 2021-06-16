public class ContactListExample {
    public List<Contact> contacts {set;get;}
    public Account acc {set;get;}
    public List<Opportunity> opportunities {Set;get;}
    public ContactListExample(Apexpages.StandardController controller){
        List<String> fields =new List<String>{'Name','Phone'};
        controller.addFields(fields);
        acc=(Account)controller.getRecord();
        contacts=[select LastName,firstName from Contact where accountId=:acc.Id];
        opportunities=[select Name,stageName from Opportunity where accountId=:acc.id];
    }

}