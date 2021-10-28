global class ScheduleCurrenciesCallouts implements Schedulable {
    global static void execute(SchedulableContext ctx) {
        CurrenciesCallouts.makeGetCallout();     
    }

    public static void init(String CRON_EXP) {
        ScheduleCurrenciesCallouts scheduler = new ScheduleCurrenciesCallouts();
        String schedule = CRON_EXP;
        String jobId = System.schedule('Schedule Currencies Callouts', schedule, scheduler);
    }
}