package lacool.customer.sc.impl;

import java.util.List;

import lacool.customer.mapper.CustomerMapper;
import lacool.customer.sc.CustomerService;
import lacool.customer.vo.CustomerVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerMapper customerMapper;
	
	public List<CustomerVo> list(CustomerVo customerVo){
		return customerMapper.list(customerVo);
	}

	public int listCnt(CustomerVo customerVo){
		return customerMapper.listCnt(customerVo);
	}

}
