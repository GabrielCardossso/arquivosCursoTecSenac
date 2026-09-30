public class App {
    public static void main(String[] args) {
        int[] numeros = { 6, 9, 3, 10, 1, 7, 2, 8, 4, 5 };

        SelectionSort selectionSort = new SelectionSort(numeros);

        selectionSort.ordenarLista();

        for (int numero : selectionSort.getArray()) {
            System.out.print(numero + " ");
        }
    }
}