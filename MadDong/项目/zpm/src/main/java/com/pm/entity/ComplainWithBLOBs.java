package com.pm.entity;

/**
 * @author cjd
 *
 */
public class ComplainWithBLOBs extends Complain {
    private String complainContent;

    private String complainFdb;

    public String getComplainContent() {
        return complainContent;
    }

    public void setComplainContent(String complainContent) {
        this.complainContent = complainContent == null ? null : complainContent.trim();
    }

    public String getComplainFdb() {
        return complainFdb;
    }

    public void setComplainFdb(String complainFdb) {
        this.complainFdb = complainFdb == null ? null : complainFdb.trim();
    }

}