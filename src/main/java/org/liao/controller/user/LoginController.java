package org.liao.controller.user;

import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.liao.entity.AccountEntity;
import org.liao.entity.RoleEntity;
import org.liao.entity.TeacherListEntity;
import org.liao.persistence.TeacherService;
import org.liao.persistence.UserService;
import org.liao.util.AuthenticUtil;
import org.liao.util.ResponseUtil;
import org.liao.util.VerifyCodeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by liao on 17-6-7.
 */

@Controller
@RequestMapping("/")
public class LoginController {

    @Resource
    private UserService userService;
    @Resource
    private TeacherService teacherService;




    /**
     * 转向登录页面
     * @return
     */
    @RequestMapping("/login")
    public String login() {

        return "login";
    }




    /**
     * 登录验证
     * @param account
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/login/authenticate")
    public void authenticate(AccountEntity account,
                             HttpServletRequest request,
                             HttpServletResponse response) throws Exception{

        /*object状态码,error(-1),student(0), teacher(1), admin(2)*/
        JSONObject object = new JSONObject();
        HttpSession session = request.getSession(true);
        String trueVerCode = (String)session.getAttribute("verCode");

        /*验证码验证*/
        if (trueVerCode.equals(account.getVerCode().toLowerCase())) {

            /*登录信息验证*/
            AccountEntity user = userService.findByUserName(account.getUserName());
            if (user == null) {
                System.out.println("test");
                TeacherListEntity teacher = teacherService.findTeacher(account.getUserName());
                if (teacher == null) {
                    object.put("result","-1");
                } else {
                    if (account.getUserName().equals(account.getPassword())) {

                        //password加密
                        String hashAlgorithmName = "MD5";
                        String credentials = account.getPassword();
                        int hashIterations = 1024;
                        ByteSource credentialsSalt = ByteSource.Util.bytes("liubo");
                        Object obj = new SimpleHash(hashAlgorithmName, credentials, credentialsSalt, hashIterations);

                        teacherService.addTeacher(account.getUserName(), obj.toString());

                        UsernamePasswordToken token = new UsernamePasswordToken(account.getUserName(), obj.toString());
                        Subject subject = SecurityUtils.getSubject();
                        try {
                            subject.login(token);
                            String role = userService.getUserRole(account.getUserName());
                            if (role.equals("teacher")) {
                                object.put("result","1");
                            } else if (role.equals("manage")){
                                object.put("result", "2");
                            } else if (role.equals("student")) {
                                object.put("result", "0");
                            }
                        } catch (Exception e) {
                            object.put("result","-1");
                        }
                    } else {
                        object.put("result","-1");
                    }
                }
            } else {
                //password加密
                String hashAlgorithmName = "MD5";
                String credentials = account.getPassword();
                int hashIterations = 1024;
                ByteSource credentialsSalt = ByteSource.Util.bytes("liubo");
                Object obj = new SimpleHash(hashAlgorithmName, credentials, credentialsSalt, hashIterations);

                UsernamePasswordToken token = new UsernamePasswordToken(account.getUserName(), obj.toString());

                /*设置记住我功能*/
                if (account.getRememberMe().equals("1")) {
                    token.setRememberMe(true);
                }

                Subject subject = SecurityUtils.getSubject();
                try {
                    subject.login(token);
                    String role = userService.getUserRole(account.getUserName());
                    if (role.equals("teacher")) {
                        object.put("result","1");
                    } else if (role.equals("manage")){
                        object.put("result", "2");
                    }
                } catch (Exception e) {
                    System.out.println(e);
                    object.put("result","-1");
                }
            }
        } else {
            object.put("verCode", "-1");
        }

        ResponseUtil.write(response, object);
    }




    /**
     * 获取验证码的请求
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/login/getVerify")
    public void getVerify(HttpServletRequest request,
                          HttpServletResponse response) throws Exception{

        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");

        //生成随机字串
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
        //存入会话session
        HttpSession session = request.getSession(true);
        //删除以前的
        session.removeAttribute("verCode");
        session.setAttribute("verCode", verifyCode.toLowerCase());
        //生成图片
        int w = 100, h = 30;
        VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);
    }




    /**
     * 注销登录,删除在b端和s端的cookie值
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/logout")
    public void logout(HttpServletRequest request,
                       HttpServletResponse response)
            throws Exception{

        Cookie[] cookies = request.getCookies();

        for (Cookie c:cookies) {
            if (c.getName().equals("autoLoginUser")) {

                /*删除userName对应的session*/
                Cookie cookie = new Cookie("autoLoginUser","");
                cookie.setMaxAge(0);

                /*删除db中对应的sessionId*/
                response.addCookie(cookie);
            }

            if (c.getName().equals("sessionId")) {

                /*删除sessionId对应的session*/
                Cookie cookie = new Cookie("sessionId","");
                cookie.setMaxAge(0);

                response.addCookie(cookie);
            }
        }
        JSONObject object = new JSONObject();
        object.put("success", true);
        ResponseUtil.write(response, object);

    }
}
