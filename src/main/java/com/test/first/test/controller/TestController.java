package com.test.first.test.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.first.notice.model.service.NoticeService;
import com.test.first.notice.model.vo.Notice;

@Controller
public class TestController {
    private static final Logger logger = LoggerFactory.getLogger(TestController.class);
    
    @Autowired
    private NoticeService noticeService;
    
    @RequestMapping(value="test.do", method= {RequestMethod.GET, RequestMethod.POST})
    public String testViewMethod() {
        return "test/testView";
    }
    
    @RequestMapping(value="testJSON.do", method= {RequestMethod.GET, RequestMethod.POST})
    public String testJSONViewMethod() {
        return "test/testJSONView";
    }
    
    @RequestMapping(value="testJS.do", method= {RequestMethod.GET, RequestMethod.POST})
    public String testJSViewMethod() {
        return "test/testJSView";
    }
    
    @RequestMapping(value="testJQuery.do", method= {RequestMethod.GET, RequestMethod.POST})
    public String testJQueryViewMethod() {
        return "test/testJQueryView";
    }
    
    //ajax test ----------------------------------------------
    @RequestMapping("test1.do")
    @ResponseBody //문자 응답시에는 생략해도 상관없음.
    public void test1Method(HttpServletResponse response, HttpServletRequest request) throws IOException {
    	//ajax(Asynchronous Javascript And Xml)
    	//자바스크립트외 xml을 이용한 비동기식 네트워크 통신임
    	//별도의 입출력 스트림을 가지고 있음
    	
    	//서비스를 요청한 클라이언트로 값 내보낼 출력스트림 생성
    	//문자값 전송시에는 mimitype 생략할 수도 있음
    	PrintWriter out = response.getWriter();
    	
    	out.append("Served at : ");
    	out.append(request.getContextPath());
    	
    	out.close();
    }
    
    @RequestMapping(value="test2.do", method=RequestMethod.POST)
    public void test2Method(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	logger.info("test2.do run......" );
    	//request 객체 : 클라이언트측의 전송값을 가지고 오는 객체임
    	//response 객체 : 서비스를 요청한 클라이언트 정보가 들어있음
    	
    	//request 에서 전송값 꺼내기 : getParameter()
    	String name = request.getParameter("name");
    	String ageParam = request.getParameter("age");
    	//parsing : String --> 기본자료형으로 변환하는 것
    	int age = Integer.parseInt(ageParam);
    	// ==> spring 에서는 메소드 매개변수에 어노테이션으로 처리
    	//@RequestParam("이름") 자료형 변수명
    	//@RequestParam("name") String name, @RequestParam("age") int age 표기하면 됨
    	
    	logger.info(name + ", " + age);
    	//서비스로 보내고 결과받기 : 생략 ..
    	
    	//요청한 클라이언트에게 결과를 전송함 : 출력스트림
    	//1, 응답하는 정보에 대한 MimiType 지정함. (권장함)
    	response.setContentType("text/html; charset=utf-8");
    	//2. 출력에 사용할 스트림 생성
    	PrintWriter out = response.getWriter();
    	
    	//전송온 이름이 "홍길동"이면 "ok", 아니면 "fail" 전송
    	if(name.trim().equals("홍길동")) {
    		out.append("ok");
    		out.flush();
    	}else{
    		out.append("fail");
    		out.flush();
    	}
    	
    	out.close();
    }
    
    @RequestMapping(value="test3.do", method=RequestMethod.POST)
    @ResponseBody //리턴하는 json 문자열을 response 에 담아서 보낸다는 의미임.
    public String test3Method(HttpServletResponse response) throws UnsupportedEncodingException{
    	logger.info("test3.do run....");
    	
    	//최근 공지글 1개 조회
    	Notice notice = noticeService.selectLast();
    	
    	//response 에 mimitype 지정
    	response.setContentType("application/json; charset=utf-8");
    	
    	//json 객체 생성 >> 값 기록 저장 >> json 문자열을 내보냄.
    	JSONObject job = new JSONObject();
    	job.put("noticeno", notice.getNoticeno());
    	
    	//문자열 값 기록시, 한글이 포함되어 있는 경우 인코딩 처리함
    	job.put("noticetitle", URLEncoder.encode(notice.getNoticetitle(), "utf-8"));
    	job.put("noticewriter", notice.getNoticewriter());
    	
    	//날짜데이터는 반드시 문자열로 바꿔서 저장함
    	job.put("noticedate", notice.getNoticedate().toString());
    	job.put("noticecontent", URLEncoder.encode(notice.getNoticecontent(), "utf-8"));
    	
    	//서비스 요청한 클라이언트로 응답하는 방법은 2가지
    	//방법 1. public void 형 >> 직접 출력스트림 만들어서 내보내는 방식
    	//방법 2. public String 형 >> 설정된 jsonview 로 리턴
    	
    	//응답시에는 Json 객체를 String 형으로 바꿔서 응답합
    	return job.toJSONString(); //servlet-context.xml 의 jsonView가 받아서 내보냄
    }
    
    //클라이언트 요청을 처리한 결과로 json 배열을 jsonView로
    //리턴하는 메소드
    @RequestMapping(value="test4.do", method=RequestMethod.POST)
    @ResponseBody
    public String test4Method(@RequestParam("keyword") String keyword, HttpServletResponse response) throws UnsupportedEncodingException {
    	logger.info("test4.do run...");
    	
    	ArrayList<Notice> list = noticeService.selectSearchTitle(keyword);
    	
    	response.setContentType("application/json; charset=utf-8");
    	
    	//전송용 json 객체 준비
    	JSONObject sendJson = new JSONObject();
    	//json 배열객체 준비 :list의 값들을 기로할 객체
    	JSONArray jarr = new JSONArray();
    	
    	//list를 jarr에 옮기기
    	for(Notice notice : list) {
    		//notice 저장용 json 객체 준비
    		JSONObject job = new JSONObject();
    		
    		job.put("noticeno", notice.getNoticeno());
        	//문자열 값 기록시, 한글이 포함되어 있는 경우 인코딩 처리함
        	job.put("noticetitle", URLEncoder.encode(notice.getNoticetitle(), "utf-8"));
        	job.put("noticewriter", notice.getNoticewriter());
        	//날짜데이터는 반드시 문자열로 바꿔서 저장함
        	job.put("noticedate", notice.getNoticedate().toString());
        	
        	jarr.add(job);
    	}
    	
    	//json 배열을 전송용 json 에 저장
    	sendJson.put("list", jarr);
    	
    	return sendJson.toJSONString();	 //jsonView로 보내짐
    }
    
    //클라이언트가 보낸 json 객체를 받아서 처리하는 메소드
    //get : 전송값이 request head에 기록되서 전송됨 (보여짐)
    //post : 전송값이 request 객체의 body에 기록되서 전송됨
    @RequestMapping(value="test5.do", method=RequestMethod.POST)
    public ResponseEntity<String> Test5Method(@RequestBody String param) throws ParseException {
    	//post 로 request body 에 기록된 json 문자열을 꺼내서
    	//param 변수에 저장함
    	
    	logger.info("test5.do run...");
    	
    	//param에 저장된 json문자열을 json 객체로 바꿈
    	JSONParser jparser = new JSONParser();
    	
    	JSONObject job = (JSONObject) jparser.parse(param);
    	
    	//json 객체가 가진 각 필드값을 추출해서 vo 객체에 저장
    	Notice notice = new Notice();
    	notice.setNoticetitle((String) job.get("title"));
    	notice.setNoticewriter((String) job.get("writer"));
    	notice.setNoticecontent((String) job.get("content"));
    	
    	int result = noticeService.insertNotice(notice);
    	
    	//ResponseEntity<String> : 클라이언트에게 응답하는 용도의 객체
    	//뷰리졸버가 아닌 출력스트림으로 나감
    	if(result > 0) {
    		return new ResponseEntity<String>("success", HttpStatus.OK);
    	} else {
    		return new ResponseEntity<String>("failed", HttpStatus.REQUEST_TIMEOUT);
    	}
		
    }
    
    @RequestMapping(value="test6.do", method=RequestMethod.POST)
    public ResponseEntity<String> Test6Method(@RequestBody String param) throws ParseException {
    	//post 로 request body 에 기록된 json 문자열을 꺼내서
    	//param 변수에 저장함
    	
    	logger.info("test6.do run...");
    	
    	//param에 저장된 json문자열을 json array 객체로 바꿈
    	JSONParser jparser = new JSONParser();
    	
    	JSONArray jarr = (JSONArray) jparser.parse(param);
    	
    	//json 객체가 가진 각 필드값을 추출해서 vo 객체에 저장
    	for(int i = 0; i < jarr.size(); i++){
    		JSONObject job = (JSONObject) jarr.get(i);
    		Notice notice = new Notice();
	    	notice.setNoticetitle((String) job.get("ntitle"));
	    	notice.setNoticewriter((String) job.get("nwriter"));
	    	notice.setNoticecontent((String) job.get("ncontent"));
	    	
	    	noticeService.insertNotice(notice);
	
    	}
    	
    	//ResponseEntity<String> : 클라이언트에게 응답하는 용도의 객체
    	//뷰리졸버가 아닌 출력스트림으로 나감
    	return new ResponseEntity<String>("success", HttpStatus.OK);
    }
}

