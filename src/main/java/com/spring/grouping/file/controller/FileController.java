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
import com.spring.grouping.work.domain.WorkVO;

@Controller
@RequestMapping(value = "/file")
public class FileController {
	@Autowired
	FileService service;
	
	   @RequestMapping(value = "/fileUploadView.do")
	    public String boardView(HttpSession session){
		   System.out.println("여기 불렸습니다.");
			   //그룹아이디 가지고 board가기
				return "/file/fileUploadView";
	    }
	   @RequestMapping(value = "/selectFileDetail.do")
		@ResponseBody
	    public FileVO selectFileInfo(String seq_file_number){	 
		   System.out.println("파일 정보보내줄게요");
		   	FileVO file = service.selectFileInfo(seq_file_number);
		   	System.out.println(file.getFile_name());
				return service.selectFileInfo(seq_file_number);
	    }
	   @RequestMapping(value = "/selectFileList.do")
		@ResponseBody
	    public List<FileVO> selectFileList(HttpSession session){	 
				return service.selectFileList((String)session.getAttribute("seq_grp_number"));	  
	    }
	   @RequestMapping(value="/fileUpload.do")
	   @ResponseBody
	   public int fileUpload(@RequestParam("report") MultipartFile report, FileVO file, HttpServletRequest request, HttpSession session){	
		   String root_path = request.getSession().getServletContext().getRealPath("/");
		   String attach_path = "resources/upload/"+(String)session.getAttribute("seq_grp_number")+"/";
		   String file_name = report.getOriginalFilename();
		   String folder_path = root_path + attach_path;
		   String file_path = folder_path+file_name;
		   file.setFile_name(file_name);
		   file.setFile_reg_user_name((String)session.getAttribute("user_name"));
		   System.out.println("file_content:"+file.getFile_content());
		   file.setSeq_grp_number(Integer.parseInt((String)session.getAttribute("seq_grp_number")));
		   file.setFile_path(file_path);
		   file.setFile_reg_user_id((String)session.getAttribute("user_id"));
		   service.insertFile(file);
		   try{
			new File(folder_path).mkdir();		
			   report.transferTo(new File(file_path));
		   }
		   catch(Exception e){
			   System.out.println(e.getMessage());
		   }   
		   return 1;
	   }
	   
	   @RequestMapping(value="/updateFileInfo.do")
		@ResponseBody
		public int updateFileInfo(FileVO file) throws Exception {		
			return service.updateFileInfo(file);
		}
	   @RequestMapping(value="/deleteFileInfo.do")
		@ResponseBody
		public int deleteFileInfo(FileVO file) throws Exception {		
			return service.deleteFileInfo(file.getSeq_file_number());
		}
	   
	   @RequestMapping(value="/fileDownload.do")
	   @ResponseBody
	   public void fileDownload(HttpServletResponse response, String seq_file_number)throws Exception{
		    FileVO file = service.selectFileInfo(seq_file_number);
		    byte fileByte[] = FileUtils.readFileToByteArray(new File(file.getFile_path()));	   
		    response.setContentType("application/octet-stream");
		    response.setContentLength(fileByte.length);
		    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(file.getFile_name(),"UTF-8")+"\";");
		    response.setHeader("Content-Transfer-Encoding", "binary");
		    
		    response.getOutputStream().write(fileByte);  
		    response.getOutputStream().flush();
		    response.getOutputStream().close();
	   }
}
