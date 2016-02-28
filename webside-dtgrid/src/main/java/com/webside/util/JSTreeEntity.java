package com.webside.util;

import java.io.Serializable;

/**
 * 
 * <p>Description: JSTree 模型</p>
 * <p>Company: 静之殇工作室</p>
 * @author wjggwm
 * @date 2016年1月20日 下午10:53:47
 */
public class JSTreeEntity implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	
	private String parent;
	
	private String text;
	
	private String icon;
	
	private State state;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	
	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}
	
	public String getIcon() {
		return icon;
	}
	
	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
	}

	public class State
	{
		private boolean opened;
		
		private boolean selected;
		
		private boolean disabled;

		public boolean isOpened() {
			return opened;
		}

		public void setOpened(boolean opened) {
			this.opened = opened;
		}

		public boolean isSelected() {
			return selected;
		}

		public void setSelected(boolean selected) {
			this.selected = selected;
		}

		public boolean isDisabled() {
			return disabled;
		}

		public void setDisabled(boolean disabled) {
			this.disabled = disabled;
		}

		@Override
		public String toString() {
			return "State [opened=" + opened + ", selected=" + selected
					+ ", disabled=" + disabled + "]";
		}
		
		
	}

	@Override
	public String toString() {
		return "JSTree [id=" + id + ", parent=" + parent + ", text=" + text
				+ ", icon=" + icon + ", state=" + state + "]";
	}
	
	
}
