package org.liao.persistence;

import org.liao.entity.ExamQuestionEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by liao on 17-12-6.
 */


@Repository
public class QuestionService extends BaseService {

    public List<ExamQuestionEntity> findByRecordId(Integer id) {
        String sql = "from ExamQuestionEntity where exam_record_id=?";
        return getCurrentSession().createQuery(sql).setInteger(0, id).list();
    }
}
