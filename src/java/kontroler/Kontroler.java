/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kontroler;
import domen.Zaposleni;
import dbkomunikacija.DBKomunikacija;
import domen.KorisnikAplikacije;
import java.util.ArrayList;


/**
 *
 * @author nikol
 */
public class Kontroler {
    
    public static Kontroler instance;
   ArrayList<KorisnikAplikacije> k = new ArrayList<>();
    ArrayList<Zaposleni> z = new ArrayList<>();
   
    
    public static Kontroler getInstance(){
        if(instance == null){
            
            instance = new Kontroler();
        }
        
        return instance;
    }

   

   

    public ArrayList<KorisnikAplikacije> vratiKorisnikeAplikacije() {
        
        DBKomunikacija.getInstance().otvoriKonekciju();
        k= DBKomunikacija.getInstance().vratiKorisnikeAplikacije();
        DBKomunikacija.getInstance().zatvoriKonekciju();
        return k;
    }

    public void UpisiZaposlenog(String ime, String prezime, int jmbg, String pozicija) {
        
        DBKomunikacija.getInstance().otvoriKonekciju();
        DBKomunikacija.getInstance().upisiZaposlenog(ime,prezime,jmbg,pozicija);
        DBKomunikacija.getInstance().zatvoriKonekciju();
    }

    public void updateZaposlenog(String Ime, String Prezime, int jmbg, String Pozicija, int ide) {
       
        DBKomunikacija.getInstance().otvoriKonekciju();
        DBKomunikacija.getInstance().updateZaposlenog(Ime,Prezime,jmbg,Pozicija,ide);
        DBKomunikacija.getInstance().zatvoriKonekciju();
    }

    public void obrisiZaposlenog(int ID) {
       DBKomunikacija.getInstance().otvoriKonekciju();
       DBKomunikacija.getInstance().obrisiZaposlenog(ID);
       DBKomunikacija.getInstance().zatvoriKonekciju();
    }

    public Zaposleni vratiOdabranogZaposlenog(int ID) {
          Zaposleni z = null;
       DBKomunikacija.getInstance().otvoriKonekciju();
       DBKomunikacija.getInstance().vratiOdabranogZaposlenog(ID);
       DBKomunikacija.getInstance().zatvoriKonekciju();
        return z;
       
       
       
    }

    
   
    
}
