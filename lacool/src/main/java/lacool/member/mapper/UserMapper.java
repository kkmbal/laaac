package lacool.member.mapper;

import lacool.member.vo.UserVo;

import org.springframework.stereotype.Repository;

@Repository("userMapper")
public interface UserMapper {
	public UserVo getUser(UserVo userVo);
	public void insertUser(UserVo userVo);
	public void updateUser(UserVo userVo);
	public void userDelete(UserVo userVo);
}
