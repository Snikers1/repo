public class Employee {
    private String fio;
    private String position;
    private String email;
    private String phoneNumber;
    private int salary;
    private int age;

    public Employee (String fio, String position, String email, String phoneNumber,
                     int salary, int age) {

        this.fio = fio;
        this.position = position;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.salary = salary;
        this.age = age;
    }

    public int getAge()
    {
        return this.age;
    }


    public void showEmployeeInfo()
    {
        System.out.println("Сотрудник: " +  this.fio +
                           "\nПрофессия: " + this.position +
                           "\nПочтовый адрес: " + this.email +
                           "\nТелефон: " + this.phoneNumber +
                           "\nЗарплата: " + this.salary +
                           "\nВозраст: " + this.age);
    }

}
