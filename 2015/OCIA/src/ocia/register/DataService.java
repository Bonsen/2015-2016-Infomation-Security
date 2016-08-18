package ocia.register;

import java.util.List;
import java.util.Map;

//服务层 interfacei接口
public interface DataService {
    //完成用户注册
    public Map<String,Object> DataUser(int i,List<Object> params);
}
