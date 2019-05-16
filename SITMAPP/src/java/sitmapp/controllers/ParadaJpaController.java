/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.controllers;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import sitmapp.controllers.exceptions.NonexistentEntityException;
import sitmapp.controllers.exceptions.PreexistingEntityException;
import sitmapp.entity.Parada;

/**
 *
 * @author MANUEL PONTON RICO
 */
public class ParadaJpaController implements Serializable {

    public ParadaJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("SITMAPPPU");;

    public ParadaJpaController() {
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Parada parada) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(parada);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findParada(parada.getIdParada()) != null) {
                throw new PreexistingEntityException("Parada " + parada + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Parada parada) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            parada = em.merge(parada);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = parada.getIdParada();
                if (findParada(id) == null) {
                    throw new NonexistentEntityException("The parada with id " + id + " no longer exists.");
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
            Parada parada;
            try {
                parada = em.getReference(Parada.class, id);
                parada.getIdParada();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The parada with id " + id + " no longer exists.", enfe);
            }
            em.remove(parada);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Parada> findParadaEntities() {
        return findParadaEntities(true, -1, -1);
    }

    public List<Parada> findParadaEntities(int maxResults, int firstResult) {
        return findParadaEntities(false, maxResults, firstResult);
    }

    private List<Parada> findParadaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Parada.class));
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

    public Parada findParada(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Parada.class, id);
        } finally {
            em.close();
        }
    }

    public int getParadaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Parada> rt = cq.from(Parada.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
