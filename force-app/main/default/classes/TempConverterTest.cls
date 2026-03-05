@isTest
public class TempConverterTest {
	@isTest
    static void testWarmTemp(){
        Decimal celsius = TempConverter.FtoC(70);
        System.assertEquals(21.11,celsius);
    }

    @isTest
    static void testFreezingPoint(){
        Decimal celsius = TempConverter.FtoC(32);
        System.assertEquals(0,celsius);
    }
    
    @isTest
    static void testBoilingPoint(){
        Decimal celsius = TempConverter.FtoC(212);
        System.assertEquals(100,celsius,'Boiling Point Temperature is not expected');
    }
    
    @isTest
    static void testNegativeTemp(){
        Decimal celsius = TempConverter.FtoC(-10);
        System.assertEquals(-23.33,celsius);
    }
}