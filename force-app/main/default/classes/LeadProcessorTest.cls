@isTest
Private class LeadProcessorTest {
    static testmethod void test(){
        list<Lead> Leads=new list<Lead>();
        for (Integer i=0;i<200;i++) {
            Leads.add(new Lead(lastname='newLead '+i,phone='9948757373',Company='Absyz'));
        }
        insert Leads;
        test.startTest();
        LeadProcessor b=new LeadProcessor();
        Id batchId = Database.executeBatch(b);
        test.stopTest();
        System.assertEquals(200, [select count() from Lead where LeadSource = 'Dreamforce']);
        
    }
    
}