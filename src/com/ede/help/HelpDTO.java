package com.ede.help;

import com.ede.board.BoardDTO;

public class HelpDTO extends BoardDTO {
	private int ref;
	private int step;
	private int depth;
	private String id;


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}	

	
}
