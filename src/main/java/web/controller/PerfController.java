package web.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import web.dto.Perf;
import web.service.face.PerfService;
import web.util.PagingPerf;

@Controller
@RequestMapping(value = "/perf")
public class PerfController {

	private Logger logger = LoggerFactory.getLogger(PerfController.class);
	
	@Autowired PerfService perfService;
	
	@RequestMapping(value = "/list")
	public void perfList(PagingPerf paramData, String search, Model model) {
		logger.info("search: {}", search);

	}
	
	@RequestMapping(value= "/list_ok")
	public String perListOk(PagingPerf paramData, Model model ) {
		
		logger.info("/list_ok");
		logger.info("search: {}", paramData.getSearch());
		logger.info("gender: {}", paramData.getGender());
		logger.info("note: {}", paramData.getNote());
		logger.info("Vitality: {}", paramData.getVitality());
		logger.info("CurPage: {}", paramData.getCurPage());
		logger.info("paramDate {} : ", paramData);
		
		
		//페이징 가져오기
		PagingPerf pagingPerf = perfService.getPaging( paramData );
		
		logger.info("pagingPerf {} : ", pagingPerf);
		
		pagingPerf.setSearch(paramData.getSearch());
		pagingPerf.setGender(paramData.getGender());
		pagingPerf.setNote(paramData.getNote());
		pagingPerf.setVitality(paramData.getVitality());
		
		
		logger.info("CurPage : {}", pagingPerf.getCurPage());
		logger.info("EndPage : {}", pagingPerf.getEndPage());
		
		if(paramData.getCurPage() > pagingPerf.getEndPage()) {
			return null;
		}
		List<HashMap<String, Object>> list = perfService.getPerfList( pagingPerf );
		model.addAttribute("paging", pagingPerf);
		model.addAttribute("list", list);

		
		return "/perf/list_ok";
	}
	
	@RequestMapping(value = "/view")
	public String perfView(Perf perf, Model model) {
		
		
		return null;
	}
}
