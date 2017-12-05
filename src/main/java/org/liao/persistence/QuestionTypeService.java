package org.liao.persistence;

import org.liao.entity.ExamQuestionType;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by liao on 17-12-4.
 *
 * question_type service
 */

@Repository
public class QuestionTypeService extends BaseService{
    public ExamQuestionType findByTypeName(String typeName) {
        String sql = "from ExamQuestionType where typeName=?";
        List<ExamQuestionType> list = getCurrentSession().createQuery(sql).setString(0,typeName).list();

        if (list.size() >= 1) {
            //找到相应的类型
            return list.get(0);
        } else {
            //未找到相应的类型
            return null;
        }
    }
}
