import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MyGUI extends JFrame {
    public MyGUI()
    {
        //setBounds(300, 300, 400, 400);

        setTitle("GUI Application");
        setSize(300, 300);
        setLocation(500,300);

        JPanel pannel_lastname = new JPanel();
        pannel_lastname.setLayout(new GridLayout(2, 1));
        setLayout(new BoxLayout(getContentPane(), BoxLayout.Y_AXIS));
        JLabel lastname_fio_info = new JLabel("Введите Фамилию", SwingConstants.CENTER);
        pannel_lastname.add(lastname_fio_info);
        JTextField textfield = new JTextField("например: Иванов");
        pannel_lastname.add(textfield);

        add(pannel_lastname, BorderLayout.CENTER);

        JPanel pannel_firstname = new JPanel();
        pannel_firstname.setLayout(new GridLayout(2, 1));
        JLabel firstname_fio_info = new JLabel("Введите Имя", SwingConstants.CENTER);
        pannel_lastname.add(firstname_fio_info);
        JTextField textfield_lastname = new JTextField("например: Иван");
        pannel_lastname.add(textfield_lastname);
        //add(pannel_firstname);

        add(pannel_firstname, BorderLayout.CENTER);

        JPanel pannel_sex = new JPanel();
        JLabel sex_info = new JLabel("Выберете пол", SwingConstants.CENTER);
        pannel_sex.add(sex_info);
        pannel_sex.setLayout(new GridLayout(1, 3));
        JCheckBox male_flag = new JCheckBox("Male");
        JCheckBox female_flag = new JCheckBox("Female");
        pannel_sex.add(male_flag);
        pannel_sex.add(female_flag);

        //add(pannel_sex);
        add(pannel_sex, BorderLayout.CENTER);


        JButton button_enter = new JButton("Ввод данных");
        button_enter.setAlignmentX(CENTER_ALIGNMENT);
        add(button_enter, BorderLayout.CENTER);
        //add(button_enter);
        button_enter.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String my_message = "Ваша Фамилия: " + textfield.getText() + "\n" +
                                    "Ваше Имя: " + textfield_lastname.getText() + "\n" +
                                    "Ваш пол: " + ((male_flag.isSelected() == true) ? "male" : "female");

                JOptionPane.showMessageDialog(null, my_message, "Анкета", JOptionPane.PLAIN_MESSAGE);
            }
        });
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        setVisible(true);
    }
}
