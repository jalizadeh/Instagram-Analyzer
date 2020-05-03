package com.jalizadeh.sbia.client.payload;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ClientPayload {
	private InstagramUserPayload analyzedUser;
	private List<InstagramLogPayload> logs;
}
