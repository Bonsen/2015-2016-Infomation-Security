package people;

import java.util.List;
import java.util.Map;

public interface PeopleService {
    public List<Map<String, Object>> queryall(List<Object> params,String containerid);
}
