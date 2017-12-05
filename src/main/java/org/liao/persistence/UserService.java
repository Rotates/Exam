package org.liao.persistence;

import org.liao.entity.AccountEntity;
import org.springframework.stereotype.Repository;
import java.util.List;

/**
 * Created by liao on 17-6-15.
 */

@Repository
public class UserService extends BaseService {

    public AccountEntity findByUserName(String userName) {

        String sql = "from AccountEntity where userName = ?";

        List<AccountEntity> list = getCurrentSession().createQuery(sql).setString(0, userName).list();

        if (list.size() >= 1) {
            return list.get(0);
        } else {
            return null;
        }
    }

    /**
     * 获取用户的角色信息
     * @param userName
     * @return
     */
    public String getUserRole(String userName) {
        String sql = "select r.rolename from RoleEntity as r,AccountRoleEntity as a where r.id=a.role_id and a.userName=?";
        List<Object> list = getCurrentSession().createQuery(sql).setString(0, userName).list();

        if (list.size() >= 1) {
            Object o =  list.get(0);
            return o.toString();
        } else {
            return null;
        }
    }
}