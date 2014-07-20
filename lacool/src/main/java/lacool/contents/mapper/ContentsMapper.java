package lacool.contents.mapper;

import java.util.List;

import lacool.contents.vo.NotiApndFileVo;
import lacool.contents.vo.NotiEvalInfoVo;
import lacool.contents.vo.NotiInfoVo;
import lacool.contents.vo.NotiOpnVo;
import lacool.contents.vo.UserScrapInfoVo;

import org.springframework.stereotype.Repository;

@Repository("contentsMapper")
public interface ContentsMapper {
	
	public void insertNotiInfo(NotiInfoVo notiInfoVo);
	
	public void insertNotiApndFile(NotiApndFileVo notiApndFileVo);

	public NotiInfoVo getContensDetail(NotiInfoVo vo);

	public List<NotiApndFileVo> getContentsFile(NotiInfoVo vo);

	public void insertScrap(UserScrapInfoVo scrapInfoVo);
	
	public List<UserScrapInfoVo> getScrapInfo(UserScrapInfoVo scrapInfoVo);
	
	public int getScrapCnt(UserScrapInfoVo scrapInfoVo);

	public List<NotiEvalInfoVo> getNotiEvalInfo(NotiEvalInfoVo notiEvalInfoVo);

	public void insertNotiEval(NotiEvalInfoVo notiEvalInfoVo);
	
	public List<NotiApndFileVo> getNotiEvalOfCate(NotiInfoVo vo);

	public void insertOpn(NotiOpnVo notiOpnVo);

	public NotiOpnVo getNotiOpn(NotiOpnVo notiOpnVo);
	
	public List<NotiOpnVo> listNotiOpn(NotiOpnVo notiOpnVo);

	public void updateForReplyNotiOpn(NotiOpnVo notiOpnVo);

	public void insertOpnForReply(NotiOpnVo resultNotiOpnVo);
}
