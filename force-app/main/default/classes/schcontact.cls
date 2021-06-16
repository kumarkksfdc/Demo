public class schcontact implements schedulable{
    public void execute(SchedulableContext sc){
        List<contact> acc=[select id from contact where createddate=TODAY];
        delete acc;
        
    }

}

/*execution
Schedualapex sc=new Schedualapex();
string str='0 0 10 25 6 ?';
ID JobId=system.schedule('myjob',str,sc);*/