public class ICICIBank {
    public Decimal balance		{set;get;}
    public string customername	{set;get;}
    public Decimal amount 		{set;get;}
    public ICICIBank(){
        balance=6000;
       }
    public void deposit(){
        balance=balance+amount;
    }
    public void withdrawal(){
         balance=balance-amount;
    }
    
}