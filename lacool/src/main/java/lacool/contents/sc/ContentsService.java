package lacool.contents.sc;

import java.util.List;

import lacool.contents.vo.NotiApndFileVo;
import lacool.contents.vo.NotiInfoVo;
import lacool.member.vo.UserVo;

public interface ContentsService {
	public NotiInfoVo insertNotiInfo(String data, UserVo userVo);

	public NotiInfoVo getContensDetail(NotiInfoVo vo);

	public List<NotiApndFileVo> getContentsFile(NotiInfoVo vo);
}
