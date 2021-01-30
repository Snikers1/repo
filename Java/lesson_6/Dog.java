public class Dog extends Animal{
    String name;
    public static int count_dogs;

    public Dog(){
        super(); // вызываем конструктор родительского класса
        count_dogs++;
    }

    // собаки не бегают больше 500 м
    @Override
    protected void run(int len) {
        if (len > 500)
        {
            System.out.println("Напомню тебе : я пес, а не лошадь." +
                    "\nЯ пробежал 500 м. Дальше сам беги, я устал");
        }
        else
        {
            super.run(len);
        }
    }

    @Override
    protected void swim(int len) {
        if (len > 10)
        {
            System.out.println("Больше 10 м плыть не буду!");
        }
        else
        {
            super.swim(len);
        }
    }
}
