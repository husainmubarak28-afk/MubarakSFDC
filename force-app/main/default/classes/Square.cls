public class Square {
    Decimal a;
    
    //Parameterized Constructor
    public Square(Decimal val){
        a=val;
    }
    // method 1
    public void area(){		//void is a return type and if we don't want to return a value to another method then we write void.
        Decimal area;
        area = a * a;
        system.debug('Area = '+ area);
    }
	
    //method 2
    public void perimeter(){
        Decimal peri;
        peri = 4 * a;
        system.debug('Perimeter = '+ peri);
    }
}

//Square s = new Square(6);
//s.area();
//s.perimeter();

//Square s1 = new square(8);
//s1.area();
//s1.perimeter();