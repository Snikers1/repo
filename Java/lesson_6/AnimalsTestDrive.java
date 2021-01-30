public class AnimalsTestDrive {
    public static void main(String[] args)
    {
        Dog bobik = new Dog();
        bobik.setName("Барбоскин");
        bobik.run(550);

        Cat murzik = new Cat();
        murzik.setName("Мурзик");
        murzik.swim(30);
        murzik.run(100);

        Cat barsik = new Cat();
        barsik.setName("Барсик");
        barsik.run(250);

        System.out.println("Всего создано животных: " + Dog.count_animals); // dog наследуется от Animal
        // следовательно, dog имеет доступ к свойству count_animals
        System.out.println("Из них котов: " + Cat.count_cats);
        System.out.println("Из них собак: " + Dog.count_dogs);
    }
}
