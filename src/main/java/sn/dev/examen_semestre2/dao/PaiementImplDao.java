package sn.dev.examen_semestre2.dao;

import sn.dev.examen_semestre2.entity.Paiement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PaiementImplDao implements IPaiementDao {
    private SingletonConnection db = new SingletonConnection();
    private ResultSet rs;
    private int ok;

    @Override
    public Paiement save(Paiement paiement) {
        String sql = "INSERT INTO paiement (montant, datePaiement, contrat_id) VALUES (?, ?, ?)";
        try {
            db.initPrepar(sql);
            db.getPstm().setDouble(1, paiement.getMontant());
            db.getPstm().setDate(2, new java.sql.Date(paiement.getDatePaiement().getTime()));
            db.getPstm().setInt(3, paiement.getContrat().getId());
            ok = db.executeMaj();
            db.closeConnection();
            if (ok == 1) {
                String req = "SELECT MAX(id) as max_id from paiement";
                db.initPrepar(req);
                rs = db.executeSelect();
                if (rs.next()) {
                    paiement.setId(rs.getInt("max_id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return paiement;
    }

    @Override
    public List<Paiement> getAllPaiements() {
        List<Paiement> paiements = new ArrayList<>();
        String sql = "SELECT * FROM paiement";
        try {
            db.initPrepar(sql);
            rs = db.executeSelect();
            while (rs.next()) {
                Paiement paiement = new Paiement(
                        rs.getInt("id"),
                        rs.getDouble("montant"),
                        rs.getDate("datePaiement"),
                        null // You need to retrieve and set the ContratLocation entity here
                );
                paiements.add(paiement);
            }
            db.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return paiements;
    }

    @Override
    public Paiement getPaiementById(int id) {
        Paiement paiement = null;
        String sql = "SELECT * FROM paiement WHERE id = ?";
        try {
            db.initPrepar(sql);
            db.getPstm().setInt(1, id);
            rs = db.executeSelect();
            if (rs.next()) {
                paiement = new Paiement(
                        rs.getInt("id"),
                        rs.getDouble("montant"),
                        rs.getDate("datePaiement"),
                        null // You need to retrieve and set the ContratLocation entity here
                );
            }
            db.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return paiement;
    }

    @Override
    public Paiement update(Paiement paiement) {
        String sql = "UPDATE paiement SET montant = ?, datePaiement = ?, contrat_id = ? WHERE id = ?";
        try {
            db.initPrepar(sql);
            db.getPstm().setDouble(1, paiement.getMontant());
            db.getPstm().setDate(2, new java.sql.Date(paiement.getDatePaiement().getTime()));
            db.getPstm().setInt(3, paiement.getContrat().getId());
            db.getPstm().setInt(4, paiement.getId());
            ok = db.executeMaj();
            db.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return paiement;
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM paiement WHERE id = ?";
        try {
            db.initPrepar(sql);
            db.getPstm().setInt(1, id);
            ok = db.executeMaj();
            db.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
