package com.example.beans;

import com.dvdlibrary.resources.PaginationHelper;
import com.example.entities.Item;
import java.io.Serializable;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;
import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author admin
 */
@Named("dvd")
@SessionScoped
public class DVDLibraryBean implements Serializable {

    @Inject
    ItemEJB itembean;
    @Inject
    private Item item;

    private String title = "";
    private Long releaseyear;
    private String genre = "";
    private PaginationHelper pagination;
    private int selectedItenIndex;
    private DataModel dtmdl = null;

    private List dvdCollection;

    public List getDvdCollection() {
        if (this.dvdCollection == null) {
            this.dvdCollection = itembean.getAllItems();
        }
        return dvdCollection;
    }

    public int getSize() {
        return getDvdCollection().size();
    }

    public void setDvdCollection(List dvdcollection) {
        this.dvdCollection = dvdcollection;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;

    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Long getReleaseyear() {
        return releaseyear;
    }

    public void setReleaseyear(Long releaseyear) {
        this.releaseyear = releaseyear;

    }

    public PaginationHelper getPagination() {
        if (pagination == null) {
            pagination = new PaginationHelper(10) {

                @Override
                public int getItemsCount() {
                    return itembean.count();
                }

                @Override
                public DataModel createPageDataModel() {
                    return new ListDataModel(itembean.findRange(new int[]{getPageFirstItem(), getPageFirstItem() + getPageSize()}));
                }
            };

        }
        return pagination;
    }

    public void setPagination(PaginationHelper pagination) {
        this.pagination = pagination;
    }

    public int getSelectedItenIndex() {
        return selectedItenIndex;
    }

    public void setSelectedItenIndex(int selectedItenIndex) {
        this.selectedItenIndex = selectedItenIndex;
    }

    public DataModel getDtmdl() {
        if (dtmdl == null) {
            dtmdl = getPagination().createPageDataModel();
        }
        return dtmdl;
    }

    public void setDtmdl(DataModel dtmdl) {
        
        this.dtmdl = dtmdl;
    }

    private void recreateModel() {
        dtmdl = null;
    }

    private void createPagination() {
        pagination = null;
    }

    private void updateCurrentItem() {

        int count = itembean.count();
        if (selectedItenIndex >= count) {
            // selectedItem index cannot be bigger than number of items
            selectedItenIndex = count - 1;

            // go to previus page if last page disappeared:
            if (pagination.getPageFirstItem() >= count) {
                pagination.previousPage();
            }
        }
        if (selectedItenIndex >= 0) {
            item = itembean.findRange(new int[]{selectedItenIndex, selectedItenIndex + 1}).get(0);
        }
    }

    public String next() {
        getPagination().nextPage();
        recreateModel();
        return "home";
    }

    public String previus() {
        getPagination().previousPage();
        recreateModel();
        return "home";
    }

}
