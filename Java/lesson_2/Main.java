import java.util.Arrays;

public class Main {
    // конструктор класса по умолчанию
    public Main()
    { }
    public static void main(String[] args)
    {
        int[] myMassive = {1, 0, 1, 1, 0, 1, 0, 1, 1}; // Задать целочисленный массив, состоящий из элементов 0 и 1
        myMassive = inversionMassive(myMassive); // вызываем метод
        System.out.println(Arrays.toString(myMassive)); // красивый вывод
        // Задать пустой целочисленный массив размером 8.
        int[] fixSisedMassive; // создаем ссылочную переменную типа массив (пульт дистанционного
        // управления, создаем в куче объект массива int[8] и связываем пульт с объектом )
        fixSisedMassive = fillInMassive(); // заполняем массив
        // красиво выводим
        System.out.println(Arrays.toString(fixSisedMassive));
        // Задать массив [ 1, 5, 3, 2, 11, 4, 5, 2, 4, 8, 9, 1 ]
        int[] thirdMassive = {1, 5, 3, 2, 11, 4, 5, 2, 4, 8, 9, 1};
        thirdMassive = setupNewValues(thirdMassive);
        System.out.println(Arrays.toString(thirdMassive));
        int[][] square = colorDiagonals(); // создали квадратную матрицу размера 5 * 5 и раскрасили диагонали единицами
        beautifulMatrixPrint(square); // красивый вывод матрицы
        maximumAndMinimum(thirdMassive); // вывод максимального и минимального элемента в массиве


        int[] testMassive = {2, 2, 2, 1, 2, 2,  10, 1};
        System.out.println(isThereSomePlace(testMassive));
        int[] testMassive2 = {1, 1, 1, 2, 1};
        System.out.println(isThereSomePlace(testMassive2));

        // циклическое смещение элементов массива

        int[] shuffleTestDriveMassive = {3, 5, 6, 1};
        System.out.println(Arrays.toString(shuffleArray(shuffleTestDriveMassive,-2)));

    }
    // С помощью цикла и условия заменить 0 на 1, 1 на 0 в массиве

    public static int[] inversionMassive(int[] massive) /* параметры передаются по значению, т.е. работаем
       не с самим массивом massive, а с его копией  */
    {
        for (int i = 0; i < massive.length; i++)
        {
            if (massive[i] == 0)
            {
                massive[i] = 1;
            }
            else
            {
                massive[i] = 0;
            }
        }
        return massive;
    }

    // С помощью цикла заполнить fixSisedMassive значениями 0 3 6 9 12 15 18 21;

    public static int[] fillInMassive()
    {
        int[] massive = new int[8];
        for (int i = 0; i < massive.length; i++)
        {
            massive[i] = i * 3;
        }
        return massive;
    }

    // пройти по нему (thirdMassive) циклом, и числа меньшие 6 умножить на 2
    public static int[] setupNewValues (int[] massive)
    {
        for (int i = 0; i < massive.length; i++)
        {
            if (massive[i] < 6)
            {
                massive[i] *= 2;
            }
        }
        return massive;
    }

    // заполнить его диагональные элементы единицами;

    public static int[][] colorDiagonals()
    {
        int n = 5; // количество строк в массиве (оно же количество столбцов)
        int[][] square = new int[n][n];
        for (int i = 0; i < n ; i++)
        {
            for (int j = 0; j < n; j++)
            {
                if (i == j)
                {
                    square[i][j] = 1;
                    continue;
                }
                else
                {
                    square[i][j] = 0;
                }

            }
        }
        return square;
    }

    // метод для красивого вывода двумерного массива

    public static void beautifulMatrixPrint( int[][] matrix )
    {
        int numRows = matrix[0].length;
        for (int i = 0; i < numRows; i++)
        {
            System.out.println(Arrays.toString(matrix[i]));
        }
    }

    // ** Задать одномерный массив и найти в нем минимальный и максимальный элементы (без помощи интернета);

    // чтобы это сделать, сначала надо отсортировать массив. Для простоты возьмем пузырьковую сортировку
    public static void maximumAndMinimum(int[] massive)
    {
        int buffer;
        for (int i = 0; i < massive.length - 1 ; i++)
        {
            for (int j = i + 1; j < massive.length; j++)
            {
                if (massive[i] < massive[j]) // сортировка в порядке убывания
                {
                    // меняем местами
                    buffer = massive[i];
                    massive[i] = massive[j];
                    massive[j] = buffer;
                }
            }
        }
        // максимальный элемент - он же первый, минимальный - последний
        System.out.println("Максимальный элемент в массиве: " + massive[0]);
        System.out.println("Минимальный элемент в массиве: " + massive[massive.length - 1]);
    }

    /* Написать метод, в который передается не пустой одномерный целочисленный массив,
       метод должен вернуть true, если в массиве есть место,
       в котором сумма левой и правой части массива равны.
       Примеры: checkBalance([2, 2, 2, 1, 2, 2, || 10, 1]) → true,
       checkBalance([1, 1, 1, || 2, 1]) → true, граница показана символами ||,
       эти символы в массив не входят.
     */
    // вспомогательный метод, который считает сумму элементов в массиве

    public static int helpSum(int startPos, int endPos, int[] massive)
    {
        int sum = 0;
        for (int i = startPos; i <= endPos; i++)
        {
            sum += massive[i];
        }
        return sum;
    }

    public static boolean isThereSomePlace(int[] massive)
    {
        int k = 1;
        for(int i = 0; i < massive.length - 1; i++)
        {
            for (int j = i + 1; j < massive.length; j ++)
            {
                if (helpSum(0, j - 1, massive) == helpSum(j,massive.length -1, massive))
                {
                    return true;
                }
                else
                {
                    continue;
                }
            }
        }
        return false;
    }

    /* **** Написать метод, которому на вход подается одномерный массив и число n
     (может быть положительным, или отрицательным), при этом метод должен сместить
     все элементы массива на n позиций. Элементы смещаются циклично.
     Для усложнения задачи нельзя пользоваться вспомогательными массивами.
     Примеры: [ 1, 2, 3 ] при n = 1 (на один вправо) -> [ 3, 1, 2 ];
      [ 3, 5, 6, 1] при n = -2 (на два влево) -> [ 6, 1, 3, 5 ].
      При каком n в какую сторону сдвиг можете выбирать сами.
     */

    // реализуем это с помощью n сдвигов на 1 ячейку
    public static int[] shuffleArray(int[] array, int offset)
    {
        int buffer;
        for (int i = 0; i < Math.abs(offset); i++) // повторяем offset раз
        {
            // если смещаем вправо
            if (offset > 0)
            {
                buffer = array[array.length - 1];
                for (int j = array.length - 1; j > 0; j--)
                {
                    array[j] = array[j - 1];
                }
                array[0] = buffer;

            }
            // смещаем влево
            else
            {
                buffer = array[0];
                for (int j = 0; j < array.length - 1; j++)
                {
                    array[j] = array[j+1];
                }
                array[array.length - 1] = buffer;
            }


        }
        return array;
    }


}
