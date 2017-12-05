package org.liao.entity;

import javax.persistence.*;

@Entity
@Table(name = "role", schema = "exam")
public class RoleEntity {
    private int id;
    private String rolename;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "rolename")
    public String getRolename() {
        return rolename;
    }
    public void setRolename(String rolename) {
        this.rolename = rolename;
    }
}
