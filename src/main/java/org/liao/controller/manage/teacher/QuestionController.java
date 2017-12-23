package org.liao.controller.manage.teacher;

import net.sf.json.JSONObject;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.liao.entity.*;
import org.liao.persistence.ExamRecordService;
import org.liao.persistence.QuestionDifficultyService;
import org.liao.persistence.QuestionTypeService;
import org.liao.persistence.TeacherCourseService;
import org.liao.util.DateUtil;
import org.liao.util.ExcelUtil;
import org.liao.util.GetHtml;
import org.liao.util.ResponseUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.Timestamp;
import java.util.*;

/**
 * Created by liao on 17-7-13.
 *
 */

@Controller
@RequestMapping("/teacher")
public class QuestionController {

    @Resource
    private TeacherCourseService teacherCourseService;
    @Resource
    private ExamRecordService examRecordService;
    @Resource
    private QuestionTypeService questionTypeService;
    @Resource
    private QuestionDifficultyService difficultyService;

    private  static  String  currentWeek=null;

    /**
     * 获取老师的课表信息,并将课表信息modelMap发送到前台
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("/exam/import")
    public String importQuestion(HttpServletRequest request,
                                 ModelMap modelMap) {

        /*数据结构需要null与实体共存*/
        List<Map<String, TeacherCourseEntity>> list = new ArrayList<>();

        Session session = SecurityUtils.getSubject().getSession();
        String teacher_no = (String) session.getAttribute("user");

        List<TeacherCourseEntity> courses = teacherCourseService.findCourseById(teacher_no);

        for (int i = 0; i < courses.size(); i++) {
            if (courses.get(i).getTime().contains(",")){
                String time = courses.get(i).getTime();
                String[] time_split = time.split(",");
                for (String str:time_split) {
                    int time_int = Integer.valueOf(str);
                    modelMap.addAttribute("class"+str, courses.get(i));
                }
            } else {
                String str = courses.get(i).getTime();
                modelMap.addAttribute("class"+str, courses.get(i));
            }
        }

        String regex = "当前校历(.*)教学周";
        String current = GetHtml.getCurrentWeek(regex, GetHtml.getPage("http://jiaowu.sicau.edu.cn/web/web/web/index.asp"));
        String t = current.substring(current.length()-2, current.length());
        char[] c = t.toCharArray();


        if (c[0] >= '1' && c[0] <= '9')
            QuestionController.currentWeek = String.valueOf(c[0]) + String.valueOf(c[1]);
        else
            QuestionController.currentWeek = String.valueOf(c[1]);

        return "teacher/exam/import";
    }




    /**
     * 获取发布试题的周信息
     * @param weekMessage
     * @param val
     * @param x
     * @param y
     * @param response
     * @throws Exception
     */
    @RequestMapping("/getWeekList/exam")
    public void getWeekList(String weekMessage,
                            String val,
                            String x,
                            String y,
                            HttpServletResponse response) throws Exception{

        JSONObject object = new JSONObject();
        int[] times = {8, 10, 14, 16, 19};

        weekMessage = weekMessage.replaceAll("周", "");

        if (weekMessage.contains("-")) {
            String[] week = weekMessage.split("-");
            if (Integer.valueOf(currentWeek) >= Integer.valueOf(week[0])
                    && Integer.valueOf(currentWeek) <= Integer.valueOf(week[1])) {

                /*判断当前时间(周,小时)是否小于目标时间,并返回当前周次和最后周次*/
                if (Integer.valueOf(DateUtil.getWeekOfDate(new Date())) < (Integer.valueOf(x) + 1)) {
                    object.put("flag", "thisWeek");

                    object.put("currentWeek", currentWeek);
                    object.put("lastWeek", week[1]);
                } else if (Integer.valueOf(DateUtil.getWeekOfDate(new Date())) == (Integer.valueOf(x) + 1) &&
                        DateUtil.getCurrentHour() < times[Integer.valueOf(y)]) {
                    object.put("flag", "thisWeek");
                    object.put("currentWeek", currentWeek);
                    object.put("lastWeek", week[1]);
                } else {
                    object.put("flag", "nextWeek");
                    object.put("currentWeek", currentWeek);
                    object.put("lastWeek", week[1]);
                }

/*                object.put("weekList1", currentWeek);
                String weekList2 = String.valueOf(Integer.valueOf(currentWeek) + 1);*/

            }
        } else if (weekMessage.contains(",")) {
            //逻辑代码

        }

        ResponseUtil.write(response, object);
    }


    /**
     * 保存老师提交的试题文件
     * @param file
     * @param request
     */
    @RequestMapping("/save/exam")
    public void save(@RequestParam("file") MultipartFile file,
                     ExamRecordEntity examRecordEntity,
                     HttpServletRequest request,
                     HttpServletResponse response) throws Exception {

        JSONObject object = new JSONObject();
        if (!file.getOriginalFilename().equals("")) {
            String path = request.getSession().getServletContext().getRealPath("/static/exam");
            String testFileName = file.getOriginalFilename();
            String prefix=testFileName.substring(testFileName.lastIndexOf(".")+1);
            String name=String.valueOf(Calendar.getInstance().getTimeInMillis());
            String fileName=name+"."+prefix;

            File targetFile = new File(path, fileName);
            try {
                file.transferTo(targetFile);
            } catch (IOException e) {
                e.printStackTrace();
            }

            //对excel的cell进行验证
            Workbook workbook = ExcelUtil.getWeebWork(targetFile.getAbsolutePath());
            Sheet sheet = workbook.getSheetAt(0);

            int rownum = sheet.getLastRowNum();// 获取总行数
            List<ExamQuestionEntity> list = new ArrayList<>();

            System.out.println(rownum);
            for (int i = 1; i <= rownum; i++) {
                Row row = sheet.getRow(i);
                Cell test = row.getCell(1);
                System.out.println(test.getStringCellValue());

                List<String> data = new ArrayList<>();

                for (int j = 0; j < sheet.getRow(0).getLastCellNum(); j++) {
                    data.add("");
                }

                System.out.println();
                for (int j = 0; j < sheet.getRow(0).getLastCellNum(); j++) {
                    if (row.getCell(j) != null) {
                        Cell celldata = row.getCell(j);
                        if (celldata.getCellType() == Cell.CELL_TYPE_STRING)
                            data.set(j, celldata.getStringCellValue());
                        else if (celldata.getCellType() == Cell.CELL_TYPE_NUMERIC)  {
                            celldata.setCellType(Cell.CELL_TYPE_STRING);
                            data.set(j, celldata.getStringCellValue());
                        }
                    }
                }

                //这里需要验证
                ExamQuestionType type = questionTypeService.findByTypeName(data.get(1));
                ExamQuestionDifficulty difficulty = difficultyService.findByDifficultyName(data.get(12));
                if (data.get(0).equals("")) {
                    object.put("error", "格式错误,标题不能为空！");
                    ResponseUtil.write(response, object);
                    return;
                } else if (type == null) {
                    object.put("error", "格式错误，不支持的题目类型!");
                    ResponseUtil.write(response, object);
                    return;
                } else if (difficulty == null) {
                    object.put("error", "格式错误，不支持的题目难度!");
                    ResponseUtil.write(response, object);
                    return;
                } else if (data.get(10).equals("")) {
                    object.put("error", "格式错误，答案不能为空!");
                    ResponseUtil.write(response, object);
                    return;
                }

                //整理数据
                ExamQuestionEntity e = new ExamQuestionEntity();
                e.setTitle(data.get(0));
                e.setType_id(type.getId());
                e.setOption_a(data.get(2));
                e.setOption_b(data.get(3));
                e.setOption_c(data.get(4));
                e.setOption_d(data.get(5));
                e.setOption_e(data.get(6));
                e.setOption_f(data.get(7));
                e.setOption_g(data.get(8));
                e.setOption_h(data.get(9));
                e.setTrueKey(data.get(10));
                e.setScore(Integer.parseInt(data.get(11)));
                e.setExam_difficulty_id(difficulty.getId());
                e.setResolution(data.get(13));

                list.add(e);
            }

            //插入数据

            //获取session中的用户名
            Session session = SecurityUtils.getSubject().getSession();
            String sessionUserName = (String) session.getAttribute("user");

            //获取当前时间
            Timestamp d = new Timestamp(System.currentTimeMillis());
            examRecordEntity.setCreateDate(d);

            examRecordEntity.setUserName(sessionUserName);
            examRecordEntity.setQuestionEntityList(list);
            examRecordService.save(examRecordEntity);
            object.put("success", true);

        } else {
            object.put("error", "文件不能为空！");
        }

        ResponseUtil.write(response, object);
    }

}
