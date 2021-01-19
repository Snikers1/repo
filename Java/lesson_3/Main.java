import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

public class Main {
    private static int correct_answer; // загаданное число
    private static boolean new_game = true; // флаг для начала новой игры
    public static Scanner sc = new Scanner(System.in); // создаем объект Scanner для пользовательского ввода
    public static boolean isWordGuessed = false;
    private static String guessedWord; // загаданное слово

    public static void main(String[] args)
    {
        //guessGameBuilder();

        String[] words = {"apple", "orange", "lemon", "banana", "apricot", "avocado",
                "broccoli", "carrot", "cherry", "garlic", "grape", "melon", "leak",
                "kiwi", "mango", "mushroom", "nut", "olive", "pea", "peanut", "pear",
                "pepper", "pineapple", "pumpkin", "potato"};

        guessWord(words);


    }
    /* Написать программу, которая загадывает случайное число от 0 до 9
       и пользователю дается 3 попытки угадать это число.
       При каждой попытке компьютер должен сообщить, больше ли указанное пользователем число,
       чем загаданное, или меньше.
       После победы или проигрыша выводится запрос – «Повторить игру еще раз?
       1 – да / 0 – нет»(1 – повторить, 0 – нет)
      */

    // генерируем случайное число и записываем его в ответ
    public static void setAnswer()
    {
        Random rand  = new Random(); // создаем экземляр класса Random
        int answer = rand.nextInt(10);
        correct_answer = answer;

    }

    public static int userInput(int max, String message)
    {
        int userAnwer;
        do {
            System.out.println(message);
            if (sc.hasNextInt()) // true, если следующий токен на входе этого сканера можно интерпретировать как значение int
            {
                userAnwer = sc.nextInt(); // получаем число
                if (userAnwer >= 0  && userAnwer < max)
                {
                    break;
                } // если число в заданном диапазоне, то оно нас устраивает
            }
            else {
                sc.nextLine(); // чистим буфер
            }

        } while (true);
        return userAnwer;

    }

    public static void guessGame()
    {
        setAnswer(); // генерируем случайное число от 0 до 9
        // System.out.println("correct_answer is : " + correct_answer);
        System.out.println("Перед Вами игра по угадыванию числа от 0 до 9. У Вас имеется 3 попытки");
        int userAnwer;
        for (int i = 0; i < 3; i++)
        {
            System.out.println("Попытка номер: " + (i + 1));
            userAnwer = userInput(10, "Введите предполагаемое число : ");

            if (userAnwer == correct_answer)
            {
                System.out.println("Вы угадали!");
                break;
            }
            else if (userAnwer < correct_answer)
            {
                System.out.println("Искомое число больше");
            }
            else
            {
                System.out.println("Искомое число меньше");
            }
        }
    }

   public static void guessGameBuilder()
   {
       int userInput;
       guessGame(); // запускаем игру
       while(new_game)
       {
           userInput = userInput(2, "Повторить игру еще раз? \n " +
                   "1 – да / 0 – нет» (1 – повторить, 0 – нет)");
           if (userInput == 1)
           {
               guessGame(); // повторяем игру
           }
           else {
               System.out.println("До свидания!");
               new_game = false; // заканчиваем игру
           }
       }
       sc.close(); // закрываем Scanner
    }

    // методы для угадывания слова

    // Setter для загаданного слова
    public static void setGuessedWord(String[] wordArray)
    {
        Random rand = new Random();
        int wordIndex = rand.nextInt(wordArray.length);
        guessedWord = wordArray[wordIndex];

    }

    //
    public static void guessWord(String[] words)
    {
        setGuessedWord(words);
        System.out.println("Загаданное слово : " + guessedWord);
        String userWord;
        char[] showOutput = new char[15];
        for (int i = 0; i < showOutput.length; i++)
        {
            showOutput[i] = '*';
        }
        while (!isWordGuessed)
        {
            System.out.println("Введите предполагаемое слово : ");
            userWord = sc.nextLine();
            if (userWord.equals(guessedWord))
            {
                System.out.println("Поздравляем, Вы угадали!");
                break;

            }
            else
            {
                for (int j = 0; j < guessedWord.length(); j++)
                {
                    if (guessedWord.charAt(j) == userWord.charAt(j))
                    {
                        showOutput[j] = userWord.charAt(j);
                    }

                }
                System.out.println(showOutput);

            }


        }
        sc.close();

    }


}
