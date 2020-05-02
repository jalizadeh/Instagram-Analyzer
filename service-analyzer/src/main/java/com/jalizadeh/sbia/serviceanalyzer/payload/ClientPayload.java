package com.jalizadeh.sbia.serviceanalyzer.payload;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ClientPayload {
	private InstagramAnalyzedUserPayload analyzedUser;
	private List<InstagramLogPayload> logs;
}
