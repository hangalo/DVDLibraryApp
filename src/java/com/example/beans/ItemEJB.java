package com.example.beans;

import com.example.entities.Item;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

@Stateless
public class ItemEJB {

    @PersistenceContext(unitName="DVDLibraryPU")
    private EntityManager em;

    

    public List<Item> getAllItems() {
        StringBuilder queryText = new StringBuilder("SELECT item FROM Item as item ORDER BY item.title");
        TypedQuery<Item> query = em.createQuery(queryText.toString(), Item.class);
        List<Item> allItems = query.getResultList();
        return allItems;
    }
    public int count() {
        javax.persistence.criteria.CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
        javax.persistence.criteria.Root<Item> rt = cq.from(Item.class);
        cq.select(em.getCriteriaBuilder().count(rt));
        javax.persistence.Query q = em.createQuery(cq);
        return ((Long) q.getSingleResult()).intValue();
    }
  
   public List<Item> findRange(int[] range) {
        javax.persistence.criteria.CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
        cq.select(cq.from(Item.class));
        javax.persistence.Query q = em.createQuery(cq);
        q.setMaxResults(range[1] - range[0]);
        q.setFirstResult(range[0]);
        return q.getResultList();
    }
}
