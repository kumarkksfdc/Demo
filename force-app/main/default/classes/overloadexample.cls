public class overloadexample {
    public void add(){
        integer aval=10;
         integer bval=10;	
         integer cval=aval+bval;
             system.debug(cval);
         }
    public void add(integer aval){
        integer bval=30;
        system.debug(aval+bval);
         }
    public void add(string name){
        system.debug(name);
         }
    public void add(string name,integer age){
        system.debug('name followed by age');
    }                      
}