package org.liao.persistence;

import org.liao.entity.TeacherCourseEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TeacherCourseService extends BaseService{

    public List<TeacherCourseEntity> findCourseById(String teacher_no) {

        String sql = "from TeacherCourseEntity where teacher_no=?";
        List<TeacherCourseEntity> list = getCurrentSession().createQuery(sql).setString(0, teacher_no).list();

        return list;
    }
}
