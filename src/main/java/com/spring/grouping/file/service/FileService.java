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

	/**
	 * 파일게시글 생성
	 * @return
	 */
	public int insertFile(FileVO file) {
		// TODO Auto-generated method stub
		return fileMapper.insertFile(file);
	}

	/**
	 * 파일게시글 상세
	 * @return FileVO
	 */
	public FileVO selectFileInfo(String seq_file_number) {
		// TODO Auto-generated method stub
		return fileMapper.selectFileInfo(seq_file_number);
	}
	
	/**
	 * 파일 게시글 리스트 조회
	 * @return
	 */
	public List<FileVO> selectFileList(String seq_grp_number){
		return fileMapper.selectFileList(seq_grp_number);
	}

	/**
	 * 파일 게시글 수정
	 * @return
	 */
	public int updateFileInfo(FileVO file) {
		// TODO Auto-generated method stub
		return fileMapper.updateFileInfo(file);
	}

	/**
	 * 파일 게시글 삭제
	 * @return
	 */
	public int deleteFileInfo(int seq_file_number) {
		// TODO Auto-generated method stub
		return fileMapper.deleteFileInfo(seq_file_number);
	}

}
