package lacool.member.sc;

import lacool.member.vo.UserVo;

public interface UserService {
	public UserVo getUser(UserVo userVo);
	public UserVo registerUser(UserVo userVo);
}
