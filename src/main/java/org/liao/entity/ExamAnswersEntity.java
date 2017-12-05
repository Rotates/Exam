package org.liao.entity;

import javax.persistence.*;

@Entity
@Table(name = "exam_answers", schema = "exam", catalog = "")
public class ExamAnswersEntity {
    private int id;
    private String userName;
    private int exam_question_id;
    private String answer;
    private int score;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    @Column(name = "exam_question_id")
    public int getExam_question_id() {
        return exam_question_id;
    }

    public void setExam_question_id(int exam_question_id) {
        this.exam_question_id = exam_question_id;
    }

    @Basic
    @Column(name = "answer")
    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Basic
    @Column(name = "score")
    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
}
