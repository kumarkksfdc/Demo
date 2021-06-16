public class AccountValidationHandler {
    public static void beforeInsert(list<account> acc){
        for(account a:acc){
            if(a.rating=='Hot'){
                if((a.Industry=='' || a.Industry==NULL) && (a.Ownership=='' || a.Ownership==NULL) && (a.ParentId=='' || a.ParentId==NULL)){
                    a.adderror('There are few required fields need to be filed');
                    a.ParentId.adderror('It is a mandatory filed');
                }
            }
            
        }
    }
    public static void beforeDelete(list<account> acc1){
        set<id> Ids=new set<id>();
        list<contact> con=new list<contact>([select lastname,accountid from contact where accountid=:Ids]);
        for(account a:acc1){
            Ids.add(a.id);
        }
        delete con;
    }
    
    
}