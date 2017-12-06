package org.liao.controller.user.student;

import org.liao.persistence.AccountService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by liao on 17-6-11.
 */

@Controller
@RequestMapping("/")
public class AboutMeController {

    @Resource
    private AccountService accountService;

    @RequestMapping("/aboutMe")
    public String aboutMe() {

        return "aboutMe/index";
    }
}
