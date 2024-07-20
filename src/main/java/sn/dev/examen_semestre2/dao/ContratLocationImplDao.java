package sn.dev.examen_semestre2.dao;

import sn.dev.examen_semestre2.entity.ContratLocation;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContratLocationImplDao implements IContratLocationDao {
    private SingletonConnection db = new SingletonConnection();
    private ResultSet rs;
    private int ok;

    @Override
    public ContratLocation save(ContratLocation contratLocation) {
        String sql = "INSERT INTO contrat_location (dateDebut, dateFin, loyer, locataire_id, unite_id) VALUES (?, ?, ?, ?, ?)";
        try {
            db.initPrepar(sql);
            db.getPstm().setDate(1, new java.sql.Date(contratLocation.getDateDebut().getTime()));
            db.getPstm().setDate(2, new java.sql.Date(contratLocation.getDateFin().getTime()));
            db.getPstm().setDouble(3, contratLocation.getLoyer());
            db.getPstm().setInt(4, contratLocation.getLocataire().getId());
            db.getPstm().setInt(5, contratLocation.getUnite().getId());
            ok = db.executeMaj();
            db.closeConnection();
            if (ok == 1) {
                String req = "SELECT MAX(id) as max_id from contrat_location";
                db.initPrepar(req);
                rs = db.executeSelect();
                if (rs.next()) {
                    contratLocation.setId(rs.getInt("max_id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contratLocation;
    }

    @Override
    public List<ContratLocation> getAllContrats() {
        return null;
    }

    @Override
    public ContratLocation getContratById(int id) {
        return null;
    }

    @Override
    public List<ContratLocation> getAllContratLocations() {
        List<ContratLocation> contratLocations = new ArrayList<>();
        String sql = "SELECT * FROM contrat_location";
        try {
            db.initPrepar(sql);
            rs = db.executeSelect();
            while (rs.next()) {
                ContratLocation contratLocation = new ContratLocation(
                        rs.getInt("id"),
                        rs.getDate("dateDebut"),
                        rs.getDate("dateFin"),
                        rs.getDouble("loyer"),
                        null, // You need to retrieve and set the Locataire entity here
                        null  // You need to retrieve and set the UniteLocation entity here
                );
                contratLocations.add(contratLocation);
            }
            db.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contratLocations;
    }

    @Override
    public ContratLocation getContratLocationById(int id) {
        ContratLocation contratLocation = null;
        String sql = "SELECT * FROM contrat_location WHERE id = ?";
        try {
            db.initPrepar(sql);
            db.getPstm().setInt(1, id);
            rs = db.executeSelect();
            if (rs.next()) {
                contratLocation = new ContratLocation(
                        rs.getInt("id"),
                        rs.getDate("dateDebut"),
                        rs.getDate("dateFin"),
                        rs.getDouble("loyer"),
                        null, // You need to retrieve and set the Locataire entity here
                        null  // You need to retrieve and set the UniteLocation entity here
                );
            }
            db.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contratLocation;
    }

    @Override
    public ContratLocation update(ContratLocation contratLocation) {
        String sql = "UPDATE contrat_location SET dateDebut = ?, dateFin = ?, loyer = ?, locataire_id = ?, unite_id = ? WHERE id = ?";
        try {
            db.initPrepar(sql);
            db.getPstm().setDate(1, new java.sql.Date(contratLocation.getDateDebut().getTime()));
            db.getPstm().setDate(2, new java.sql.Date(contratLocation.getDateFin().getTime()));
            db.getPstm().setDouble(3, contratLocation.getLoyer());
            db.getPstm().setInt(4, contratLocation.getLocataire().getId());
            db.getPstm().setInt(5, contratLocation.getUnite().getId());
            db.getPstm().setInt(6, contratLocation.getId());
            ok = db.executeMaj();
            db.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contratLocation;
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM contrat_location WHERE id = ?";
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
