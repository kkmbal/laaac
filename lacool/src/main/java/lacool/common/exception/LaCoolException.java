package lacool.common.exception;

public class LaCoolException extends RuntimeException{
	public LaCoolException(){
		super();
	}
	public LaCoolException(String e){
		super(e);
	}
	public LaCoolException(Throwable t){
		super(t);
	}
}
