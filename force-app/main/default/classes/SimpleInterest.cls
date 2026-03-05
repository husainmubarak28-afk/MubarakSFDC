public class SimpleInterest {
    public static void calc(){
        Decimal prin =5000,rate=10,t=3;
        Decimal si=(prin*rate*t/100);
        system.debug('Simple Interest = '+ si);
    }
}