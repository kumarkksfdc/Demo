public class ScheduleLeadProcess implements schedulable{
    public void execute(SchedulableContext sc){
        LeadProcessor l=new LeadProcessor();
        Id Jobid=database.executeBatch(l,10);
    }
}