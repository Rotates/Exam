package org.liao.controller.manage.teacher;

import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.liao.entity.AccountEntity;
import org.liao.entity.ExamQuestionEntity;
import org.liao.entity.ExamRecordEntity;
import org.liao.persistence.AccountService;
import org.liao.persistence.ExamRecordService;
import org.liao.persistence.QuestionService;
import org.liao.util.ResponseUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by liao on 18-2-9.
 *
 */

@Controller
@RequestMapping("/teacher/exam")
public class TeacherExamController {

    @Resource
    private ExamRecordService examRecordService;
    @Resource
    private QuestionService questionService;
    @Resource
    private AccountService accountService;

    @RequestMapping("/edit/{id}")
    public ModelAndView edit(@PathVariable("id") Integer id) {
        ModelAndView modelAndView = new ModelAndView();
        ExamRecordEntity e = examRecordService.findById(id);

        List<ExamQuestionEntity> singleSelect = new ArrayList<>();
        List<ExamQuestionEntity> multipleSelect = new ArrayList<>();
        List<ExamQuestionEntity> fill = new ArrayList<>();
        List<ExamQuestionEntity> judge = new ArrayList<>();

        List<ExamQuestionEntity> list = questionService.findByRecordId(id);

        //试题分类
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getType_id() == 1) {
                singleSelect.add(list.get(i));
            } else if (list.get(i).getType_id() == 2) {
                multipleSelect.add(list.get(i));
            } else if (list.get(i).getType_id() == 3) {
                fill.add(list.get(i));
            } else if (list.get(i).getType_id() == 4) {
                judge.add(list.get(i));
            }
        }

        modelAndView.addObject("singleSelect", singleSelect);
        modelAndView.addObject("multipleSelect", multipleSelect);
        modelAndView.addObject("fill", fill);
        modelAndView.addObject("judge", judge);
        modelAndView.addObject("record", e);


        modelAndView.setViewName("teacher/exam/edit");
        return modelAndView;
    }
}
