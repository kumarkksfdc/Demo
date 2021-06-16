// write a schedule apex to delete recently created records at particular time and as well as abord this job also..

public class PracticeSchedule implements Schedulable{
    public void execute(SchedulableContext kk){
        list<New_Student_Reg__c> nslist=[select id,name from New_Student_Reg__c where CreatedDate=THIS_WEEK];
        delete nslist;
    }
}
/*
//PracticeSchedule s=new PracticeSchedule();
//string Expression='0 0 11 4 3 ?';
//id jobid=system.schedule('scheduled',Expression,s);
List<CronTrigger> jobsToAbort = [select Id from CronTrigger where CronJobDetail.JobType='7'];
	for (CronTrigger job : jobsToAbort) { 
    System.abortJob(job.Id); 
}
*/