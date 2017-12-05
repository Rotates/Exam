package org.liao.util;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * 向页面返回response.
 * Created by liao on 17-6-21.
 */
public class ResponseUtil {
    public static void write(HttpServletResponse response, Object o) throws Exception{

        response.setContentType("text/html;charset=utf-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.println(o.toString());
        printWriter.flush();
        printWriter.close();
    }
}
