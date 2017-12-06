package org.liao.persistence;

import org.liao.entity.ExamRecordEntity;
import org.liao.util.ResponseModel;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Repository
public class ExamRecordService extends BaseService {

    public List<ExamRecordEntity> listExamRecord() {
        String sql = "from ExamRecordEntity";
        return getCurrentSession().createQuery(sql).list();
    }

    public Long getSum() {
        String sql = "select count(*) from ExamRecordEntity";
        return (Long) getCurrentSession().createQuery(sql).uniqueResult();
    }

    public ExamRecordEntity findById(Integer id) {
        String sql = "from ExamRecordEntity where id=?";

        ExamRecordEntity e = (ExamRecordEntity) getCurrentSession().createQuery(sql).setInteger(0, id).list().get(0);

        getCurrentSession().clear();
        return e;
    }

    public ResponseModel delete(ExamRecordEntity e) {

        ExamRecordEntity record = this.findById(e.getId());

        if (record == null) {
            return new ResponseModel(-1, "记录不存在！");
        }
        try {
            getCurrentSession().delete(e);
            return new ResponseModel(1, "删除成功！");
        } catch (Exception e0) {
            return new ResponseModel(-1, "删除失败！");
        }
    }

    public ResponseModel release(ExamRecordEntity e) {

        ExamRecordEntity record = this.findById(e.getId());

        if (record == null) {
            return new ResponseModel(-1, "记录不存在！");
        }
        try {
            String sql = "update ExamRecordEntity e set e.isStart=?,e.qrcodeUrl=? where e.id=?";
            getCurrentSession().createQuery(sql)
                    .setInteger(0, 1)
                    .setString(1, e.getQrcodeUrl())
                    .setInteger(2, record.getId()).executeUpdate();

            return new ResponseModel(1, "发布成功！");
        } catch (Exception e0) {
            return new ResponseModel(-1, "发布失败！");
        }
    }

    public ResponseModel cancel(ExamRecordEntity e) {

        ExamRecordEntity record = this.findById(e.getId());

        if (record == null) {
            return new ResponseModel(-1, "记录不存在！");
        }
        try {
            String sql = "update ExamRecordEntity e set e.isStart=? where e.id=?";
            getCurrentSession().createQuery(sql)
                    .setInteger(0, 0)
                    .setInteger(1, record.getId()).executeUpdate();

            return new ResponseModel(1, "撤销成功！");
        } catch (Exception e0) {
            return new ResponseModel(-1, "撤销失败！");
        }
    }
}
