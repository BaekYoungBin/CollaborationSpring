package com.spring.grouping.file.mapper;

import java.util.List;
import java.util.Map;

import com.spring.grouping.board.domain.BoardVO;
import com.spring.grouping.file.domain.FileVO;

public interface FileMapper {

	int insertFile(FileVO file);

	FileVO selectFileInfo(String seq_file_number);
	List<FileVO> selectFileList(String seq_grp_number);

	int updateFileInfo(FileVO file);

	int deleteFileInfo(int seq_file_number);
}
