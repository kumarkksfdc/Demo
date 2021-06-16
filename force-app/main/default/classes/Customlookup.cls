public class Customlookup{
    Task task = new Task();
    public Customlookup(ApexPages.StandardController controller) {
        this.task = (Task)controller.getRecord();  
    }
    
}