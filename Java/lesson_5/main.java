public class main {

    public static void main (String[] args) {
        Employee emp1 = new Employee("Бессонов Роман", "Руководитель направления",
                "bessonov.ra@open.ru", "891750071^^",
                100000, 23);

        Employee[] empArray = new Employee[3]; // Вначале объявляем массив объектов
        empArray[0] = emp1;
        empArray[1] = new Employee("Калиничева Анастасия", "Младший разработчик",
                "meloch1997@mail.ru", "896524709**", 75000, 23);

        empArray[2] = new Employee("Григорьев Алексей", "Начальник центра",
                "alx_grig@mail.ru", "8915844**", 300000, 40);

        for (int i = 0; i < empArray.length; i++) {
            if (empArray[i].getAge() < 40) {
                empArray[i].showEmployeeInfo();
            }
        }

    }
}
