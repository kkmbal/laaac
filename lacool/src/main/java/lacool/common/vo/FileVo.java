package lacool.common.vo;

public class FileVo {
	private String name;
	private String path;
	
	public FileVo(String path, String name){
		this.path = path;
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
}
