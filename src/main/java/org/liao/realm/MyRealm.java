package org.liao.realm;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.liao.entity.AccountEntity;
import org.liao.persistence.UserService;
import javax.annotation.Resource;
import java.util.HashSet;
import java.util.Set;

/**
 * 自定义realm
 */
public class MyRealm extends AuthorizingRealm {


    @Resource
    private UserService userService;

    /*授权*/
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        //获取登录时输入的用户名
        String userName=(String) principalCollection.fromRealm(getName()).iterator().next();
        AccountEntity account = userService.findByUserName(userName);

        if (account != null) {
            //权限信息对象info,用来存放查出的用户的所有的角色
            SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();

            String role = userService.getUserRole(account.getUserName());

            Set<String> set = new HashSet<>();
            set.add(role);
            //用户的角色集合
            info.setRoles(set);

            return info;
        }
        return null;
    }

    /*登录验证*/
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
            throws AuthenticationException {

        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;

        AccountEntity account = userService.findByUserName(token.getUsername());
        if (account != null) {

            SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(account.getUserName(),
                    account.getPassword(), getName());
            Session session = SecurityUtils.getSubject().getSession();
            session.setAttribute("user", account.getUserName());
            return info;
        } else {
            throw new AuthenticationException();
        }
    }
}
