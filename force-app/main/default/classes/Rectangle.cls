public class Rectangle {
    public void area(){
        Decimal length = 5.5, breadth = 6;
        Decimal a= length * breadth;
        system.debug('Area = '+ a);
    }

    public void perimeter(){
        Decimal length = 5.5, breadth = 6;
        Decimal P= 2* (length + breadth);
        system.debug('Perimeter = '+ P);
    }
}

//Rectangle rec =new Rectangle();
//rec.area();
//rec.perimeter();