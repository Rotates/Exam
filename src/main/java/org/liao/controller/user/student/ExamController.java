package org.liao.controller.user.student;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.liao.controller.manage.teacher.ExamRecordController;
import org.liao.entity.AccountEntity;
import org.liao.entity.ExamQuestionEntity;
import org.liao.entity.ExamRecordEntity;
import org.liao.persistence.AccountService;
import org.liao.persistence.ExamRecordService;
import org.liao.persistence.QuestionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by liao on 17-12-6.
 *
 * 学生模块处理
 */

@Controller
@RequestMapping("/student")
public class ExamController {

    @Resource
    private ExamRecordService examRecordService;
    @Resource
    private QuestionService questionService;
    @Resource
    private AccountService accountService;


    @RequestMapping("/online/exam/{id}")
    public ModelAndView online_exam(@PathVariable("id") Integer id) {

        ModelAndView modelAndView = new ModelAndView();
        Integer state = examRecordService.state(new ExamRecordEntity(id));

        if (state == 1) {
            List<ExamQuestionEntity> list = questionService.findByRecordId(id);
            modelAndView.addObject("questions", list);
        } else if (state == 0) {
            //转到404页面
        } else if (state == -1) {
            //转到404页面
        }
        Timestamp d = new Timestamp(System.currentTimeMillis());
        Session session = SecurityUtils.getSubject().getSession();
        String sessionUserName = (String) session.getAttribute("user");
        accountService.updateStartTime(d, sessionUserName);
        modelAndView.setViewName("student/exam");

        return modelAndView;
    }
}
