package org.example.playsongs.util;


public class Usuario{
    private String email;
    private boolean ativo;
    private int nivel;

    public Usuario(String email, int nivel) {
        this.email = email;
        this.ativo = true;
        this.nivel = nivel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isAtivo() {
        return ativo;
    }

    public void setAtivo(boolean ativo) {
        this.ativo = ativo;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }
}
