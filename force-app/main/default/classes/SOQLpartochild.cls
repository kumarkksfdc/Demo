public class SOQLpartochild {
    public list<account> accs		{set;get;}	
    public SOQLpartochild(){
        accs=[select name,phone,(select lastname,phone from contacts where phone='')
              			from account where phone!=''];
    }

}