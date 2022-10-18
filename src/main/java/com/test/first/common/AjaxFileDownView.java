package com.test.first.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

//스프링에서 뷰리졸버에 의해 실행되는 뷰클래스가 되려면,
//반드시 AbstractView를 상속받은 후손 클래스여야 함.
@Component("afiledown")
public class AjaxFileDownView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
	}

}
