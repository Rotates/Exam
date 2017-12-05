package org.liao.entity;

import javax.persistence.*;

/**
 * Created by liao on 17-11-17.
 */

@Entity
@Table(name = "exam_question_type", schema = "exam", catalog = "")
public class ExamQuestionType {
    private int id;
    private String typeName;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "typeName")
    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
}
