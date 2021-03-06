package org.liao.controller.manage.teacher;

import net.sf.json.JSONObject;
import org.liao.entity.ExamRecordEntity;
import org.liao.persistence.ExamRecordService;
import org.liao.util.QRCodeUtils;
import org.liao.util.ResponseModel;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by liao on 17-12-4.
 *
 */

@Controller
@RequestMapping("/teacher/exam/examRecord")
public class ExamRecordController {

    @Resource
    private ExamRecordService examRecordService;


    @RequestMapping("list")
    public ModelAndView list() {

        ModelAndView modelAndView = new ModelAndView();
        List<ExamRecordEntity> list = examRecordService.listExamRecord();
        Long sum = examRecordService.getSum();

        modelAndView.addObject("recordList", list);
        modelAndView.addObject("sum", sum);
        modelAndView.setViewName("teacher/exam/manageExamRecord");
        return modelAndView;
    }

    @RequestMapping("delete/{id}")
    @ResponseBody
    public Object delete(@PathVariable("id") Integer id) {

        ResponseModel response = examRecordService.delete(new ExamRecordEntity(id));
        return response;
    }

    /*发布考试*/
    @RequestMapping("release/{id}")
    @ResponseBody
    public Object release(@PathVariable("id") Integer id, HttpServletRequest request)
            throws IOException {

        String url = "test";
        String qrcodeName = QRCodeUtils.qrCodeEncode(url, request);
        ExamRecordEntity e = new ExamRecordEntity(id);
        e.setQrcodeUrl(qrcodeName);
        ResponseModel response = examRecordService.release(e);
        return response;
    }

    /*取消发布考试*/
    @RequestMapping("cancel/{id}")
    @ResponseBody
    public Object cancel(@PathVariable("id") Integer id) {
        ResponseModel response = examRecordService.cancel(new ExamRecordEntity(id));
        return response;
    }

    /*终止考试*/
/*    @RequestMapping("stop/{id}")
    @ResponseBody
    public Object stop(@PathVariable("id") Integer id) {

    }*/
}
