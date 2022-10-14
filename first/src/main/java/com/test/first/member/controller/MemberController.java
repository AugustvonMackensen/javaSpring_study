package com.test.first.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.test.first.common.SearchDate;
import com.test.first.member.model.service.MemberService;
import com.test.first.member.model.vo.Member;

@Controller	//xml 에 자동 등록됨
public class MemberController {
	//이 컨트롤러 안의 메소드들 구동 상태에 대한 로그 출력용 객체
	//classpath 에 log4j.xml 에 설정된 내용으로 출력 적용
	
	private static final Logger logger =
			LoggerFactory.getLogger(MemberController.class);
	
	@Autowired //자동 의존성주입(DI) (자동 객체 생성됨)
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 뷰 페이지 이동 처리용 ---------------------------
	@RequestMapping("loginPage.do")
	public String moveLoginPage() {
		return "member/loginPage";
	}
	
	@RequestMapping("enrollPage.do")
	public String moveEnrollPage() {
		return "member/enrollPage";
	}
	
	@RequestMapping("moveup.do")
	public String moveUpdatePage(@RequestParam String userid, Model model) {
		Member member = memberService.selectMember(userid);
		if(member != null) {
			model.addAttribute("member", member);
			return "member/updatePage";
		} else {
			model.addAttribute("message", userid + " : 회원 조회 실패!");
			return "common/error";
		}
		
	}
	
	// --------------------------------------------------------
	//웹서비스 요청 하나당 메소드당 하나씩 작성하는 방식임
//	@RequestMapping(value="login.do", method=RequestMethod.POST)
//	public String loginMethod(Member member) {
//		logger.info("전달받은 값 확인 : " + member.toString());
//		
//		Member loginMember = 
//				memberService.selectLogin(member);
//		
//		logger.info("로그인 결과 확인 : " + loginMember.toString());
//		
//		return "common/main";
//	}
	
	//로그인 처리용 메소드
//	@RequestMapping(value="login.do", method=RequestMethod.POST)
//	public String loginMethod(HttpServletRequest request, HttpServletResponse response, Model model) {
//		//1. 서버측으로 전송온 값 꺼내기
//		String userid = request.getParameter("userid");
//		String userpwd = request.getParameter("userpwd");
//		logger.info("login.do : " + userid + ", " + userpwd);
//		
//		Member member = new Member();
//		member.setUserid(userid);
//		member.setUserpwd(userpwd);
//		
//		//2. 서비스 모델로 전달하고 결과 받기
//		Member loginMember = memberService.selectLogin(member);
//		
//		//3. 로그인 성공 여부에 따라서 결과 처리
//		String viewName = null;
//		if(loginMember != null) {	//로그인 성공
//			//로그인 상태 관리 방법 (상태 관리 매커니즘) : 기본 세션 사용
//			//세션 객체 새로 만들기
//			HttpSession loginSession = request.getSession();
//			logger.info("sessionID : " + loginSession.getId());
//			
//			//필요한 경우 생성된 세션 객체 안에 정보를 저장할 수 있음
//			//맵 구조로 저장함 : 키(String), 값(Object)
//			loginSession.setAttribute("loginMember", loginMember);
//			
//			//로그인 성공시 내보낼 뷰파일명 지정
//			viewName = "common/main";
//		}else {	//로그인 실패
//			model.addAttribute("message", "로그인 실패 : 아이디나 암호 확인하세요.");
//			viewName = "common/error";
//		}
//		
//		return viewName;
//	}
	
	//로그인 처리용 메소드 : 커맨드 객체(command object) 사용
	//서버로 전송은 parameter 값을 저장한 객체를 command 객체라고 한다.
	//작성 요령 : input name 과 command 객체의 필드명이 같아야 함
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String loginMethod(Member member, HttpSession loginSession, SessionStatus status, Model model) {
		logger.info("login.do : " + member);
		
		//암호화 처리된 패스워드 일치 조회는 select 해 온 값으로 비교함
		//전달온 회원 아이디로 먼저 회원정보 조회해 옴
		Member loginMember = memberService.selectMember(member.getUserid());
		
		//2. 서비스 모델로 전달하고 결과 받기
//		Member loginMember = memberService.selectLogin(member);
		
		//3. 로그인 성공 여부에 따라서 결과 처리
		//암호화된 패스워드와 전달된 글자타입 패스워드를 비교함
		//matches(글자타입패스워드, 암호화된패스워드)
		String viewName = null;
		if(loginMember != null && this.bcryptPasswordEncoder.matches(member.getUserpwd(), loginMember.getUserpwd())
				&& loginMember.getLogin_ok().equals("Y")) {	//로그인 성공
			//로그인 상태 관리 방법 (상태 관리 매커니즘) : 기본 세션 사용
			logger.info("sessionID : " + loginSession.getId());
			
			//필요한 경우 생성된 세션 객체 안에 정보를 저장할 수 있음
			//맵 구조로 저장함 : 키(String), 값(Object)
			loginSession.setAttribute("loginMember", loginMember);
			status.setComplete(); //로그인 요청 성공, 200 전송함
			//로그인 성공시 내보낼 뷰파일명 지정
			viewName = "common/main";
		}else {	//로그인 실패
			model.addAttribute("message", "로그인 실패 : 아이디나 암호 확인하세요. <br>"
					+ "또는 로그인 제한 회원인지 관리자에게 문의하세요.");
			viewName = "common/error";
		}
		
		return viewName;
	}
	
	//로그아웃 처리용
	@RequestMapping("logout.do")
	public String logoutMethod(HttpServletRequest request, Model model) {
		// 로그인할 때 생성된 세션객체를 찾아서 없앰
		HttpSession session = request.getSession(false);
		//request가 가진 세션id 에 대한 세션객체가 있으면 리턴
		//없으면 null 리턴
		
		if(session != null) {
			session.invalidate();	//세션 객체를 없앰
			return "common/main";
		}else {
			model.addAttribute("message", "로그인 세션이 존재하지 않습니다.");
			return "common/error";
		}
 	}
	
	//회원 가입 처리용
	@RequestMapping(value="enroll.do", method=RequestMethod.POST)
	public String memberInsertMethod(Member member, Model model) {
		//메소드 매개변수에 vo를 지정하면 자동 객체 생성되면서
		//뷰페이지 form 태그 input에 name 과 vo 의 필드명이 같으면
		//자동으로 전송온 값(parameter)이 꺼내져서 객체에 옮겨 저장됨
		//커맨드 객체(command object)라고 함
		logger.info("enroll.do : " + member);
		
		//패스워드 암호화 처리
		member.setUserpwd(this.bcryptPasswordEncoder.encode(member.getUserpwd())); //this 생략 가능
		logger.info("after encode : " + member);
		logger.info("length : " + member.getUserpwd().length());
		
		if(memberService.insertMember(member) > 0) {
			//회원 가입 성공
			return "common/main";
		}else {
			//회원 가입 실패
			model.addAttribute("message", "회원 가입 실패!");
			return "common/error";
		}	
	}
	
	//리턴 타입으로 String, ModelAndView를 사용할 수 있음
	@RequestMapping("myinfo.do")
	//public String myinfoMethod() { return "폴더명/뷰파일명"; }
	public ModelAndView myinfoMethod(@RequestParam("userid") String userid, ModelAndView mv) {
		//서비스로 전송온 값 전달해서, 실행 결과 받기
		Member member = memberService.selectMember(userid);
		
		if(member != null) {
			mv.addObject("member", member);
			mv.setViewName("member/myinfoPage");
		}else {
			mv.addObject("message", userid + " : 회원 정보 조회 실패!");
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	//=======================================================================
	//ajax 통신으로 처리하는 요청 메소드 ---------------------------
	@RequestMapping(value="idchk.do", method=RequestMethod.POST)
	public void dupIdCheckMethod(@RequestParam("userid") String userid, HttpServletResponse response) throws IOException {
		
		int idCount = memberService.selectDupCheckId(userid);
		
		String returnValue = null;
		if(idCount == 0) {
			returnValue = "ok";
		} else {
			returnValue = "dup";
		}
		
		//response 를 이용해서 클라이언트로 출력 스트림을 만들고, 값을 보내기
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(returnValue);
		out.flush();
		out.close();
	}
	
	//회원 정보 수정용 : 수정 성공시 myinfoPage.jsp로 이동함
	@RequestMapping(value="mupdate.do", method=RequestMethod.POST)
	public String memberUpdateMethod(Member member, Model model, @RequestParam("origin_userpwd") String originUserpwd) {
		logger.info("mupdate.do : " + member);
		logger.info("origin_userpwd : " + originUserpwd);
		
		//새로운 암호가 전송이 왔다면, 패스워드 암호화 처리함
		String userpwd = member.getUserpwd().trim();
		if(userpwd != null && userpwd.length() > 0) {
			//기존 암호화 다른 값인지 확인
			if(!this.bcryptPasswordEncoder.matches(userpwd, originUserpwd)) {
				//member에 새로운 패스워드를 암호화해서 기록
				member.setUserpwd(this.bcryptPasswordEncoder.encode(userpwd));
			}
		} else {
			//새로운 패스워드 값이 없다면
			member.setUserpwd(originUserpwd);
		}
		
		logger.info("after : " + member);
		
		if(memberService.updateMember(member) > 0) {
			//수정이 성공했다면, 컨트롤러의 메소드를 직접 호출할 수도 있음.
			//즉, 컨트롤러 안에서 다른 컨트롤러를 실행할 수도 있음
			//내 정보보기 페이지에 수정된 회원정보를 다시 조회해서 내보냄
			//쿼리스트링 : ?이름=값&이름=값
			return "redirect:myinfo.do?userid=" + member.getUserid();
		}else {
			model.addAttribute("message", member.getUserid() + " : 회원 정보 수정 실패!");
			return "common/error";
		}
	}
	
	// 회원 탈퇴 처리용 : 회원 정보 삭제함
	// 삭제되면 자동 로그아웃함
	@RequestMapping("mdel.do")
	public String memberDeleteMethod(@RequestParam("userid") String userid, Model model) {
		if(memberService.deleteMember(userid) > 0) {
			return "redirect:logout.do";
		} else {
			model.addAttribute("message", userid + " : 회원 삭제 요청 실패!");
			return "common/error";
		}
	}
	
	//회원관리용 회원전체목록 처리용
	@RequestMapping("mlist.do")
	public String memberListViewMethod(Model model) {
		ArrayList<Member> list = memberService.selectList();
		
		if(list.size() > 0) {
			model.addAttribute("list", list);
			return "member/memberListView";
		} else {
			model.addAttribute("message", "회원 정보가 존재하지 않습니다.");
			return "common/error";
		}
	}
	
	//로그인 제한/가능 변경 처리용
	@RequestMapping("loginok.do")
	public String changeLoginOKMethod(Member member, Model model) {
		logger.info("loginok.do : " + member.getUserid() + ", " + member.getLogin_ok());
		
		if(memberService.updateLoginOK(member) > 0) {
			return "redirect:mlist.do";
		} else {
			model.addAttribute("message", "로그인 제한/허용 처리 오류 발생");
			return "common/error";
		}		
	}
	
	//회원 검색 처리용
	@RequestMapping(value="msearch.do", method=RequestMethod.POST)
	public String memberSearchMethod(HttpServletRequest request, Model model) {
		String action = request.getParameter("action");
		String keyword = null, beginDate = null, endDate = null;
		
		if(action.equals("enrolldate")) {
			beginDate = request.getParameter("begin");
			endDate = request.getParameter("end");
		} else {
			keyword = request.getParameter("keyword");
		}
		
		//서비스 메소드 리턴값 받을 리스트 준비
		ArrayList<Member> list = null;
		
		switch(action) {
		case "id":			list = memberService.selectSearchUserid(keyword);
							break;			
		case "gender": 		list = memberService.selectSearchGender(keyword);
							break;
		case "age": 		list = memberService.selectSearchAge(Integer.parseInt(keyword));
							break;
		case "enrolldate": 	list = memberService.selectSearchEnrollDate(new SearchDate(Date.valueOf(beginDate), Date.valueOf(endDate)));
							break;
		case "loginok": 	list = memberService.selectSearchLoginOK(keyword);
							break;
		}
		
		if(list.size() > 0) {
			model.addAttribute("list", list);
			return "member/memberListView";
		} else {
			model.addAttribute("message", action + "검색에 대한 " + keyword + " 결과가 존재하지 않습니다.");
			return "common/error";
		}
	}
}
