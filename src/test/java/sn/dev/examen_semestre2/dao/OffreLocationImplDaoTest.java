package sn.dev.examen_semestre2.dao;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.*;
import sn.dev.examen_semestre2.entity.OffreLocation;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

public class OffreLocationImplDaoTest {

    @InjectMocks
    private OffreLocationImplDao offreLocationDao;

    @Mock
    private EntityManager em;

    @Mock
    private EntityTransaction transaction;

    private OffreLocation offre;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this);
        offre = new OffreLocation(1L, "Description de l'offre", 500.0, "Adresse", null);
        when(em.getTransaction()).thenReturn(transaction);
    }

    @Test
    public void testGetAllOffres() {
        List<OffreLocation> expectedOffres = Arrays.asList(offre);
        when(em.createQuery("from OffreLocation", OffreLocation.class).getResultList()).thenReturn(expectedOffres);

        List<OffreLocation> result = offreLocationDao.getAllOffres();
        assertEquals(expectedOffres, result);
    }

    @Test
    public void testGetOffreById() {
        when(em.find(OffreLocation.class, 1L)).thenReturn(offre);

        OffreLocation result = offreLocationDao.getOffreById(1L);
        assertEquals(offre, result);
    }

    @Test
    public void testSaveOffre() {
        doNothing().when(em).persist(offre);

        offreLocationDao.saveOffre(offre);

        verify(em, times(1)).persist(offre);
        verify(transaction, times(1)).begin();
        verify(transaction, times(1)).commit();
    }

    @Test
    public void testUpdateOffre() {
        doNothing().when(em).merge(offre);

        offreLocationDao.updateOffre(offre);

        verify(em, times(1)).merge(offre);
        verify(transaction, times(1)).begin();
        verify(transaction, times(1)).commit();
    }

    @Test
    public void testDeleteOffre() {
        when(em.find(OffreLocation.class, 1L)).thenReturn(offre);
        doNothing().when(em).remove(offre);

        offreLocationDao.deleteOffre(1L);

        verify(em, times(1)).remove(offre);
        verify(transaction, times(1)).begin();
        verify(transaction, times(1)).commit();
    }
}
