package org.liao.entity;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "exam_record", schema = "exam", catalog = "")
public class ExamRecordEntity {
    private int id;
    private String title;
    private int time;
    private String selectWeek;
    private int isStart;
    private String userName;
    private Timestamp createDate;
    private String qrcodeUrl;
    private List<ExamQuestionEntity> questionEntityList;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "isStart")
    public int getIsStart() {
        return isStart;
    }

    public void setIsStart(int isStart) {
        this.isStart = isStart;
    }

    @Basic
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "time")
    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    @Basic
    @Column(name = "selectWeek")
    public String getSelectWeek() {
        return selectWeek;
    }

    public void setSelectWeek(String selectWeek) {
        this.selectWeek = selectWeek;
    }

    @Basic
    @Column(name = "userName")
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Basic
    @Column(name = "createDate")
    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    @Basic
    @Column(name = "qrcodeUrl")
    public String getQrcodeUrl() {
        return qrcodeUrl;
    }
    public void setQrcodeUrl(String qrcodeUrl) {
        this.qrcodeUrl = qrcodeUrl;
    }

    @Override
    public String toString() {
        return title + time + selectWeek;
    }

    @OneToMany(cascade = {CascadeType.ALL})
    @JoinColumn(name = "exam_record_id")
    public List<ExamQuestionEntity> getQuestionEntityList() {
        return questionEntityList;
    }

    public void setQuestionEntityList(List<ExamQuestionEntity> questionEntityList) {
        this.questionEntityList = questionEntityList;
    }

    public ExamRecordEntity(int id) {
        this.id = id;
    }

    public ExamRecordEntity() {
    }
}
