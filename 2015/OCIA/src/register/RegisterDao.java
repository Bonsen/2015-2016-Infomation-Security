package register;

import java.util.List;
import java.util.Map;
import dbutil.JdbcUtils;

import register.RegisterService;
//??????? class?????service???
public class RegisterDao implements RegisterService {
	
	private JdbcUtils utils = null;
	
	public RegisterDao() {
		// TODO Auto-generated constructor stub
		utils = new JdbcUtils();
	}

	@Override
	//??????????dao???д
	public boolean registerUser(List<Object> params) {
		// TODO Auto-generated method stub
		boolean flag = false;
		utils.getConnection();

			String sql = "insert into user(username,passwd,email,phone,mopen,openfea,serverPriKey)values(?,?,?,?,?,?,?)";
			try {
				flag = utils.updateByPreparedStatement(sql, params);
			} catch (Exception e) {
				// TODO: handle exception
			} finally {
				//???????????
				utils.releaseConn();
			}
		return flag;
	}

}
