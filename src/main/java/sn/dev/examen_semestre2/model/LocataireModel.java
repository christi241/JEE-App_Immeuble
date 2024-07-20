package sn.dev.examen_semestre2.model;

import sn.dev.examen_semestre2.entity.Locataire;

import java.util.ArrayList;
import java.util.List;

public class LocataireModel {
    private List<Locataire> locataires = new ArrayList<>();

    public List<Locataire> getLocataires() {
        return locataires;
    }

    public void setLocataires(List<Locataire> locataires) {
        this.locataires = locataires;
    }
}
