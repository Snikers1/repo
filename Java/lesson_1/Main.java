/*
 author: Bessonov Roman
 @param - args

*/

public class Main {
    // однострочный комментарий
    public static void main (String [] args)
    {
        float result = calculations(2.2f, 3.3f, 4.4f, 5.5f);
        boolean checkIn;
        int number = -10;
        System.out.println("result : " + result);
        checkIn = isBetween(6, 5);
        System.out.println("checkIn = " + checkIn);
        isPositive(15);
        System.out.println(isNegative(number));
        helloUser("Пеппа");
        System.out.println(isLeapYear(100));
    }

    public static float calculations( float a, float b, float c, float d)
    {
        return a * (b + c/d);
    }
    /*
    * Написать метод, принимающий на вход два целых числа и проверяющий,
    * что их сумма лежит в пределах от 10 до 20 (включительно),
    * если да – вернуть true, в противном случае – false.
    */
    public static boolean isBetween(int first_num, int second_num)
    {
        boolean isIn;
        if (first_num + second_num >= 10 && first_num + second_num <= 20)
        {
            isIn = true;
        }
        else
        {
            isIn = false;
        }
        return isIn;
    }
    /* Написать метод, которому в качестве параметра передается целое число,
       метод должен напечатать в консоль, положительное ли число передали или отрицательное.
       Замечание: ноль считаем положительным числом.
    */
    public static void isPositive(int number)
    {
        if (number >= 0)
        {
            System.out.println("Число " + number + " положительное");
        }
        else
        {
            System.out.println("Число " + number + " отрицательное");
        }
    }
    /* Написать метод, которому в качестве параметра передается целое число.
       Метод должен вернуть true, если число отрицательное, и вернуть false если положительное.*/
    public static boolean isNegative(int number)
    {
        boolean isNeg = true;
        if (number >= 0)
        {
            isNeg = false;
        }
        return isNeg;
    }

    /* Написать метод, которому в качестве параметра передается строка, обозначающая имя.
       Метод должен вывести в консоль сообщение «Привет, указанное_имя!».*/
    public static void helloUser(String userName)
    {
        System.out.println("Hello, " + userName + "!");
    }
    /*  Написать метод, который определяет, является ли год високосным, и выводит сообщение в консоль.
        Каждый 4-й год является високосным, кроме каждого 100-го, при этом каждый 400-й – високосный
    */
    public static boolean isLeapYear(int year)
    {
        boolean leapYear = false;
        if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
        {
            leapYear = true;
        }
        return leapYear;
    }
}
