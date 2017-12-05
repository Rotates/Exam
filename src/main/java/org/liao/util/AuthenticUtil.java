package org.liao.util;

import net.sf.json.JSONObject;
import org.liao.entity.AccountEntity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by liao on 17-8-3.
 */
public class AuthenticUtil {


    /**
     * 验证登录提交的图形验证码是否正确
     * @param session
     * @param submitVerCode
     * @return
     * @throws Exception
     */
    public static boolean judgeVercode(HttpSession session,
                                String submitVerCode) throws Exception{

        /*检查验证码是否正确*/
        String tureVerCode = (String)session.getAttribute("verCode");

        if (!tureVerCode.equals(submitVerCode.toLowerCase())) {
            return false;
        }

        return true;
    }
}
