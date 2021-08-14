 package com.side_on.dto;

 import lombok.AllArgsConstructor;
 import lombok.Builder;
 import lombok.Data;
 import lombok.NoArgsConstructor;

 @Data
 @Builder
 @NoArgsConstructor
 @AllArgsConstructor
 public class Find {
 	
 	
 	private String find_date;
 	
 	private String find_title;
 	
 	private String find_writer;

 	private String find_address;
 	
 	private String find_position;
 	
 	private String find_imgpath;
 	
 	private String find_content;
 	
 }