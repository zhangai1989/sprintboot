package com.jz.springbootdemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.Map;

@Controller
//@RestController注解相当于@ResponseBody ＋ @Controller合在一起的作用。本来应该到success.jsp页面的，则其显示success.
//@RestController
@SpringBootApplication
@ImportResource(value = {"classpath:providers.xml"}) // 使用 providers.xml 配置；
public class SpringbootdemoApplication extends SpringBootServletInitializer {
	@RequestMapping(value="/hello")
	@ResponseBody
	public String hello(){
		return "hello word!";
	}
	@RequestMapping(value="/mqttclient")
	public String mqttclient(){
		return "mqttclient";
	}

	@RequestMapping(value="/mqtt")
	public String mqtt(){
		return "mqtt";
	}
	public static void main(String[] args) {
		SpringApplication.run(SpringbootdemoApplication.class, args);
	}

	@RequestMapping(value = {"/", "/index"})
	public String index(Map<String, Object> model) {
		// 直接返回字符串，框架默认会去 spring.view.prefix 目录下的 （index拼接spring.view.suffix）页面
		// 本例为 /WEB-INF/jsp/index.jsp
		model.put("time", new Date());
		model.put("message", "hello");
		return "index";
	}
}
