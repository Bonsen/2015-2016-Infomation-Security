package topic;

import java.util.List;
import java.util.Map;

public interface TopicService {
    public boolean update( List<Object> params);
    public Map<String, Object> queryByid( List<Object> params);
    public List<Map<String, Object>> queryall(List<Object> params);
}
