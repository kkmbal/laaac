package lacool.member.mapper;

import lacool.member.vo.UserVo;

import org.springframework.stereotype.Repository;

@Repository("userMapper")
public interface UserMapper {
	public UserVo getUser(UserVo userVo);
}
