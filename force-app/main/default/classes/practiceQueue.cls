public class practiceQueue implements Queueable {
    public void execute(QueueableContext context) {
        Account a = new Account(Name='Acme1',Phone='(415) 555-1212');
        insert a;        
    }
    
}

//execution:
//practiceQueue p=new practiceQueue();
//ID jobID = System.enqueueJob(p);
//AsyncApexJob jobInfo = [SELECT Status,NumberOfErrors FROM AsyncApexJob WHERE Id=:jobID];