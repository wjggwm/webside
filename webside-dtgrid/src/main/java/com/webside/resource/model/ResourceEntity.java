package com.webside.resource.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.webside.base.basemodel.BaseEntity;

public class ResourceEntity extends BaseEntity{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/*
	 * 父节点ID
	 */
	private Integer parentId;
	/*
	 * 名称
	 */
	private String name;
	/*
	 * key资源标识
	 */
	private String sourceKey;
	/*
	 * 类型：菜单、按钮
	 */
	private Integer type;
	/*
	 * 菜单URL
	 */
	private String sourceUrl;
	/*
	 * 层级,即菜单的展开层级
	 */
	private Integer level;
	/*
	 * 图标,即菜单的图标
	 */
	private String icon;
	/*
	 * 是否隐藏
	 */
	private Integer isHide;
	/*
	 * 描述
	 */
	private String description;
	/*
	 * 创建时间
	 */
	private Date createTime;
	/*
	 * 更新时间
	 */
	private Date updateTime;
	/*
	 * 是否展开
	 */
	private boolean isExpanded;
	/*
	 * 是否叶子节点
	 */
	private boolean isLeaf;
	/*
	 * 是否加载完成
	 */
	private boolean loaded = true;
	/*
	 * 父节点名称
	 */
	private String parentName;
	/*
	 * 是否被选中
	 */
	private boolean selected;
	
	private List<ResourceEntity> children = new ArrayList<ResourceEntity>();

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSourceKey() {
		return sourceKey;
	}

	public void setSourceKey(String sourceKey) {
		this.sourceKey = sourceKey;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getSourceUrl() {
		return sourceUrl;
	}

	public void setSourceUrl(String sourceUrl) {
		this.sourceUrl = sourceUrl;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Integer getIsHide() {
		return isHide;
	}

	public void setIsHide(Integer isHide) {
		this.isHide = isHide;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}


	public boolean getIsExpanded() {
		return isExpanded;
	}

	public void setIsExpanded(boolean isExpanded) {
		this.isExpanded = isExpanded;
	}

	public boolean getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(boolean isLeaf) {
		this.isLeaf = isLeaf;
	}
	
	public boolean getLoaded() {
		return loaded;
	}

	public void setLoaded(boolean loaded) {
		this.loaded = loaded;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	
	public List<ResourceEntity> getChildren() {
		return children;
	}

	public void setChildren(List<ResourceEntity> children) {
		this.children = children;
	}
	
	public boolean getSelected() {
		return selected;
	}

	public void setSelected(boolean selected) {
		this.selected = selected;
	}

	@Override
	public String toString() {
		return "ResourceEntity [id=" + id + ", parentId=" + parentId + ", name=" + name
				+ ", sourceKey=" + sourceKey + ", type=" + type
				+ ", sourceUrl=" + sourceUrl + ", level=" + level + ", icon="
				+ icon + ", isHide=" + isHide + ", description=" + description
				+ ", createTime=" + createTime + ", updateTime=" + updateTime
				+ ", isExpanded=" + isExpanded + ", isLeaf=" + isLeaf
				+ ", parentName=" + parentName + "]";
	}


	
}
