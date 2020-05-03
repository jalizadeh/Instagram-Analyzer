package com.jalizadeh.sbia.client.payload;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class DirectoryAjaxDetails {

	public String html;
	public String filters_html;
	public String active_filters_html;
	public boolean has_more;
}
