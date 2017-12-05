package org.liao.entity;

import javax.persistence.*;

/**
 * Created by liao on 17-11-21.
 */

@Entity
@Table(name = "exam_question_difficulty", schema = "exam", catalog = "")
public class ExamQuestionDifficulty {
    private int id;
    private String difficulty;


    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }


    @Basic
    @Column(name = "difficulty")
    public String getDifficulty() {
        return difficulty;
    }
    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }
}
