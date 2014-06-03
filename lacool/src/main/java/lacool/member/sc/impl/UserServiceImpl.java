package lacool.member.sc.impl;

import lacool.common.exception.LaCoolException;
import lacool.member.mapper.UserMapper;
import lacool.member.sc.UserService;
import lacool.member.vo.UserVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public UserVo getUser(UserVo userVo) throws LaCoolException{
		return userMapper.getUser(userVo);
	}
	
	@Override
	public void insertUser(UserVo userVo) throws LaCoolException{
		userVo.setRegId("system");
		userVo.setUpdId("system");
		userMapper.insertUser(userVo);
	}
	
	@Override
	public void updateUser(UserVo userVo) throws LaCoolException{
		userVo.setRegId("system");
		userVo.setUpdId("system");
		userMapper.updateUser(userVo);
	}

}
