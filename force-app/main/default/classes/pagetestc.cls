public class pagetestc {
    public String baseURL {set;get;}
    public void add(){
        baseURL=URL.getSalesforceBaseUrl().toExternalForm();
    }
   
}