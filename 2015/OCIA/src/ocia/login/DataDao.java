package ocia.login;

import java.util.List;
import java.util.Map;

import dbutil.JdbcUtils;


public class DataDao implements DataService {

    private JdbcUtils jdbcUtils =null;
    public DataDao() {
        // TODO Auto-generated constructor stub
        jdbcUtils = new JdbcUtils();
    }

    @Override
    public Map<String, Object> login(List<Object> params) {
        // TODO Auto-generated method stub
        boolean flag =false;
        Map<String, Object> map=null;

            String sql = "select serverPriKey,userPubKey from user where username=?";
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

}
