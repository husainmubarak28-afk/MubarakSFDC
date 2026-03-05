public class RectangleWithConstructor {
	 Decimal length,breadth;
    //Constructor
    public RectangleWithConstructor(Decimal l,Decimal b){
    length = l;
    breadth = b;
    }
    //Method 1
    public void area(){ 
        Decimal a= length * breadth;
        system.debug('Area = '+ a);
    }
	//Method 2
    public void perimeter(){
        Decimal P= 2* (length + breadth);
        system.debug('Perimeter = '+ P);
    }
}
//RectangleWithConstructor rec = new RectangleWithConstructor(4,5);
//rec.area();
//rec.perimeter();