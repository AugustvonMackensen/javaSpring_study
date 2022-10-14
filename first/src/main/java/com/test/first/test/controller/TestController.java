package com.test.first.test.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {
    private static final Logger logger = LoggerFactory.getLogger(TestController.class);
    
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
}
