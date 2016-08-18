package login;

import java.util.List;
import java.util.Map;

import dbutil.JdbcUtils;

import login.LoginService;

public class LoginDao implements LoginService {

	private JdbcUtils jdbcUtils =null;
	public LoginDao() {
		// TODO Auto-generated constructor stub
		jdbcUtils = new JdbcUtils();
	}

	@Override
	public Map<String, Object> login(List<Object> params) {
		// TODO Auto-generated method stub
		boolean flag =false;
		Map<String, Object> map=null;
			String sql = "select * from user where username=? and pswd = ?";
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
