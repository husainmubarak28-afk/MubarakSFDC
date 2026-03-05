@isTest
public class EventUtilityTest {
    @isTest
    private static void testEventStatusLength(){
       String res= EventUtility.eventPriority('IND');
        System.assertEquals(null,res);
    }

     @isTest
    private static void testEventStatusForHigh(){
       String res= EventUtility.eventPriority('CA');
        System.assertEquals('High',res);
    }
    
    @isTest
    private static void testEventStatusForMedium(){
       String res= EventUtility.eventPriority('BZ');
        System.assertEquals('Medium',res);
    }
    
}