public class RectangleWithStatic {
    public static void area(){
        Decimal length = 5.5, breadth = 6;
        Decimal a= length * breadth;
        system.debug('Area = '+ a);
    }

    public static void perimeter(){
        Decimal length = 5.5, breadth = 6;
        Decimal P= 2* (length + breadth);
        system.debug('Perimeter = '+ P);
    }
}

//RectangleWithStatic.area();
//RectangleWithStatic.perimeter();