package com.jalizadeh.sbia.client.payload;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class DirectoryAjaxPayload {
	
	private String message;
	private String status;
	private DirectoryAjaxDetails details;
	
}
