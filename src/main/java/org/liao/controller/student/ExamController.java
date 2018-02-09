package org.liao.controller.student;

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


    /**
     * 根据试卷id，抽取试卷，进行考试。
     * @param id
     * @return
     */
    @RequestMapping("/online/exam/{id}")
    public ModelAndView online_exam(@PathVariable("id") Integer id) {

        ModelAndView modelAndView = new ModelAndView();
        ExamRecordEntity e = examRecordService.findById(id);

        Session session = SecurityUtils.getSubject().getSession();
        String sessionUserName = (String) session.getAttribute("user");
        AccountEntity a = accountService.findByUserName(sessionUserName);

        /*读取记录*/
        if (e.getIsStart() == 1) {
            List<ExamQuestionEntity> singleSelect = new ArrayList<>();
            List<ExamQuestionEntity> multipleSelect = new ArrayList<>();
            List<ExamQuestionEntity> fill = new ArrayList<>();
            List<ExamQuestionEntity> judg = new ArrayList<>();

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
                    judg.add(list.get(i));
                }
            }

            //随机打乱试题顺序
            Collections.shuffle(singleSelect);
            Collections.shuffle(multipleSelect);
            Collections.shuffle(fill);
            Collections.shuffle(judg);

            list.clear();

            for (int i = 0; i < singleSelect.size(); i++) {
                list.add(singleSelect.get(i));
            }

            for (int i = 0; i < multipleSelect.size(); i++) {
                list.add(multipleSelect.get(i));
            }

            for (int i = 0; i < fill.size(); i++) {
                list.add(fill.get(i));
            }

            for (int i = 0; i < judg.size(); i++) {
                list.add(judg.get(i));
            }

            modelAndView.addObject("questions", list);
            modelAndView.addObject("record", e);
            modelAndView.addObject("userName", sessionUserName);

            DateFormat sdf = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");

            if (a.getEndTime() != null) {

                String t = (String)session.getAttribute("endTime");
                if (t == null || t.equals("")) {
                    Timestamp timestamp = a.getEndTime();
                    session.setAttribute("endTime", sdf.format(timestamp));
                    modelAndView.addObject("endTime", sdf.format(timestamp));
                }
                modelAndView.addObject("endTime", t);
            } else {

                Timestamp d = new Timestamp(System.currentTimeMillis() + e.getTime()*60*1000);
                accountService.updateEndTime(d, sessionUserName);
                session.setAttribute("endTime", sdf.format(d));
                modelAndView.addObject("endTime", sdf.format(d));
            }

            modelAndView.setViewName("student/exam");

        } else if (e.getIsStart() == 0) {
            //转到404页面
            modelAndView.setViewName("student/404");

        } else if (e.getIsStart() == -1) {
            //转到404页面
            modelAndView.setViewName("student/404");
        }
        return modelAndView;
    }

    @RequestMapping("/submit/exam")
    public String submit(String keys, HttpServletResponse response) throws Exception {

        //改卷代码
        Session session = SecurityUtils.getSubject().getSession();
        String sessionUserName = (String) session.getAttribute("user");
        JSONObject object = new JSONObject();
        object.put("success", true);
        accountService.updateEndTime(null, sessionUserName);
        ResponseUtil.write(response, object);
        return "student/finished";
    }

    @RequestMapping("/exam/finished")
    public String examFinished() {
        return "student/finished";
    }
}
