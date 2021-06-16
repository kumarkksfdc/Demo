public class MassDelete {
    public List<Account> accs {set;get;}
    public MassDelete(ApexPages.StandardSetController controller){
        List<String> fields=new List<String>{'Name','Industry','Phone'};
            controller.addFields(fields);
        accs=(List<Account>)controller.getRecords();
    }
    public PageReference deleteRecords(){
        if(accs.size()>0){
            //delete accs;
            Database.delete(accs,false);
            PageReference p=new PageReference('/001/o');
            return p;
        }else{
            return null;
        }
    }
}