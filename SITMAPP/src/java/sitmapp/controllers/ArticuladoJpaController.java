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
import sitmapp.entity.Historialconductor;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import sitmapp.controllers.exceptions.IllegalOrphanException;
import sitmapp.controllers.exceptions.NonexistentEntityException;
import sitmapp.entity.Articulado;

/**
 *
 * @author MANUEL PONTON RICO
 */
public class ArticuladoJpaController implements Serializable {

    public ArticuladoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("SITMAPPPU");

    public ArticuladoJpaController() {
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Articulado articulado) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            HistorialConductor historialConductor = articulado.getHistorialConductor();
            if (historialConductor != null) {
                historialConductor = em.getReference(historialConductor.getClass(), historialConductor.getArticuladoIdArticulado());
                articulado.setHistorialConductor(historialConductor);
            }
            em.persist(articulado);
            if (historialConductor != null) {
                Articulado oldArticuladoOfHistorialConductor = historialConductor.getArticulado();
                if (oldArticuladoOfHistorialConductor != null) {
                    oldArticuladoOfHistorialConductor.setHistorialConductor(null);
                    oldArticuladoOfHistorialConductor = em.merge(oldArticuladoOfHistorialConductor);
                }
                historialConductor.setArticulado(articulado);
                historialConductor = em.merge(historialConductor);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Articulado articulado) throws IllegalOrphanException, NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Articulado persistentArticulado = em.find(Articulado.class, articulado.getIdArticulado());
            HistorialConductor historialConductorOld = persistentArticulado.getHistorialConductor();
            HistorialConductor historialConductorNew = articulado.getHistorialConductor();
            List<String> illegalOrphanMessages = null;
            if (historialConductorOld != null && !historialConductorOld.equals(historialConductorNew)) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("You must retain HistorialConductor " + historialConductorOld + " since its articulado field is not nullable.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (historialConductorNew != null) {
                historialConductorNew = em.getReference(historialConductorNew.getClass(), historialConductorNew.getArticuladoIdArticulado());
                articulado.setHistorialConductor(historialConductorNew);
            }
            articulado = em.merge(articulado);
            if (historialConductorNew != null && !historialConductorNew.equals(historialConductorOld)) {
                Articulado oldArticuladoOfHistorialConductor = historialConductorNew.getArticulado();
                if (oldArticuladoOfHistorialConductor != null) {
                    oldArticuladoOfHistorialConductor.setHistorialConductor(null);
                    oldArticuladoOfHistorialConductor = em.merge(oldArticuladoOfHistorialConductor);
                }
                historialConductorNew.setArticulado(articulado);
                historialConductorNew = em.merge(historialConductorNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = articulado.getIdArticulado();
                if (findArticulado(id) == null) {
                    throw new NonexistentEntityException("The articulado with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws IllegalOrphanException, NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Articulado articulado;
            try {
                articulado = em.getReference(Articulado.class, id);
                articulado.getIdArticulado();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The articulado with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            HistorialConductor historialConductorOrphanCheck = articulado.getHistorialConductor();
            if (historialConductorOrphanCheck != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Articulado (" + articulado + ") cannot be destroyed since the HistorialConductor " + historialConductorOrphanCheck + " in its historialConductor field has a non-nullable articulado field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            em.remove(articulado);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Articulado> findArticuladoEntities() {
        return findArticuladoEntities(true, -1, -1);
    }

    public List<Articulado> findArticuladoEntities(int maxResults, int firstResult) {
        return findArticuladoEntities(false, maxResults, firstResult);
    }

    private List<Articulado> findArticuladoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Articulado.class));
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

    public Articulado findArticulado(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Articulado.class, id);
        } finally {
            em.close();
        }
    }

    public int getArticuladoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Articulado> rt = cq.from(Articulado.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
