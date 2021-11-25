package web.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Report;
import web.service.face.ExtaService;
import web.util.Paging;

@Controller
public class AdminReportController {
	private static final Logger logger = LoggerFactory.getLogger(AdminReportController.class);

	@Autowired ExtaService extaService;
	
	@RequestMapping(value="/admin/report/list")
	public void AdminReport(Paging paramData, Model model, Report report) {
		
		//페이징 계산
		Paging paging = extaService.getPaging( paramData );
		logger.info("{}", paging);		
		
		//신고테이블 모든 정보 담긴 리스트
		List<HashMap<String, Object>> list = extaService.setReportList(paging);

		model.addAttribute("paging", paging);
		model.addAttribute("reportList", list);
	}
	
	@RequestMapping(value="/admin/report/list", method=RequestMethod.POST)
	public String AdminReportProc(Report report, Paging paramData, Model model) {
		
		logger.info("##report : {}", report);
		
		extaService.setReportStart(report);
		
		return "redirect:/admin/report/list?curPage=1";
	}
}
