package org.liao.controller.manage.teacher;


import net.sf.json.JSONObject;
import org.liao.entity.ExamQuestionEntity;
import org.liao.entity.ExamRecordEntity;
import org.liao.persistence.QuestionService;
import org.liao.util.ResponseUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by liao on 17-7-13.
 *
 */

@Controller
@RequestMapping("/teacher/exam")
public class QuestionController {


    @Resource
    private QuestionService questionService;

    /*选择题类型的题目更新*/
    @RequestMapping("optionQuestion/update/{id}")
    public void hasOptionUpdate(@PathVariable("id") Integer id,
                                ExamQuestionEntity e,
                                HttpServletRequest request,
                                HttpServletResponse response) throws Exception {


        JSONObject object = new JSONObject();
        String[] keys = request.getParameter("keys_json").split("\"");

        ExamQuestionEntity question = questionService.findById(e.getId());
        question.setScore(e.getScore());
        question.setResolution(e.getResolution());
        question.setExam_difficulty_id(e.getExam_difficulty_id());
        question.setTrueKey(e.getTrueKey());
        question.setTitle(e.getTitle());


        for (int i = 3; i < keys.length; i++) {
            int num = (i-3)/4;
            int temp = (i-3)%4;
            if (num == 0 && temp == 0) {

                question.setOption_a(keys[i]);
            } else if (num == 1 && temp == 0) {

                question.setOption_b(keys[i]);
            } else if (num == 2 && temp == 0) {

                question.setOption_c(keys[i]);
            } else if (num == 3 && temp == 0) {

                question.setOption_d(keys[i]);
            } else if (num == 4 && temp == 0) {

                question.setOption_e(keys[i]);
            } else if (num == 5 && temp == 0) {

                question.setOption_f(keys[i]);
            } else if (num == 6 && temp == 0) {

                question.setOption_g(keys[i]);
            } else if (num == 7 && temp == 0) {

                question.setOption_h(keys[i]);
            }
        }

        questionService.update(question);

        object.put("success", true);
        ResponseUtil.write(response, object);
    }

    /*选择题类型的题目更新*/
    @RequestMapping("noOptionQuestion/update/{id}")
    public void noOptionUpdate(@PathVariable("id") Integer id,
                                ExamQuestionEntity e,
                                HttpServletRequest request,
                                HttpServletResponse response) throws Exception {


        JSONObject object = new JSONObject();

        ExamQuestionEntity question = questionService.findById(e.getId());
        question.setScore(e.getScore());
        question.setResolution(e.getResolution());
        question.setExam_difficulty_id(e.getExam_difficulty_id());
        question.setTrueKey(e.getTrueKey());
        question.setTitle(e.getTitle());

        questionService.update(question);

        object.put("success", true);
        ResponseUtil.write(response, object);
    }
}
