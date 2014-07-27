package lacool.customer.sc;

import java.util.List;

import lacool.customer.vo.CustomerVo;

public interface CustomerService {

	List<CustomerVo> list(CustomerVo customerVo);

	int listCnt(CustomerVo customerVo);

}
