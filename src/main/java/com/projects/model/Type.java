package com.projects.model;

/**
 * 
* @ClassName: Type  
* @Description: 书本类型枚举类
* @author mardoner-QQ:2500119268 
* @date Sep 27, 2018  
*
 */
public enum Type {
	LITERATURE_HISTORY("文学历史"),MILITARY_GEOGRAPHY("军事地理"),SCIENCE_TECHNOLOGY("科学技术"),
	HUMANITY_SOCIOLOGY("人文社科"),READ_LIFE("阅享生活"),ALTHOUGH_FINALCIAL("经管理财");
	
	private String desc;
	
	private Type(String desc){
		this.desc = desc;
	}
	public String getDesc() {
		return desc;
	}
}
