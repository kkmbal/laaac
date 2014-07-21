package lacool.main.sc;

import java.util.List;

import lacool.main.vo.MainVo;

public interface MainService {
	
	public MainVo getRecentNotiInfo(MainVo mainVo);
	
	public List<MainVo> listHotIssueNotiInfo(MainVo mainVo);
	
	public List<MainVo> listNotiEvalOkInfo(MainVo mainVo);
	
	public List<MainVo> listNotiEvalOkOfCate(MainVo mainVo);
	
	public List<MainVo> listNotiEvalNgOfCate(MainVo mainVo);
}
