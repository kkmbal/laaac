package lacool.main.mapper;

import java.util.List;

import lacool.main.vo.MainVo;

import org.springframework.stereotype.Repository;

@Repository("mainMapper")
public interface MainMapper {
	
	public MainVo getRecentNotiInfo(MainVo mainVo);
	
	public List<MainVo> listHotIssueNotiInfo(MainVo mainVo);
	
	public List<MainVo> listNotiEvalOkInfo(MainVo mainVo);
	
	public List<MainVo> listNotiEvalOkOfCate(MainVo mainVo);
	
	public List<MainVo> listNotiEvalNgOfCate(MainVo mainVo);
}
