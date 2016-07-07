package com.webside.enums;

public enum ExportType {

	EXCEL("excel"),
	CSV("csv"),
	PDF("pdf"),
	TXT("txt");
	
	private String fileType;
	
	private ExportType(String fileType)
	{
		this.fileType = fileType;
	}
	
	public String getFileType()
	{
		return fileType;
	}
	
}
