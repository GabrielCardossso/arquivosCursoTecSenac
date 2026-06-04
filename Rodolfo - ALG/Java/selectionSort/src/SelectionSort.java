public class SelectionSort {

    private int[] array;

    public SelectionSort(int[] array) {
        this.array = array;
    }

    public void ordenarLista() {
        for (int i = 0; i < array.length - 1; i++) {

            int menor = i;

            for (int j = i + 1; j < array.length; j++) {

                if (array[j] < array[menor]) {
                    menor = j;
                }
            }

            int temp = array[i];
            array[i] = array[menor];
            array[menor] = temp;
        }
    }

    public int[] getArray() {
        return array;
    }

}