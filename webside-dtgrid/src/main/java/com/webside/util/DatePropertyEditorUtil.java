package com.webside.util;

import java.beans.PropertyEditorSupport;

import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;

public class DatePropertyEditorUtil extends PropertyEditorSupport{

	@Override
	public void setAsText(String arg0) throws IllegalArgumentException {
		LocalDate localDate = LocalDate.parse(arg0,DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss"));
		this.setValue(localDate.toDate());
	}
	
}
