package lacool.personal.mapper;

import java.util.List;

import lacool.member.vo.UserVo;
import lacool.personal.vo.PersonVo;
import lacool.personal.vo.PsnOpnVo;

import org.springframework.stereotype.Repository;

@Repository("personMapper")
public interface PersonMapper {
	
	public List<PersonVo> listUserContents(PersonVo personVo);
	
	public int listUserContentsCnt(PersonVo personVo);
	
	public void insertOpn(PsnOpnVo psnOpnVo);

	public PsnOpnVo getPsnOpn(PsnOpnVo psnOpnVo);
	
	public List<PsnOpnVo> listPsnOpn(PsnOpnVo psnOpnVo);

	public void updateForReplyPsnOpn(PsnOpnVo psnOpnVo);

	public void insertOpnForReply(PsnOpnVo psnOpnVo);

	public List<PersonVo> listScrap(PersonVo personVo);

	public int listScrapCnt(PersonVo personVo);
	
	public void deleteScrap(PersonVo personVo);
}
