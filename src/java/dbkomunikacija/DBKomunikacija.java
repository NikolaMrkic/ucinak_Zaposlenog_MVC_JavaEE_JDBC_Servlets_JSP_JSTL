/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbkomunikacija;

import domen.KorisnikAplikacije;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import domen.KorisnikAplikacije;
import domen.*;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nikol
 */
public class DBKomunikacija {

    public static DBKomunikacija broker;
    public Connection con;
    public PreparedStatement ps;
    public ResultSet rs;

    public DBKomunikacija() {
        ucitajDrajver();
    }

    private void ucitajDrajver() {

        try {

            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void otvoriKonekciju() {

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost/ucinak_zaposlenog", "root", "");

        } catch (SQLException e) {

            JOptionPane.showMessageDialog(null, "Komunikacija sa serverom nije uspela !"
                    + "Proverite da li je Server pokrenut!");
            e.printStackTrace();
        }
    }

    public static DBKomunikacija getInstance() {

        if (broker == null) {

            broker = new DBKomunikacija();
        }
        return broker;
    }

    public void zatvoriKonekciju() {

        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<KorisnikAplikacije> vratiKorisnikeAplikacije() {
        ResultSet rs = null;
        java.sql.Statement st = null;
        ArrayList<KorisnikAplikacije> al = new ArrayList<>();
        String upit = "SELECT korisnicko_ime, lozinka FROM korisnik_aplikacije";

        try {
            st = con.createStatement();
            rs = st.executeQuery(upit);

            while (rs.next()) {

                KorisnikAplikacije ka = new KorisnikAplikacije();
                ka.setKorisnickoIme(rs.getString("korisnicko_ime"));
                ka.setLozinka(rs.getString("lozinka"));
                al.add(ka);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return al;
    }

    public void upisiZaposlenog(String ime, String prezime, int jmbg, String pozicija) {

        String upit = "INSERT INTO zaposleni( Ime, Prezime, jmbg, Pozicija) VALUES (?,?,?,?) ";

        try {
            PreparedStatement ps = con.prepareStatement(upit);
            ps.setString(1, ime);
            ps.setString(2, prezime);
            ps.setInt(3, jmbg);
            ps.setString(4, pozicija);
            ps.executeUpdate();

        } catch (SQLException e) {

        }
    }

    public void updateZaposlenog(String ime, String prezime, int jmbg, String pozicija, int ide) {

        String upit = "UPDATE zaposleni SET Ime='" + ime + "',Prezime='" + prezime + "',jmbg='" + jmbg + "',Pozicija='" + pozicija + "' WHERE id= '" + ide + "'";

        try {
            Statement st = con.createStatement();

            st.executeUpdate(upit);
        } catch (SQLException e) {
            Logger.getLogger(DBKomunikacija.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public Zaposleni vratiOdabranogZaposlenog(int ID) {

        String upit = "SELECT * FROM zaposleni WHERE id=" + ID;
        Zaposleni z = new Zaposleni();

        try {

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(upit);

            while (rs.next()) {

                z.setId(rs.getInt("id"));
                z.setIme(rs.getString("Ime"));
                z.setPrezime(rs.getString("Prezime"));
                z.setJmbg(rs.getInt("jmbg"));
                z.setPozicija(rs.getString("Pozicija"));

            }
        } catch (SQLException e) {
            Logger.getLogger(DBKomunikacija.class.getName()).log(Level.SEVERE, null, e);
        }
        return z;
    }

    public void obrisiZaposlenog(int ID) {

        String upit = "DELETE FROM zaposleni WHERE id=" + ID;

        try {
            Statement st = con.createStatement();
            st.executeUpdate(upit);

        } catch (SQLException ex) {
            Logger.getLogger(DBKomunikacija.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Zaposleni> vratiZaposlene() {

        ResultSet rs = null;
        Statement st = null;
        ArrayList<Zaposleni> al = new ArrayList<>();
        String upit = "SELECT `id`, `Ime`, `Prezime`, `jmbg`, `Pozicija` FROM `zaposleni`";
        try {

            st = con.createStatement();
            rs = st.executeQuery(upit);

            while (rs.next()) {

                Zaposleni z = new Zaposleni();
                z.setId(rs.getInt("id"));
                z.setIme(rs.getString("Ime"));
                z.setPrezime(rs.getString("Prezime"));
                z.setJmbg(rs.getInt("jmbg"));
                z.setPozicija(rs.getString("Pozicija"));
                al.add(z);

            }
        } catch (SQLException ex) {
            Logger.getLogger(DBKomunikacija.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }

    public void unesizaposlenogUTim(String tim, int idZaposlenog) {

        String upit = "INSERT INTO tim( nazivTima,id_Zaposleni) VALUES (?,?)";

        try {
            PreparedStatement ps = con.prepareStatement(upit);

            ps.setString(1, tim);
            ps.setInt(2, idZaposlenog);
            ps.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(DBKomunikacija.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public ArrayList<Tim> vratiTim() {
        ResultSet rs = null;
        Statement st = null;
        ArrayList<Tim> al = new ArrayList<>();
        String upit = "SELECT `id`, `nazivTima`, `id_Zaposleni` FROM `tim` ";
        try {

            st = con.createStatement();
            rs = st.executeQuery(upit);

            while (rs.next()) {

                Tim t = new Tim();
                t.setId(rs.getInt("id"));
                t.setNazivTima(rs.getString("nazivTima"));
                t.setId_Zaposleni(rs.getInt("id_Zaposleni"));
                al.add(t);

            }
        } catch (SQLException ex) {
            Logger.getLogger(DBKomunikacija.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }

    public void unesiTimUProjekat(String nazivProjekta, double brSati, int idTima) {

        String upit = "INSERT INTO projekat( naziv_projekta, br_radnih_sati, id_Tim) VALUES(?,?,?)";

        try {

            PreparedStatement ps = con.prepareStatement(upit);
            ps.setString(1, nazivProjekta);
            ps.setDouble(2, brSati);
            ps.setInt(3, idTima);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DBKomunikacija.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
