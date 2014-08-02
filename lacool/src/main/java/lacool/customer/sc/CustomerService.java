package lacool.customer.sc;

import java.util.List;

import lacool.contents.vo.NotiApndFileVo;
import lacool.customer.vo.CustomerVo;

public interface CustomerService {

	List<CustomerVo> list(CustomerVo customerVo);

	int listCnt(CustomerVo customerVo);

	CustomerVo insert(CustomerVo customerVo);

	CustomerVo read(CustomerVo vo);

	CustomerVo readPrev(CustomerVo vo);

	CustomerVo readNext(CustomerVo vo);

	NotiApndFileVo getNotiApndFile(NotiApndFileVo vo);

	void delete(CustomerVo vo);

	void insertReply(CustomerVo customerVo);

}
