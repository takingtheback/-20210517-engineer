package com.side_on.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
public class Part {

	private int Front;
	private int Back;
	private int aos;
	private int ios;
	private int server;
	private int uxui;
	private int plan;
	private int pm;
}
