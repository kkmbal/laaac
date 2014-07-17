package lacool.contents.mapper;

import java.util.List;

import lacool.contents.vo.NotiApndFileVo;
import lacool.contents.vo.NotiInfoVo;

import org.springframework.stereotype.Repository;

@Repository("contentsMapper")
public interface ContentsMapper {
	
	public void insertNotiInfo(NotiInfoVo notiInfoVo);
	
	public void insertNotiApndFile(NotiApndFileVo notiApndFileVo);

	public NotiInfoVo getContensDetail(NotiInfoVo vo);

	public List<NotiApndFileVo> getContentsFile(NotiInfoVo vo);
}
