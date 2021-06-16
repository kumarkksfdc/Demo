public class constractorwithpar{
    public String name;
    public String branch;
    public integer empage;
    
        public  constractorwithpar(string empname,string branch,integer age){
            name=empname;
            branch=branch;
       		empage=age;
            }
        public void call(){
           	   system.debug('name:'+name);
               system.debug('branch:'+branch);
               system.debug('age:'+empage);
        }

}