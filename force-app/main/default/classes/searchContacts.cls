public with sharing class searchContacts{
    public List<Contact> contacts { get; set; }
    public String name { get; set; }
    public String mailingState { get; set; }
	public searchContacts()
    {
        contacts = new List<Contact>();
    }
    public PageReference searchContacts()
    {
        contacts = [select Id,Name,MailingState from Contact where Name = :name and MailingState = :mailingState];
        return null;
    }
}