package sn.dev.examen_semestre2.entity;

import lombok.*;
import javax.persistence.*;
import java.util.Date;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class DemandeLocation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "utilisateur_id")
    private Utilisateur utilisateur;

    @ManyToOne
    @JoinColumn(name = "offre_location_id")
    private OffreLocation offreLocation;

    @Temporal(TemporalType.TIMESTAMP)
    private Date dateDemande;

    private String statut;


}
