package lacool.personal.sc.impl;

import java.util.List;

import lacool.contents.vo.NotiInfoVo;
import lacool.member.vo.UserVo;
import lacool.personal.mapper.PersonMapper;
import lacool.personal.sc.PersonService;
import lacool.personal.vo.PersonVo;
import lacool.personal.vo.PsnOpnVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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

	@Override
	public List<PersonVo> listScrap(PersonVo personVo) {
		return personMapper.listScrap(personVo);
	}

	@Override
	public int listScrapCnt(PersonVo personVo) {
		return personMapper.listScrapCnt(personVo);
	}

	@Override
	public void deleteScrap(String data, UserVo userVo) {
		JSONObject notiObject = JSONObject.fromObject(data);
		
		JSONArray jsonArr = notiObject.getJSONArray("notiIdList");
		for(int i=0; i < jsonArr.size(); i++){
			JSONObject obj = jsonArr.getJSONObject(i);
			PersonVo personVo = new PersonVo();
			personVo.setUserId(userVo.getUserId());
			personVo.setNotiId(obj.getString("notiId"));
			personMapper.deleteScrap(personVo);
		}
		
	}
	
	@Override
	public List<PersonVo> listTmpSave(PersonVo personVo){
		return personMapper.listTmpSave(personVo);
	}

	@Override
	public int listTmpSaveCnt(PersonVo personVo){
		return personMapper.listTmpSaveCnt(personVo);
	}
	
	@Override
	public void updateToSave(PersonVo personVo){
		 personMapper.updateToSave(personVo);
	}
	
	@Override
	public void deleteTmpSave(PersonVo personVo){
		 personMapper.deleteTmpSave(personVo);
	}
}
