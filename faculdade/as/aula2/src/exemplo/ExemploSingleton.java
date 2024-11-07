/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exemplo;

public class ExemploSingleton {
    private ExemploSingleton instance = null;
    
    private String texto;

    private ExemploSingleton (String texto) {
        this.texto = texto;
    }
    
    
    public ExemploSingleton getInstance(String texto) {
        if(instance == null){
            instance = new ExemploSingleton(texto);
        }
        return instance;
    }

    @Override
    public String toString() {
        return "ExemploSingleton{" + "instance=" + instance + ", texto=" + texto + '}';
    }
    
}
