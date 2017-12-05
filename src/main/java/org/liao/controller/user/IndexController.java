package org.liao.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 首页路径控制
 * Created by liao on 17-6-11.
 */

@Controller
@RequestMapping("/")
public class IndexController {

    @RequestMapping("/student")
    public String index() {

        return "index";
    }

    /*学生首页*/
    @RequestMapping("/")
    public String index2() {

        return "index";
    }

    /*老师首页*/
    @RequestMapping("/teacher/index")
    public String manageIndex() {
        return "teacher/index";
    }

}
