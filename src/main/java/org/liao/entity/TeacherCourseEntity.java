package org.liao.entity;

import javax.persistence.*;

@Entity
@Table(name = "teacher_course", schema = "exam", catalog = "")
public class TeacherCourseEntity {
    private int id;
    private String courseNumber;
    private String courseName;
    private String teacher;
    private String weekmessage;
    private String week;
    private String time;
    private String classroom;
    private String isauto;
    private String compus;
    private String teacherNo;

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
    @Column(name = "courseName")
    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    @Basic
    @Column(name = "teacher")
    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    @Basic
    @Column(name = "weekmessage")
    public String getWeekmessage() {
        return weekmessage;
    }

    public void setWeekmessage(String weekmessage) {
        this.weekmessage = weekmessage;
    }

    @Basic
    @Column(name = "week")
    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week;
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
    @Column(name = "classroom")
    public String getClassroom() {
        return classroom;
    }

    public void setClassroom(String classroom) {
        this.classroom = classroom;
    }

    @Basic
    @Column(name = "isauto")
    public String getIsauto() {
        return isauto;
    }

    public void setIsauto(String isauto) {
        this.isauto = isauto;
    }

    @Basic
    @Column(name = "compus")
    public String getCompus() {
        return compus;
    }

    public void setCompus(String compus) {
        this.compus = compus;
    }

    @Basic
    @Column(name = "teacher_no")
    public String getTeacherNo() {
        return teacherNo;
    }

    public void setTeacherNo(String teacherNo) {
        this.teacherNo = teacherNo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TeacherCourseEntity that = (TeacherCourseEntity) o;

        if (id != that.id) return false;
        if (courseNumber != null ? !courseNumber.equals(that.courseNumber) : that.courseNumber != null) return false;
        if (courseName != null ? !courseName.equals(that.courseName) : that.courseName != null) return false;
        if (teacher != null ? !teacher.equals(that.teacher) : that.teacher != null) return false;
        if (weekmessage != null ? !weekmessage.equals(that.weekmessage) : that.weekmessage != null) return false;
        if (week != null ? !week.equals(that.week) : that.week != null) return false;
        if (time != null ? !time.equals(that.time) : that.time != null) return false;
        if (classroom != null ? !classroom.equals(that.classroom) : that.classroom != null) return false;
        if (isauto != null ? !isauto.equals(that.isauto) : that.isauto != null) return false;
        if (compus != null ? !compus.equals(that.compus) : that.compus != null) return false;
        if (teacherNo != null ? !teacherNo.equals(that.teacherNo) : that.teacherNo != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (courseNumber != null ? courseNumber.hashCode() : 0);
        result = 31 * result + (courseName != null ? courseName.hashCode() : 0);
        result = 31 * result + (teacher != null ? teacher.hashCode() : 0);
        result = 31 * result + (weekmessage != null ? weekmessage.hashCode() : 0);
        result = 31 * result + (week != null ? week.hashCode() : 0);
        result = 31 * result + (time != null ? time.hashCode() : 0);
        result = 31 * result + (classroom != null ? classroom.hashCode() : 0);
        result = 31 * result + (isauto != null ? isauto.hashCode() : 0);
        result = 31 * result + (compus != null ? compus.hashCode() : 0);
        result = 31 * result + (teacherNo != null ? teacherNo.hashCode() : 0);
        return result;
    }
}
