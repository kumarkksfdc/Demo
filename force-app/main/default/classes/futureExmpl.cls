public class futureExmpl {
    public void call(){
        system.debug('1');
        system.debug('2');
        tarun();
        system.debug('3');
        kumar();
        system.debug('4');
        
    }
    @Future
    public static void tarun(){
        system.debug('5');system.debug('6');
    }
    
    @Future
    public static void kumar(){
        system.debug('7');system.debug('8');
    }

}