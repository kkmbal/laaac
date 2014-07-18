package lacool.contents.sc;

import java.util.List;

import lacool.contents.vo.NotiApndFileVo;
import lacool.contents.vo.NotiEvalInfoVo;
import lacool.contents.vo.NotiInfoVo;
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
}
