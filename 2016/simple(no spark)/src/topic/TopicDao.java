package topic;

import dbutil.JdbcUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class TopicDao implements TopicService{

    private JdbcUtils jdbcUtils =null;
    public TopicDao() {
        // TODO Auto-generated constructor stub
        jdbcUtils = new JdbcUtils();
    }

    @Override
    public boolean update(List<Object> params) {

        boolean flag =false;
        String sql = "update user set dianzan=?,pinglun=?,qianzai=?,mingan=? where containerid=?";
        try {
            jdbcUtils.getConnection();
            flag = jdbcUtils.updateByPreparedStatement(sql, params);
            //flag = !map.isEmpty() ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
            // TODO: handle exception
        } finally {
            jdbcUtils.releaseConn();
        }
        return flag;
    }

    @Override
    public Map<String, Object> queryByid(List<Object> params) {

        Map<String, Object> map=null;
        String sql = "select * from user where containerid=?";
        try {
            jdbcUtils.getConnection();
            map = jdbcUtils.findSimpleResult(sql, params);
            //flag = !map.isEmpty() ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
            // TODO: handle exception
        } finally {
            jdbcUtils.releaseConn();
        }
        return map;
    }

    @Override
    public List<Map<String, Object>> queryall(List<Object> params)  {

        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        String sql = "select * from topic";
        try {
            jdbcUtils.getConnection();
            list = jdbcUtils.findMoreResult(sql, params);
            //flag = !map.isEmpty() ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
            // TODO: handle exception
        } finally {
            jdbcUtils.releaseConn();
        }
        return list;
    }
}
