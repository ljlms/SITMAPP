/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.controllers;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import sitmapp.entity.Articulado;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import sitmapp.controllers.exceptions.IllegalOrphanException;
import sitmapp.controllers.exceptions.NonexistentEntityException;
import sitmapp.controllers.exceptions.PreexistingEntityException;
import sitmapp.entity.Historialconductor;

/**
 *
 * @author MANUEL PONTON RICO
 */
public class HistorialConductorJpaController implements Serializable {

    public HistorialConductorJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("SITMAPPPU");;

    public HistorialConductorJpaController() {
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Historialconductor historialConductor) throws IllegalOrphanException, PreexistingEntityException, Exception {
        List<String> illegalOrphanMessages = null;
        Articulado articuladoOrphanCheck = historialConductor.getArticulado();
        if (articuladoOrphanCheck != null) {
            Historialconductor oldHistorialconductorOfArticulado = articuladoOrphanCheck.getHistorialConductor();
            if (oldHistorialconductorOfArticulado != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("The Articulado " + articuladoOrphanCheck + " already has an item of type Historialconductor whose articulado column cannot be null. Please make another selection for the articulado field.");
            }
        }
        if (illegalOrphanMessages != null) {
            throw new IllegalOrphanException(illegalOrphanMessages);
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Articulado articulado = historialConductor.getArticulado();
            if (articulado != null) {
                articulado = em.getReference(articulado.getClass(), articulado.getIdArticulado());
                historialConductor.setArticulado(articulado);
            }
            em.persist(historialConductor);
            if (articulado != null) {
                articulado.setHistorialConductor(historialConductor);
                articulado = em.merge(articulado);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findHistorialconductor(historialConductor.getArticuladoIdArticulado()) != null) {
                throw new PreexistingEntityException("Historialconductor " + historialConductor + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Historialconductor historialConductor) throws IllegalOrphanException, NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Historialconductor persistentHistorialconductor = em.find(Historialconductor.class, historialConductor.getArticuladoIdArticulado());
            Articulado articuladoOld = persistentHistorialconductor.getArticulado();
            Articulado articuladoNew = historialConductor.getArticulado();
            List<String> illegalOrphanMessages = null;
            if (articuladoNew != null && !articuladoNew.equals(articuladoOld)) {
                Historialconductor oldHistorialconductorOfArticulado = articuladoNew.getHistorialConductor();
                if (oldHistorialconductorOfArticulado != null) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("The Articulado " + articuladoNew + " already has an item of type Historialconductor whose articulado column cannot be null. Please make another selection for the articulado field.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (articuladoNew != null) {
                articuladoNew = em.getReference(articuladoNew.getClass(), articuladoNew.getIdArticulado());
                historialConductor.setArticulado(articuladoNew);
            }
            historialConductor = em.merge(historialConductor);
            if (articuladoOld != null && !articuladoOld.equals(articuladoNew)) {
                articuladoOld.setHistorialConductor(null);
                articuladoOld = em.merge(articuladoOld);
            }
            if (articuladoNew != null && !articuladoNew.equals(articuladoOld)) {
                articuladoNew.setHistorialConductor(historialConductor);
                articuladoNew = em.merge(articuladoNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = historialConductor.getArticuladoIdArticulado();
                if (findHistorialconductor(id) == null) {
                    throw new NonexistentEntityException("The historialConductor with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Historialconductor historialConductor;
            try {
                historialConductor = em.getReference(Historialconductor.class, id);
                historialConductor.getArticuladoIdArticulado();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The historialConductor with id " + id + " no longer exists.", enfe);
            }
            Articulado articulado = historialConductor.getArticulado();
            if (articulado != null) {
                articulado.setHistorialConductor(null);
                articulado = em.merge(articulado);
            }
            em.remove(historialConductor);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Historialconductor> findHistorialconductorEntities() {
        return findHistorialconductorEntities(true, -1, -1);
    }

    public List<Historialconductor> findHistorialconductorEntities(int maxResults, int firstResult) {
        return findHistorialconductorEntities(false, maxResults, firstResult);
    }

    private List<Historialconductor> findHistorialconductorEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Historialconductor.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Historialconductor findHistorialconductor(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Historialconductor.class, id);
        } finally {
            em.close();
        }
    }

    public int getHistorialconductorCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Historialconductor> rt = cq.from(Historialconductor.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
