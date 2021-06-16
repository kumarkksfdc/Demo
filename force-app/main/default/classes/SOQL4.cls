public class SOQL4 {
    public list<account> accs		{set;get;}
    public SOQL4(){
        accs=[select name,phone,industry from account];
    }
    public void setlimit(){
        accs=[select name,phone,industry from account limit 5];
    }
	public void setoffset(){
        accs=[select name,phone,industry from account offset 20];
    }
    public void setlimitoffset(){
        accs=[select name,phone,industry from account limit 5 offset 10];
    }
    public void fetchall(){
        accs=[select name,phone,industry from account ALL ROWS];
    }
    public void sortASC(){
        accs=[select name,phone,industry from account order by name asc];
    }
    public void sortDESC(){
        accs=[select name,phone,industry from account order by name,industry desc];
    }
}