package org.liao.entity;

import javax.persistence.*;

@Entity
@Table(name = "classes", schema = "exam", catalog = "")
public class ClassesEntity {
    private int id;
    private String name;
    private Integer charge;
    private Integer learner;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "charge")
    public Integer getCharge() {
        return charge;
    }

    public void setCharge(Integer charge) {
        this.charge = charge;
    }

    @Basic
    @Column(name = "learner")
    public Integer getLearner() {
        return learner;
    }

    public void setLearner(Integer learner) {
        this.learner = learner;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ClassesEntity that = (ClassesEntity) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (charge != null ? !charge.equals(that.charge) : that.charge != null) return false;
        if (learner != null ? !learner.equals(that.learner) : that.learner != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (charge != null ? charge.hashCode() : 0);
        result = 31 * result + (learner != null ? learner.hashCode() : 0);
        return result;
    }
}
