package lacool.main.sc.impl;

import java.util.List;

import lacool.main.mapper.MainMapper;
import lacool.main.sc.MainService;
import lacool.main.vo.MainVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("mainService")
public class MainServiceImpl implements MainService {

	@Autowired
	private MainMapper mainMapper;
	
	public MainVo getRecentNotiInfo(MainVo mainVo){
		return mainMapper.getRecentNotiInfo(mainVo);
	}
	
	public List<MainVo> listHotIssueNotiInfo(MainVo mainVo){
		return mainMapper.listHotIssueNotiInfo(mainVo);
	}
	
	public List<MainVo> listNotiEvalOkInfo(MainVo mainVo){
		return mainMapper.listNotiEvalOkInfo(mainVo);
	}
	
	public List<MainVo> listNotiEvalOkOfCate(MainVo mainVo){
		return mainMapper.listNotiEvalOkOfCate(mainVo);
	}
	
	public List<MainVo> listNotiEvalNgOfCate(MainVo mainVo){
		return mainMapper.listNotiEvalNgOfCate(mainVo);
	}
	
}
