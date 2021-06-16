public class PaginationExample1 {
    public ApexPages.StandardSetController controller {set;get;}
    public PaginationExample1(){
      	List<Opportunity> opty=[select name,stagename ,amount from Opportunity];
        controller=new ApexPages.StandardSetController(opty);
        controller.setPageSize(5);
    }
    public List<Opportunity> getOpty(){
        List<Opportunity> opty=(List<Opportunity>)controller.getRecords();
        return opty;
    }
}