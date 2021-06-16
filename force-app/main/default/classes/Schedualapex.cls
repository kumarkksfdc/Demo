public class Schedualapex implements schedulable{
    public void execute(SchedulableContext sc){
       //List<account> acc=[select id from account where createddate=TODAY];
       //delete acc;
       BatchExmpl e=new BatchExmpl();
       //string str='0 0 10 25 6 ?';
       ID JobId=database.executebatch(e,20);
   }
}

/*execution
Schedualapex sc=new Schedualapex();
string str='0 0 10 25 6 ?';
ID JobId=system.schedule('myjob',str,sc);*/

/*List<CronTrigger> jobsToAbort = [select Id from CronTrigger where CronJobDetail.JobType = '7'];
	for (CronTrigger job : jobsToAbort) { 
    System.abortJob(job.Id); 
}
*/