package org.liao.entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "school_course", schema = "exam", catalog = "")
public class SchoolCourseEntity {
    private int rid;
    private String schoolZone;
    private String courseNo;
    private String courseName;
    private String departCode;
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
    @Column(name = "course_no")
    public String getCourseNo() {
        return courseNo;
    }

    public void setCourseNo(String courseNo) {
        this.courseNo = courseNo;
    }

    @Basic
    @Column(name = "course_name")
    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
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

        SchoolCourseEntity that = (SchoolCourseEntity) o;

        if (rid != that.rid) return false;
        if (schoolZone != null ? !schoolZone.equals(that.schoolZone) : that.schoolZone != null) return false;
        if (courseNo != null ? !courseNo.equals(that.courseNo) : that.courseNo != null) return false;
        if (courseName != null ? !courseName.equals(that.courseName) : that.courseName != null) return false;
        if (departCode != null ? !departCode.equals(that.departCode) : that.departCode != null) return false;
        if (remarks != null ? !remarks.equals(that.remarks) : that.remarks != null) return false;
        if (createData != null ? !createData.equals(that.createData) : that.createData != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = rid;
        result = 31 * result + (schoolZone != null ? schoolZone.hashCode() : 0);
        result = 31 * result + (courseNo != null ? courseNo.hashCode() : 0);
        result = 31 * result + (courseName != null ? courseName.hashCode() : 0);
        result = 31 * result + (departCode != null ? departCode.hashCode() : 0);
        result = 31 * result + (remarks != null ? remarks.hashCode() : 0);
        result = 31 * result + (createData != null ? createData.hashCode() : 0);
        return result;
    }
}
