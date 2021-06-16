public class LeadConverterNew {
    @invocableMethod
    public static void LeadAssign(list<Id> LeadId){
        LeadStatus status=[select id,masterLabel from LeadStatus where IsConverted=true limit 1];
        List<database.LeadConvert> cLead=new  List<database.LeadConvert>();
        for(id l:LeadId){
            database.LeadConvert leadCon=new database.LeadConvert();
            leadCon.setLeadId(l);
            leadCon.setConvertedStatus(status.MasterLabel);
            //leadCon.setDoNotCreateOpportunity(true);
            cLead.add(leadCon);
        }
        list<database.LeadConvertResult> lcr=database.convertLead(cLead);
    }

}