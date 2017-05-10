package com.spring.grouping.file.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.grouping.file.domain.FileVO;
import com.spring.grouping.file.service.FileService;

/**
 * 파일 컨트롤러 : 파일 업로드 화면, 파일 리스트 Ajax, 파일 상세 Ajax, 파일 업로드 Ajax, 파일 수정 Ajax, 파일 삭제 Ajax, 파일 다운로드 Ajax
 */
@Controller
@RequestMapping(value = "/file")
public class FileController {
	@Autowired
	FileService service;

	/**
	 * 파일 업로드 화면
	 * @return
	 */
	@RequestMapping(value = "/fileUploadView.do")
	public String fileUploadView(HttpSession session) {
		return "/file/fileUploadView";
	}

	/**
	 * 파일 리스트 Ajax
	 * @return List<FileVO>
	 */
	@RequestMapping(value = "/selectFileList.do")
	@ResponseBody
	public List<FileVO> selectFileList(HttpSession session) {
		return service.selectFileList((String) session.getAttribute("seq_grp_number"));
	}
	
	/**
	 * 파일 상세 Ajax
	 * @return FileVO
	 */
	@RequestMapping(value = "/selectFileDetail.do")
	@ResponseBody
	public FileVO selectFileInfo(String seq_file_number) {
		return service.selectFileInfo(seq_file_number);
	}

	/**
	 * 파일 업로드 Ajax
	 */
	@RequestMapping(value = "/fileUpload.do")
	@ResponseBody
	public int fileUpload(@RequestParam("report") MultipartFile report, FileVO file, HttpServletRequest request, 
			HttpSession session) {
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources/upload/" + (String) session.getAttribute("seq_grp_number") + "/";
		String file_name = report.getOriginalFilename();
		String folder_path = root_path + attach_path;
		String file_path = folder_path + file_name;
		file.setFile_name(file_name);
		file.setFile_reg_user_name((String) session.getAttribute("user_name"));
		file.setSeq_grp_number(Integer.parseInt((String) session.getAttribute("seq_grp_number")));
		file.setFile_path(file_path);
		file.setFile_reg_user_id((String) session.getAttribute("user_id"));
		service.insertFile(file);
		try {
			new File(folder_path).mkdir();
			report.transferTo(new File(file_path));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return 1;
	}

	/**
	 * 파일 수정 Ajax
	 */
	@RequestMapping(value = "/updateFileInfo.do")
	@ResponseBody
	public int updateFileInfo(FileVO file){
		return service.updateFileInfo(file);
	}

	/**
	 * 파일 삭제  Ajax
	 */
	@RequestMapping(value = "/deleteFileInfo.do")
	@ResponseBody
	public int deleteFileInfo(FileVO file) {
		return service.deleteFileInfo(file.getSeq_file_number());
	}

	/**
	 * 파일 다운로드  Ajax
	 */
	@RequestMapping(value = "/fileDownload.do")
	@ResponseBody
	public void fileDownload(HttpServletResponse response, String seq_file_number) throws Exception {
		FileVO file = service.selectFileInfo(seq_file_number);
		byte fileByte[] = FileUtils.readFileToByteArray(new File(file.getFile_path()));
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(file.getFile_name(), "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
}
