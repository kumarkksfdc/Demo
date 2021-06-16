global class Scheduleempnew  implements Schedulable {
    global void execute (SchedulableContext ctx) {
        batchemp b=new batchemp();
        id jobid=database.executeBatch(b,1);
    }
    /*public static void scheduleBatchMethod(){
        String CRON_EXP = '0 30 8 * *  ?'; 
        BirthdayNotificationsScheduleClass sch = new BirthdayNotificationsScheduleClass(); 
        system.schedule('Daily Scheduled Batch jobs for BirthDay Notifications', CRON_EXP, sch);
    }*/
}