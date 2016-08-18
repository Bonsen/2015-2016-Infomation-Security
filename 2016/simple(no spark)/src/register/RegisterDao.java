package register;

import java.util.ArrayList;
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
		Map<String, Object> map=null;
		List<Object> params1= new ArrayList<Object>();
		params1.add(params.get(0));
		utils.getConnection();
			String sql1 = "select * from user where username=?";
			try {
				System.out.print(params1);
				map = utils.findSimpleResult(sql1, params1);
				System.out.print(map);
				if(!map.isEmpty())return false;
				else System.out.print("success");
			} catch (Exception e) {
				// TODO: handle exception
			} finally {
			}

			String sql = "insert into user(username,pswd)values(?,?)";
			try {
				flag = utils.updateByPreparedStatement(sql, params);
			} catch (Exception e) {
				// TODO: handle exception
			} finally {
				utils.releaseConn();
			}
		return flag;
	}

}
