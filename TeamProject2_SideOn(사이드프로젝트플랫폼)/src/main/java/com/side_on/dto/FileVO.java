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
public class FileVO {
	
	private int fno;
    private int recruit_num;
    private String fileName;     //저장할 파일
    private String fileOriName;  //실제 파일
    private String fileUrl;



}
