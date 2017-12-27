/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kontroler;

import domen.Zaposleni;
import dbkomunikacija.DBKomunikacija;
import domen.KorisnikAplikacije;
import domen.Tim;
import java.util.ArrayList;

/**
 *
 * @author nikol
 */
public class Kontroler {

    public static Kontroler instance;
    ArrayList<KorisnikAplikacije> k = new ArrayList<>();
    ArrayList<Zaposleni> z = new ArrayList<>();
    Zaposleni zaposleni = new Zaposleni();
    ArrayList<Tim> t = new ArrayList<>();

    public static Kontroler getInstance() {
        if (instance == null) {

            instance = new Kontroler();
        }

        return instance;
    }

    public ArrayList<KorisnikAplikacije> vratiKorisnikeAplikacije() {

        DBKomunikacija.getInstance().otvoriKonekciju();
        k = DBKomunikacija.getInstance().vratiKorisnikeAplikacije();
        DBKomunikacija.getInstance().zatvoriKonekciju();
        return k;
    }

    public void UpisiZaposlenog(String ime, String prezime, int jmbg, String pozicija) {

        DBKomunikacija.getInstance().otvoriKonekciju();
        DBKomunikacija.getInstance().upisiZaposlenog(ime, prezime, jmbg, pozicija);
        DBKomunikacija.getInstance().zatvoriKonekciju();
    }

    public void updateZaposlenog(String ime, String prezime, int jmbg, String pozicija, int ide) {

        DBKomunikacija.getInstance().otvoriKonekciju();
        DBKomunikacija.getInstance().updateZaposlenog(ime, prezime, jmbg, pozicija, ide);
        DBKomunikacija.getInstance().zatvoriKonekciju();
    }

    public void obrisiZaposlenog(int ID) {
        DBKomunikacija.getInstance().otvoriKonekciju();
        DBKomunikacija.getInstance().obrisiZaposlenog(ID);
        DBKomunikacija.getInstance().zatvoriKonekciju();
    }

    public Zaposleni vratiOdabranogZaposlenog(int ID) {

        DBKomunikacija.getInstance().otvoriKonekciju();
        zaposleni = DBKomunikacija.getInstance().vratiOdabranogZaposlenog(ID);
        DBKomunikacija.getInstance().zatvoriKonekciju();
        return zaposleni;

    }

    public ArrayList<Zaposleni> vratiZaposlene() {

        DBKomunikacija.getInstance().otvoriKonekciju();
        z = DBKomunikacija.getInstance().vratiZaposlene();
        DBKomunikacija.getInstance().zatvoriKonekciju();
        return z;
    }

    public void unesiZaposlenogUTim(String tim, int idZaposlenog) {

        DBKomunikacija.getInstance().otvoriKonekciju();
        DBKomunikacija.getInstance().unesizaposlenogUTim(tim, idZaposlenog);
        DBKomunikacija.getInstance().zatvoriKonekciju();
    }

    public ArrayList<Tim> vratiTim() {
        
        DBKomunikacija.getInstance().otvoriKonekciju();
        t = DBKomunikacija.getInstance().vratiTim();
        DBKomunikacija.getInstance().zatvoriKonekciju();
        return t;
    }

    public void unesiTimUProjekat(String nazivProjekta ,double brSati, int idTima) {
        DBKomunikacija.getInstance().otvoriKonekciju();
        DBKomunikacija.getInstance().unesiTimUProjekat(nazivProjekta,brSati,idTima);
        DBKomunikacija.getInstance().zatvoriKonekciju();
    }

}
