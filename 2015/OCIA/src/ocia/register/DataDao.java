package ocia.register;

import java.util.List;
import java.util.Map;

import dbutil.JdbcUtils;

import register.RegisterService;
//??????? class?????service???
public class DataDao implements DataService {

    private JdbcUtils utils = null;

    public DataDao() {
        // TODO Auto-generated constructor stub
        utils = new JdbcUtils();
    }

    @Override
    //??????????dao???д
    public Map<String,Object> DataUser(int i,List<Object> params) {
        // TODO Auto-generated method stub
        Map<String, Object> map = null;
        utils.getConnection();
        if(i==1){
            String sql = "select serverPriKey from user where username=?";
            try {
                map = utils.findSimpleResult(sql, params);
            } catch (Exception e) {
                // TODO: handle exception
            } finally{
                //???????????
                utils.releaseConn();
            }
        }else if (i==2){

            String sql = "update user set userPubKey=?,keyHandle=?,btAddr=? where username=?";

            try {
                utils.updateByPreparedStatement(sql,params);
            } catch (Exception e) {
                // TODO: handle exception
            } finally{
                //???????????
                utils.releaseConn();
            }
        }

        return map;
    }

}
