package org.liao.persistence;

import org.liao.entity.AccountEntity;
import org.liao.entity.AccountRoleEntity;
import org.liao.entity.TeacherListEntity;
import org.springframework.stereotype.Repository;
import java.util.List;

/**
 * Created by liao on 17-8-3.
 */

@Repository
public class TeacherService extends BaseService {

    public TeacherListEntity findTeacher(String teacher_no) {

        String sql = "from TeacherListEntity where teacher_no=?";

        List<TeacherListEntity> list = getCurrentSession().createQuery(sql).setString(0, teacher_no).list();

        if (list.size() >= 1) {
            return list.get(0);
        } else {
            return null;
        }
    }

    /*将教务处的老师信息插入*/
    public void addTeacher(String teacher_no,
                          String password) {

        //account添加
        AccountEntity account = new AccountEntity();
        account.setUserName(teacher_no);
        account.setPassword(password);
        getCurrentSession().save(account);

        //角色列表添加
        AccountRoleEntity accountRole = new AccountRoleEntity();
        accountRole.setUserName(teacher_no);
        accountRole.setRole_id(2);
        getCurrentSession().save(accountRole);
    }

}

