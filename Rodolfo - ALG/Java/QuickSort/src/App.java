import java.util.Arrays;

public class App {
    public static void main(String[] args) {
        System.out.println("===== QUICK SORT =====");
        int[] numeros = { 9, 2, 4, 3, 5, 7, 10, 1, 6, 8 };

        System.out.println("Antes:");
        System.out.println(Arrays.toString(numeros));

        Logica.quickSort(numeros, 0, numeros.length - 1);

        System.out.println();

        System.out.println("Depois:");
        System.out.println(Arrays.toString(numeros));
    }
}