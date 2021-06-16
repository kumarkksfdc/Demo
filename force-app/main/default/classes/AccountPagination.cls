public class AccountPagination {
    public ApexPages.StandardSetController controller {set;get;}
    public AccountPagination(){
        list<account> acc=[select name,phone,fax from account];
        controller=new apexpages.StandardsetController(acc);
       	controller.setPageSize(10);
    }
    public list<Account> getacc(){
        list<Account> acc=(list<Account>)controller.getRecords();
        return acc;
    }
}