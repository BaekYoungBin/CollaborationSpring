package com.spring.grouping.file.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.grouping.file.domain.FileVO;
import com.spring.grouping.file.mapper.FileMapper;



@Service
public class FileService {
	@Autowired
	private FileMapper fileMapper;

	public int insertFile(FileVO file) {
		// TODO Auto-generated method stub
		return fileMapper.insertFile(file);
	}

	public FileVO selectFileInfo(String seq_file_number) {
		// TODO Auto-generated method stub
		return fileMapper.selectFileInfo(seq_file_number);
	}
	public List<FileVO> selectFileList(String seq_grp_number){
		return fileMapper.selectFileList(seq_grp_number);
	}

	public int updateFileInfo(FileVO file) {
		// TODO Auto-generated method stub
		return fileMapper.updateFileInfo(file);
	}

	public int deleteFileInfo(int seq_file_number) {
		// TODO Auto-generated method stub
		return fileMapper.deleteFileInfo(seq_file_number);
	}

}
