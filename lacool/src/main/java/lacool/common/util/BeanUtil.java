package lacool.common.util;

import org.codehaus.jackson.map.ObjectMapper;

public class BeanUtil {
	
	public static <T> T getData(String data, Class<? extends T> targetType) throws Exception{
		ObjectMapper mapper = new ObjectMapper();
		return mapper.readValue(data, targetType);
	}
	
}
