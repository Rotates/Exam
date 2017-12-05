package org.liao.entity;

import javax.persistence.*;

@Entity
@Table(name = "selected_class", schema = "exam", catalog = "")
public class SelectedClassEntity {
    private int id;
    private String courseNumber;
    private String studentId;
    private String ip;
    private String time;
    private String lock;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "courseNumber")
    public String getCourseNumber() {
        return courseNumber;
    }

    public void setCourseNumber(String courseNumber) {
        this.courseNumber = courseNumber;
    }

    @Basic
    @Column(name = "studentId")
    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    @Basic
    @Column(name = "ip")
    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    @Basic
    @Column(name = "time")
    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Basic
    @Column(name = "lock")
    public String getLock() {
        return lock;
    }

    public void setLock(String lock) {
        this.lock = lock;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SelectedClassEntity that = (SelectedClassEntity) o;

        if (id != that.id) return false;
        if (courseNumber != null ? !courseNumber.equals(that.courseNumber) : that.courseNumber != null) return false;
        if (studentId != null ? !studentId.equals(that.studentId) : that.studentId != null) return false;
        if (ip != null ? !ip.equals(that.ip) : that.ip != null) return false;
        if (time != null ? !time.equals(that.time) : that.time != null) return false;
        if (lock != null ? !lock.equals(that.lock) : that.lock != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (courseNumber != null ? courseNumber.hashCode() : 0);
        result = 31 * result + (studentId != null ? studentId.hashCode() : 0);
        result = 31 * result + (ip != null ? ip.hashCode() : 0);
        result = 31 * result + (time != null ? time.hashCode() : 0);
        result = 31 * result + (lock != null ? lock.hashCode() : 0);
        return result;
    }
}
