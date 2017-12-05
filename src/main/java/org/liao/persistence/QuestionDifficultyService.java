package org.liao.persistence;

import org.liao.entity.ExamQuestionDifficulty;
import org.springframework.stereotype.Repository;
import java.util.List;

/**
 * Created by liao on 17-12-4.
 *
 */

@Repository
public class QuestionDifficultyService extends BaseService{
    public ExamQuestionDifficulty findByDifficultyName(String name) {
        String sql = "from ExamQuestionDifficulty where difficulty=?";
        List<ExamQuestionDifficulty> list = getCurrentSession().createQuery(sql).setString(0,name).list();

        if (list.size() >= 1) {
            //找到相应的类型
            return list.get(0);
        } else {
            //未找到相应的类型
            return null;
        }
    }
}
