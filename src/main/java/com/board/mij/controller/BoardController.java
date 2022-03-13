package com.board.mij.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.mysql.cj.xdevapi.JsonArray;
import com.mysql.cj.xdevapi.JsonValue;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.board.mij.domain.BoardVO;
import com.board.mij.domain.FileVO;
import com.board.mij.service.BoardService;
import com.board.mij.service.FileService;
import com.board.mij.utility.CommonUtility;


import java.util.*;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;

@Controller
public class BoardController {

	@Resource(name = "com.board.mij.service.BoardService")
	BoardService mBoardService;
	
	@Resource(name = "com.board.mij.service.FileService")
	FileService mFileService;
	
	// application.properties에서 파일이 첨부될 위치 정보 가져오기
	@Value("${file.upload.path}")
	String uploadPath;
	
	int boardCountInPage = 5; // 한 페이지에 보여줄 Board의 글 개수 
	
	// Board List 게시판 글 목록 보여주기

	@RequestMapping(value="/", method=RequestMethod.GET)
	private String boardList(@RequestParam(required = false) String message, @RequestParam(required = false) String pageNum, Model model) throws Exception {


		int numberPageNum = CommonUtility.getPageNumber(pageNum); // 전달 받은 pageNum의 값의 유효성 확인 후 숫자로 변환
		int startBoardNum = (numberPageNum-1)*boardCountInPage; // 선택된 페이지에  보여줄 글의 시작점

		List<BoardVO> boardList = mBoardService.boardList(startBoardNum, boardCountInPage); // PageNum에 해당하는 Board 보여줄 리스트 구하기
		//model.addAttribute("boardList", boardList);

		JsonArray jsonArray = new JsonArray();
		JSONObject jsonObject = new JSONObject();
		List<String> list = new ArrayList<String>();
		for (BoardVO vo : boardList) {

			jsonObject.put("BOARD_ID", vo.getBOARD_ID());
			jsonObject.put("BOARD_TITLE", vo.getBOARD_TITLE());
			jsonObject.put("BOARD_CONTENT", vo.getBOARD_CONTENT());
			jsonObject.put("DT_RGST", vo.getDT_RGST());
			jsonObject.put("USER_ID", vo.getUSER_ID());
			list.add(jsonObject.toString());
		}

		//obj.add("data", jsonArray);
		model.addAttribute("boardList", jsonObject.toString());


		// 로그인 및 무언가의 이유로 여기로 Redirect 될 때, 메세지가 있으면 같이 보내주자


		return "boardList";
	}

	@ResponseBody
	@RequestMapping(value="/test", method=RequestMethod.GET)
	private String test(@RequestParam(required = false) String message, @RequestParam(required = false) String pageNum, Model model) throws Exception {


		int numberPageNum = CommonUtility.getPageNumber(pageNum); // 전달 받은 pageNum의 값의 유효성 확인 후 숫자로 변환
		int startBoardNum = (numberPageNum-1)*boardCountInPage; // 선택된 페이지에  보여줄 글의 시작점

		List<BoardVO> boardList = mBoardService.boardList(startBoardNum, boardCountInPage); // PageNum에 해당하는 Board 보여줄 리스트 구하기
		//model.addAttribute("boardList", boardList);

		JsonArray jsonArray = new JsonArray();
		JSONObject jsonObject = new JSONObject();
		List<String> list = new ArrayList<String>();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");



		for (BoardVO vo : boardList) {

			jsonObject.put("BOARD_ID", vo.getBOARD_ID());
			jsonObject.put("BOARD_TITLE", vo.getBOARD_TITLE());
			jsonObject.put("BOARD_CONTENT", vo.getBOARD_CONTENT());
			jsonObject.put("DT_RGST", simpleDateFormat.format(vo.getDT_RGST()).toString() );
			jsonObject.put("USER_ID", vo.getUSER_ID());
			list.add(jsonObject.toString());
		}

		//model.addAttribute("boardList", jsonObject.toString());


		// 로그인 및 무언가의 이유로 여기로 Redirect 될 때, 메세지가 있으면 같이 보내주자

		//String result = jsonObject.toString();
		return list.toString();
	}

	// Move to Board Register 게시판 글 작성 페이지로 이동
	@RequestMapping(value="/boards/register", method=RequestMethod.GET)
	private String boardRegister() throws Exception {
		return "boardRegister";
	}
	
	// Board Register 게시판 글 작성
	@RequestMapping(value="/boards/register", method=RequestMethod.POST)
	private String boardRegister(HttpServletRequest req, @RequestPart(required=false) MultipartFile[] files ) throws Exception {
		
		// 1. 글을 저장
		BoardVO board = new BoardVO();
		board.setBOARD_TITLE(req.getParameter("title"));
		board.setBOARD_CONTENT(req.getParameter("content"));
		board.setUSER_ID(req.getParameter("writer"));
		mBoardService.boardRegister(board); //DB에 글 저장

		// 파일 저장소 위치 존재 확인 후 없으면 생성.
		File folder = new File(System.getProperty("user.dir")+ uploadPath);
		if (!folder.exists()) {
			folder.mkdir();
		}
		
		//2. 먼저 파일을 저장하고, 저장된 파일 목록을 생성
		List<FileVO> fileList = new ArrayList<FileVO>();
		for(int a=0; a<files.length; a++) {
			// 첨부 파일 유무 확인 후, 있으면 파일 저장
			if( files[a].isEmpty())
				continue;
			String originalFileName = files[a].getOriginalFilename(); //파일의 원래 이름
			String uploadedFileName = RandomStringUtils.randomAlphanumeric(10)+"_"+originalFileName; // 중복 방지를 위해 저장될 랜덤값 + 파일 이름
			File fileToUpload = new File( System.getProperty("user.dir")+ uploadPath+ uploadedFileName );
			files[a].transferTo(fileToUpload);
			
			// 저장된 파일의 정보를 리스트로 보관
			FileVO fileInfo = new FileVO();
			fileInfo.setBoardId(board.getBOARD_ID());
			fileInfo.setOriginalFileName(originalFileName);
			fileInfo.setSavedFileName(uploadedFileName);
			fileList.add(fileInfo);
		}
		
		//3. 저장된 파일 정보 리스트를 DB에 저장
		if(fileList.size()>0) {
			mFileService.fileRegister(fileList);
		}
		return "redirect:/boards/"+board.getBOARD_ID();
	}
	
	// Board Detail 게시판 글 읽기
	@RequestMapping(value="/boards/{boardId}", method=RequestMethod.GET)
	private String boardDetail(@PathVariable int boardId, Model model) throws Exception {
		model.addAttribute("board", mBoardService.boardDetail(boardId)); // 글 정보
		model.addAttribute("fileList", mFileService.fileList(boardId)); // 글에 속한 첨부 파일 리스트
		return "boardDetail";
	}

	// Board Delete 게시판 글 삭제
	@RequestMapping(value="/boards/{boardId}/delete", method=RequestMethod.POST)
	private String boardDelete(HttpServletRequest req, @PathVariable int boardId) throws Exception {
		// 1. 로그인 확인
		if(req.getSession().getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		//2. 글 확인
		BoardVO board = mBoardService.boardDetail(boardId);
		
		//3. 글 삭제 + 연결된 파일 삭제
		if( board.getBOARD_ID()>0) {
			mBoardService.boardDelete(boardId);// DB에 저장된 글 삭제
			
			// 서버에 저장된 실제 파일 삭제
			List<FileVO> fileList = mFileService.fileList(boardId);
			for(int a=0; a<fileList.size(); a++) {
				File file = new File(System.getProperty("user.dir")+ uploadPath+ fileList.get(a).getSavedFileName());
				if(file.exists())
					file.delete(); // 파일 유무 확인 후 삭제
			}
			if(fileList.size()>0)
				mFileService.fileDelete(fileList); // 파일 정보 DB에서 삭제				
		}
		return "redirect:/";
	}	

}