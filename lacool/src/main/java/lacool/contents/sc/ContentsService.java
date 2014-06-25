package lacool.contents.sc;

import lacool.contents.vo.NotiInfoVo;
import lacool.member.vo.UserVo;

public interface ContentsService {
	public NotiInfoVo insertNotiInfo(String data, UserVo userVo);
}
