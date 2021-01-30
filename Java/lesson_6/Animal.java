public class Animal {
    private String name;
    public static int count_animals;

    // конструктор родительского класса
    public Animal() {
        count_animals++;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // Все животные могут бежать и плыть
    protected void run(int len) {
        System.out.println(this.name + " пробежал " + len + " метров");
    }

    protected void swim(int len)
    {
        System.out.println(this.name + " проплыл " + len + " метров");
    }

    //  У каждого животного есть ограничения на действия
    //  (бег: кот 200 м., собака 500 м.;
    //  плавание: кот не умеет плавать, собака 10 м.).
}
