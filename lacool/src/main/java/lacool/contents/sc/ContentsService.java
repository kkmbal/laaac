package lacool.contents.sc;

import java.util.List;

import lacool.contents.vo.NotiApndFileVo;
import lacool.contents.vo.NotiEvalInfoVo;
import lacool.contents.vo.NotiInfoVo;
import lacool.contents.vo.NotiOpnVo;
import lacool.contents.vo.UserScrapInfoVo;
import lacool.member.vo.UserVo;

public interface ContentsService {
	public NotiInfoVo insertNotiInfo(String data, UserVo userVo);

	public NotiInfoVo getContensDetail(NotiInfoVo vo);

	public List<NotiApndFileVo> getContentsFile(NotiInfoVo vo);

	public UserScrapInfoVo insertScrap(String data, UserVo sessionUserVo);
	
	public int getScrapCnt(UserScrapInfoVo scrapInfoVo);
	
	public List<UserScrapInfoVo> getScrapInfo(UserScrapInfoVo scrapInfoVo);

	public List<NotiEvalInfoVo> getNotiEvalInfo(NotiEvalInfoVo notiEvalInfoVo);

	public void insertNotiEval(NotiEvalInfoVo notiEvalInfoVo);
	
	public List<NotiApndFileVo> getNotiEvalOfCate(NotiInfoVo vo) ;

	public NotiOpnVo getNotiOpn(NotiOpnVo notiOpnVo);
	
	public List<NotiOpnVo> listNotiOpn(NotiOpnVo notiOpnVo) ;
	
	public void insertOpn(NotiOpnVo notiOpnVo);
	
	public void insertReplyOpn(NotiOpnVo notiOpnVo);
	
	public List<NotiInfoVo> listUserHistory(NotiInfoVo vo);
	
	public int listUserHistoryCnt(NotiInfoVo vo);
	
	public List<NotiInfoVo> listSearch(NotiInfoVo vo);
	
	public int listSearchCnt(NotiInfoVo vo);
}
