package lacool.customer.sc.impl;

import java.util.List;

import lacool.contents.vo.NotiApndFileVo;
import lacool.customer.mapper.CustomerMapper;
import lacool.customer.sc.CustomerService;
import lacool.customer.vo.CustomerVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerMapper customerMapper;
	
	@Override
	public List<CustomerVo> list(CustomerVo customerVo){
		return customerMapper.list(customerVo);
	}

	@Override
	public int listCnt(CustomerVo customerVo){
		return customerMapper.listCnt(customerVo);
	}

	@Override
	public CustomerVo insert(CustomerVo customerVo) {
		customerVo.setBoardId("BBS001");
		customerVo.setDelYn("N");
		
		if(StringUtils.isEmpty(customerVo.getNotiId())){
			String ref = customerMapper.getMaxRef(customerVo);
			customerVo.setRef(ref);
			customerMapper.insert(customerVo);
		}else{
			customerMapper.update(customerVo);
		}
		
		if(!StringUtils.isEmpty(customerVo.getApndFileNm())){
			NotiApndFileVo apndVo = new NotiApndFileVo();
			apndVo.setNotiId(customerVo.getNotiId()) ;
			apndVo.setApndFileSeq("") ;
			apndVo.setApndFileTp("") ;
			apndVo.setApndFileSz("0") ;
			apndVo.setApndFileOrgn(customerVo.getApndFileOrgn()) ;
			apndVo.setApndFileNm(customerVo.getApndFileNm()) ;					
			apndVo.setApndFilePath(customerVo.getApndFilePath()) ;					
			apndVo.setApndFilePrePath("") ;
			apndVo.setApndFilePreNm("") ;
			apndVo.setDelYn("N") ;
			apndVo.setRegId(customerVo.getUserId()) ;
			apndVo.setUpdId(customerVo.getUserId()) ;
			
			customerMapper.insertNotiApndFile(apndVo);
		}
		
		
		return customerVo;
	}

}
