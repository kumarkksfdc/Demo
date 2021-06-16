public class BankIntrest {
    Public Decimal amount {set;get;}
	public  Integer rate {set;get;}
    public  Integer years {set;get;}
    public decimal intrest {set;get;}	
    	
    public BankIntrest(){
        rate=3;
        }
        
    Public void calculate(){
        intrest=(amount*rate*years)/100;
    }
    
    public void reset(){
        amount=null;
        rate=null;
        years=null;intrest=null;
        
    }
}