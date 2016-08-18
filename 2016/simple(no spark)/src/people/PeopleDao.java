package people;

import dbutil.JdbcUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class PeopleDao implements PeopleService {

    private JdbcUtils jdbcUtils =null;
    public PeopleDao() {
        // TODO Auto-generated constructor stub
        jdbcUtils = new JdbcUtils();
    }

    @Override
    public List<Map<String, Object>> queryall(List<Object> params,String containerid)  {

        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        params.add(containerid);
        String sql = "select * from qianzai where containerid=?";
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
