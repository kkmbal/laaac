package lacool.personal.sc.impl;

import java.util.List;

import lacool.personal.mapper.PersonMapper;
import lacool.personal.sc.PersonService;
import lacool.personal.vo.PersonVo;
import lacool.personal.vo.PsnOpnVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("personService")
public class PersonServiceImpl implements PersonService  {

	@Autowired
	private PersonMapper personMapper;
	
	@Override
	public List<PersonVo> listUserContents(PersonVo personVo){
		return personMapper.listUserContents(personVo);
	}

	@Override
	public int listUserContentsCnt(PersonVo personVo) {
		return personMapper.listUserContentsCnt(personVo);
	}
	
	@Override
	public void insertOpn(PsnOpnVo psnOpnVo) {
		personMapper.insertOpn(psnOpnVo);
	}
	
	@Override
	public PsnOpnVo getPsnOpn(PsnOpnVo psnOpnVo) {
		return personMapper.getPsnOpn(psnOpnVo);
	}
	
	@Override
	public List<PsnOpnVo> listPsnOpn(PsnOpnVo psnOpnVo) {
		return personMapper.listPsnOpn(psnOpnVo);
	}
	
	@Override
	public void insertReplyOpn(PsnOpnVo psnOpnVo) {
		PsnOpnVo resultPsnOpnVo = personMapper.getPsnOpn(psnOpnVo);
		personMapper.updateForReplyPsnOpn(resultPsnOpnVo);
		
		psnOpnVo.setRef(resultPsnOpnVo.getRef());
		psnOpnVo.setRestep(resultPsnOpnVo.getRestep()+1);
		psnOpnVo.setRelevel(resultPsnOpnVo.getRelevel()+1);
		personMapper.insertOpnForReply(psnOpnVo);
	}
}
