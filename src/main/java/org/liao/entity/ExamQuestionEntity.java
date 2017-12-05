package org.liao.entity;

import javax.persistence.*;

@Entity
@Table(name = "exam_questions", schema = "exam", catalog = "")
public class ExamQuestionEntity {
    private int id;
    private String title;
    private String trueKey;
    private int type_id;
    private int score;
    private String resolution;
    private ExamRecordEntity examRecordEntity;
    private int exam_difficulty_id;
    private String option_a;
    private String option_b;
    private String option_c;
    private String option_d;
    private String option_e;
    private String option_f;
    private String option_g;
    private String option_h;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id")
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "score")
    public int getScore() {
        return score;
    }
    public void setScore(int score) {
        this.score = score;
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
    @Column(name = "trueKey")
    public String getTrueKey() {
        return trueKey;
    }

    public void setTrueKey(String trueKey) {
        this.trueKey = trueKey;
    }

    @Basic
    @Column(name = "type_id")
    public int getType_id() {
        return type_id;
    }
    public void setType_id(int type_id) {
        this.type_id = type_id;
    }


    @Basic
    @Column(name = "resolution")
    public String getResolution() {
        return resolution;
    }
    public void setResolution(String resolution) {
        this.resolution = resolution;
    }

    @Basic
    @Column(name = "exam_difficulty_id")
    public int getExam_difficulty_id() {
        return exam_difficulty_id;
    }
    public void setExam_difficulty_id(int exam_difficulty_id) {
        this.exam_difficulty_id = exam_difficulty_id;
    }


    @Basic
    @Column(name = "option_a")
    public String getOption_a() {
        return option_a;
    }
    public void setOption_a(String option_a) {
        this.option_a = option_a;
    }


    @Basic
    @Column(name = "option_b")
    public String getOption_b() {
        return option_b;
    }
    public void setOption_b(String option_b) {
        this.option_b = option_b;
    }


    @Basic
    @Column(name = "option_c")
    public String getOption_c() {
        return option_c;
    }
    public void setOption_c(String option_c) {
        this.option_c = option_c;
    }


    @Basic
    @Column(name = "option_d")
    public String getOption_d() {
        return option_d;
    }
    public void setOption_d(String option_d) {
        this.option_d = option_d;
    }


    @Basic
    @Column(name = "option_e")
    public String getOption_e() {
        return option_e;
    }
    public void setOption_e(String option_e) {
        this.option_e = option_e;
    }


    @Basic
    @Column(name = "option_f")
    public String getOption_f() {
        return option_f;
    }
    public void setOption_f(String option_f) {
        this.option_f = option_f;
    }


    @Basic
    @Column(name = "option_g")
    public String getOption_g() {
        return option_g;
    }
    public void setOption_g(String option_g) {
        this.option_g = option_g;
    }


    @Basic
    @Column(name = "option_h")
    public String getOption_h() {
        return option_h;
    }
    public void setOption_h(String option_h) {
        this.option_h = option_h;
    }

    @ManyToOne
    @JoinColumn(name = "exam_record_id")
    public ExamRecordEntity getExamRecordEntity() {
        return examRecordEntity;
    }

    public void setExamRecordEntity(ExamRecordEntity examRecordEntity) {
        this.examRecordEntity = examRecordEntity;
    }
}
