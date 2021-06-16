public class StudentDetails {
    Public string name  		{set;get;}
    public string collegename 	{set;get;}
    public String phone 		{set;get;}
    
    Public studentdetails(){
        collegename='ACE ENGINEERING COLLEGE';
    }
    public void callme(){
            system.debug(name);
    		system.debug(collegename);
    		system.debug(phone);
         }
}