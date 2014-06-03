package lacool.member.sc;

import lacool.member.vo.UserVo;

public interface UserService {
	public UserVo getUser(UserVo userVo);
	public void insertUser(UserVo userVo);
	public void updateUser(UserVo userVo);
}
