package lacool.contents.sc.impl;

import java.util.List;

import lacool.contents.mapper.ContentsMapper;
import lacool.contents.sc.ContentsService;
import lacool.contents.vo.NotiApndFileVo;
import lacool.contents.vo.NotiInfoVo;
import lacool.member.vo.UserVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("contentsService")
public class ContentsServiceImpl implements ContentsService {

	@Autowired
	private ContentsMapper contentsMapper;
	
	@Override
	public NotiInfoVo insertNotiInfo(String data, UserVo userVo) {
		JSONObject notiObject = JSONObject.fromObject(data);
		
		NotiInfoVo notiInfoVo = new NotiInfoVo();
		notiInfoVo.setBoardId(notiObject.getString("boardId"));
		notiInfoVo.setNotiId(notiObject.getString("notiId"));
		notiInfoVo.setCateId(notiObject.getString("cateId"));
		notiInfoVo.setUpNotiId(notiObject.getString("upNotiId"));
		notiInfoVo.setNotiKind(notiObject.getString("notiKind"));
		notiInfoVo.setNotiTitle(notiObject.getString("notiTitle"));
		notiInfoVo.setNotiConts(notiObject.getString("notiConts"));
		notiInfoVo.setNotiUrl(notiObject.getString("notiUrl"));
		notiInfoVo.setNotiOpnDiv(notiObject.getString("notiOpnDiv"));
		notiInfoVo.setFbRegYn(notiObject.getString("fbRegYn"));
		notiInfoVo.setDelYn(notiObject.getString("delYn"));
		notiInfoVo.setStatCd(notiObject.getString("statCd"));
		notiInfoVo.setUserId(notiObject.getString("userId"));
		notiInfoVo.setUserNm(notiObject.getString("userNm"));
		notiInfoVo.setNotiReadCnt(notiObject.getString("notiReadCnt"));
		notiInfoVo.setNotiOkCnt(notiObject.getString("notiOkCnt"));
		notiInfoVo.setNotiNgCnt(notiObject.getString("notiNgCnt"));
		notiInfoVo.setWriteIp(notiObject.getString("writeIp"));
		notiInfoVo.setNotiBgnDttm(notiObject.getString("notiBgnDttm"));
		notiInfoVo.setNotiEndDttm(notiObject.getString("notiEndDttm"));
		notiInfoVo.setScrapCnt(notiObject.getString("scrapCnt"));
		notiInfoVo.setNotiOpnCnt(notiObject.getString("notiOpnCnt"));
		notiInfoVo.setRegId(userVo.getUserId());
		notiInfoVo.setUpdId(userVo.getUserId());
		notiInfoVo.setRef(notiObject.getString("ref"));
		notiInfoVo.setRestep(notiObject.getString("restep"));
		notiInfoVo.setRelevel(notiObject.getString("relevel"));
		
		contentsMapper.insertNotiInfo(notiInfoVo);
		
		JSONArray jsonArr = notiObject.getJSONArray("notiApndFileList");
		for(int i=0; i < jsonArr.size(); i++){
			JSONObject obj = jsonArr.getJSONObject(i);
			
			NotiApndFileVo apndVo = new NotiApndFileVo();
			apndVo.setNotiId(notiInfoVo.getNotiId()) ;
			apndVo.setApndFileSeq(obj.getString("apndFileSeq")) ;
			apndVo.setApndFileTp(obj.getString("apndFileTp")) ;
			apndVo.setApndFileSz(obj.getString("apndFileSz")) ;
			apndVo.setApndFileOrgn(obj.getString("apndFileOrgn")) ;
			apndVo.setApndFileNm(obj.getString("apndFileNm")) ;					
			apndVo.setApndFilePath(obj.getString("apndFilePath")) ;					
			apndVo.setApndFilePrePath(obj.getString("apndFilePrePath")) ;
			apndVo.setApndFilePreNm(obj.getString("apndFilePreNm")) ;
			apndVo.setDelYn(obj.getString("delYn")) ;
			apndVo.setRegId(userVo.getUserId()) ;
			apndVo.setUpdId(userVo.getUserId()) ;
			
			contentsMapper.insertNotiApndFile(apndVo);
		}
		
		return notiInfoVo;
	}

	@Override
	public NotiInfoVo getContensDetail(NotiInfoVo vo) {
		return contentsMapper.getContensDetail(vo);
	}

	@Override
	public List<NotiApndFileVo> getContentsFile(NotiInfoVo vo) {
		return contentsMapper.getContentsFile(vo);
	}

}
