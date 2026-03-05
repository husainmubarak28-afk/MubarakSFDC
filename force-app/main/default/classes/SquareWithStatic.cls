public class SquareWithStatic {
    
    // method 1
    public static void area(Decimal a){		//void is a return type and if we don't want to return a value to another method then we write void.
        Decimal area;
        area = a * a;
        system.debug('Area = '+ area);
    }
	
    //method 2
    public static void perimeter(Decimal b){
        Decimal peri;
        peri = 4 * b;
        system.debug('Perimeter = '+ peri);
    }

}