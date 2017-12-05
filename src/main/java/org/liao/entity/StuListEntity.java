package org.liao.entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "stu_list", schema = "exam", catalog = "")
public class StuListEntity {
    private int rid;
    private String schoolZone;
    private String stuNo;
    private String stuName;
    private String sex;
    private String departCode;
    private String grade;
    private String major;
    private String classes;
    private String atSchool;
    private String remarks;
    private Timestamp createData;

    @Id
    @Column(name = "rid")
    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    @Basic
    @Column(name = "school_zone")
    public String getSchoolZone() {
        return schoolZone;
    }

    public void setSchoolZone(String schoolZone) {
        this.schoolZone = schoolZone;
    }

    @Basic
    @Column(name = "stu_no")
    public String getStuNo() {
        return stuNo;
    }

    public void setStuNo(String stuNo) {
        this.stuNo = stuNo;
    }

    @Basic
    @Column(name = "stu_name")
    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    @Basic
    @Column(name = "sex")
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Basic
    @Column(name = "depart_code")
    public String getDepartCode() {
        return departCode;
    }

    public void setDepartCode(String departCode) {
        this.departCode = departCode;
    }

    @Basic
    @Column(name = "grade")
    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    @Basic
    @Column(name = "major")
    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    @Basic
    @Column(name = "classes")
    public String getClasses() {
        return classes;
    }

    public void setClasses(String classes) {
        this.classes = classes;
    }

    @Basic
    @Column(name = "at_school")
    public String getAtSchool() {
        return atSchool;
    }

    public void setAtSchool(String atSchool) {
        this.atSchool = atSchool;
    }

    @Basic
    @Column(name = "remarks")
    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Basic
    @Column(name = "create_data")
    public Timestamp getCreateData() {
        return createData;
    }

    public void setCreateData(Timestamp createData) {
        this.createData = createData;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        StuListEntity that = (StuListEntity) o;

        if (rid != that.rid) return false;
        if (schoolZone != null ? !schoolZone.equals(that.schoolZone) : that.schoolZone != null) return false;
        if (stuNo != null ? !stuNo.equals(that.stuNo) : that.stuNo != null) return false;
        if (stuName != null ? !stuName.equals(that.stuName) : that.stuName != null) return false;
        if (sex != null ? !sex.equals(that.sex) : that.sex != null) return false;
        if (departCode != null ? !departCode.equals(that.departCode) : that.departCode != null) return false;
        if (grade != null ? !grade.equals(that.grade) : that.grade != null) return false;
        if (major != null ? !major.equals(that.major) : that.major != null) return false;
        if (classes != null ? !classes.equals(that.classes) : that.classes != null) return false;
        if (atSchool != null ? !atSchool.equals(that.atSchool) : that.atSchool != null) return false;
        if (remarks != null ? !remarks.equals(that.remarks) : that.remarks != null) return false;
        if (createData != null ? !createData.equals(that.createData) : that.createData != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = rid;
        result = 31 * result + (schoolZone != null ? schoolZone.hashCode() : 0);
        result = 31 * result + (stuNo != null ? stuNo.hashCode() : 0);
        result = 31 * result + (stuName != null ? stuName.hashCode() : 0);
        result = 31 * result + (sex != null ? sex.hashCode() : 0);
        result = 31 * result + (departCode != null ? departCode.hashCode() : 0);
        result = 31 * result + (grade != null ? grade.hashCode() : 0);
        result = 31 * result + (major != null ? major.hashCode() : 0);
        result = 31 * result + (classes != null ? classes.hashCode() : 0);
        result = 31 * result + (atSchool != null ? atSchool.hashCode() : 0);
        result = 31 * result + (remarks != null ? remarks.hashCode() : 0);
        result = 31 * result + (createData != null ? createData.hashCode() : 0);
        return result;
    }
}
