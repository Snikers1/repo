public class Cat extends Animal{
    String name;
    public static int count_cats;

    public Cat()
    {
        super(); // вызываем конструктор родительского класса
        count_cats++;
    }

    @Override
    protected void swim(int len) {
        System.out.println("Я - кот и я отказываюсь плыть!");
    }

    // коты не бегают больше 200 м
    @Override
    protected void run(int len) {
        if (len > 200)
        {
            System.out.println("Напомню тебе: я кот,а не лошадь!" +
                    "\nЯ пробежал 200 м. Дальше сам беги, я устал");
        }
        else
        {
            super.run(len);
        }
    }
}
