package lacool.personal.sc;

import java.util.List;

import lacool.member.vo.UserVo;
import lacool.personal.vo.PersonVo;
import lacool.personal.vo.PsnOpnVo;

public interface PersonService {

	public List<PersonVo> listUserContents(PersonVo personVo);
	
	public int listUserContentsCnt(PersonVo personVo);
	
	public void insertOpn(PsnOpnVo psnOpnVo);

	public PsnOpnVo getPsnOpn(PsnOpnVo psnOpnVo);
	
	public List<PsnOpnVo> listPsnOpn(PsnOpnVo psnOpnVo);

	public void insertReplyOpn(PsnOpnVo psnOpnVo);

	public List<PersonVo> listScrap(PersonVo personVo);

	public int listScrapCnt(PersonVo personVo);

	public void deleteScrap(String data, UserVo userVo);
}
