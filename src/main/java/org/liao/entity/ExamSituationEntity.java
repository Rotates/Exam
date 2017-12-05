package org.liao.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "exam_situation", schema = "exam", catalog = "")
public class ExamSituationEntity {
    private int id;
    private int exam_record_id;
    private String login_ip;
    private Date login_time;
    private int exam_state_id;
    private String internet_state;


    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "exam_record_id")
    public int getExam_record_id() {
        return exam_record_id;
    }

    public void setExam_record_id(int exam_record_id) {
        this.exam_record_id = exam_record_id;
    }

    @Basic
    @Column(name = "login_ip")
    public String getLogin_ip() {
        return login_ip;
    }

    public void setLogin_ip(String login_ip) {
        this.login_ip = login_ip;
    }

    @Basic
    @Column(name = "login_time")
    public Date getLogin_time() {
        return login_time;
    }

    public void setLogin_time(Date login_time) {
        this.login_time = login_time;
    }

    @Basic
    @Column(name = "exam_state_id")
    public int getExam_state_id() {
        return exam_state_id;
    }

    public void setExam_state_id(int exam_state_id) {
        this.exam_state_id = exam_state_id;
    }

    @Basic
    @Column(name = "internet_state")
    public String getInternet_state() {
        return internet_state;
    }

    public void setInternet_state(String internet_state) {
        this.internet_state = internet_state;
    }
}
