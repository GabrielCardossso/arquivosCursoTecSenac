package selecionadorPalavras;

import java.util.*;

public class FrequenciaDePalavras {
   public static void main(String[] args) {
    String[] frases = {
        "eu gosto de pão",
        "eu gosto de bolo",
        "eu gosto de café",
        "eu quero pão",
        "eu quero bolo",
        "eu quero café",
        "hoje eu quero pão",
        "hoje eu quero bolo",
        "hoje eu quero café"
    };

    Map<String, Map<String, Integer>> modelo = new HashMap<>();
    for (String frase : frases) {
        String[] palavras = frase.split(" ");
        for (int i = 0; i < palavras.length - 1; i++) {
            String atual = palavras[i];
            String proxima = palavras[i + 1];

            if (modelo.containsKey(atual)) {
                modelo.put(atual, new HashMap<>());
            }

            Map<String, Integer> proximas = modelo.get(atual);

            if (!proximas.containsKey(proxima)) {
                proximas.put(proxima, proximas.getOrDefault(proxima, 0) + 1);
            }
        }
    }
    Scanner entrada = new Scanner(System.in);
System.out.println("Digite uma palavra: ");
String palavra = entrada.nextLine();

if (modelo.containsKey(palavra)) {
    Map<String, Integer> sugestoes = modelo.get(palavra);
    System.out.println("Sugestões: ");
    for (String sugestao : sugestoes.keySet()) {
        System.out.println(sugestao + " apareceu " + sugestoes.get(sugestao) + " vezes");
    }
} else {
    System.out.println("Não há sugestões para esta palavra");
}
entrada.close();
   }
}
