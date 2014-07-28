package lacool.customer.mapper;

import java.util.List;

import lacool.contents.vo.NotiApndFileVo;
import lacool.customer.vo.CustomerVo;

import org.springframework.stereotype.Repository;

@Repository("customerMapper")
public interface CustomerMapper {
	List<CustomerVo> list(CustomerVo customerVo);

	int listCnt(CustomerVo customerVo);
	
	String getMaxRef(CustomerVo customerVo);

	void insert(CustomerVo customerVo);

	void update(CustomerVo customerVo);

	void insertNotiApndFile(NotiApndFileVo apndVo);
}
