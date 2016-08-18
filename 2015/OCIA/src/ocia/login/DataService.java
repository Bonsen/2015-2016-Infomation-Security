package ocia.login;

import java.util.List;
import java.util.Map;

/**
 * Created by bonsen on 15/7/20.
 */
public interface DataService {
    public Map<String, Object> login(List<Object> params);
}
