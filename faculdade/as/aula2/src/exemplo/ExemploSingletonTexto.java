package exemplo;

public class ExemploSingletonTexto {
    public static void main(String[] args){
        System.out.println(ExemploSingleton.getInstance("Exemplo 1"));        
        System.out.println(ExemploSingleton.getInstance("Exemplo 2"));

    }
}
