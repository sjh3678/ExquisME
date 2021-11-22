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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import web.dto.FileUpload;
import web.dto.Perf;
import web.service.face.PerfService;
import web.util.Paging;
import web.util.PagingPerf;

@Controller
@RequestMapping(value = "/admin/perf")
public class AdminPerfController {

	private Logger logger = LoggerFactory.getLogger(AdminPerfController.class);
	
	@Autowired PerfService perfService;
	
	@RequestMapping(value = "/list")
	public void perfList(PagingPerf paramData, Model model) {
		logger.info("paramData {} : ", paramData);
		
		//페이징 가져오기
		PagingPerf pagingPerf = perfService.getPaging( paramData );
		
		List<HashMap<String, Object>> list = perfService.getPerfList( pagingPerf );
		model.addAttribute("paging", pagingPerf);
		model.addAttribute("list", list);
	}
	
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String perfUpdate(Perf perf, Model model) {
		
		//PERFUME_NO, PERFUME_NAME, PERFUME_VITALITY, PERFUME_GENDER, FILE_NO, ORIGIN_NAME, STORED_NAME, BRAND_NAME
		HashMap<String, Object> viewPerf = perfService.getPerfView(perf);
		logger.info("viewPerf : {}", viewPerf);
		
		// 탑노트 NOTE_NO, NOTE_NAME, NOTE_ATTRIBUTES, NOTE_TYPE, CNT(노트 추천수)
		List<HashMap<String, Object>> viewPerfTopNote = perfService.getPerfTopNote(perf);
		logger.info("viewPerfTopNote : {}", viewPerfTopNote);
				
		// 미들노트 NOTE_NO, NOTE_NAME, NOTE_ATTRIBUTES, NOTE_TYPE, CNT(노트 추천수)
		List<HashMap<String, Object>> viewPerfMiddleNote = perfService.getPerfMiddleNote(perf);
		logger.info("viewPerfMiddleNote : {}", viewPerfMiddleNote);
				
		// 베이스노트 NOTE_NO, NOTE_NAME, NOTE_ATTRIBUTES, NOTE_TYPE, CNT(노트 추천수)
		List<HashMap<String, Object>> viewPerfBaseNote = perfService.getPerfBaseNote(perf);
		logger.info("viewPerfBaseNote : {}", viewPerfBaseNote);
		
		model.addAttribute("perf", viewPerf);
		model.addAttribute("topNote", viewPerfTopNote);
		model.addAttribute("middleNote", viewPerfMiddleNote);
		model.addAttribute("baseNote", viewPerfBaseNote);
		
		return null;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String perfUpdateProc(MultipartFile file, Perf perf, Model model) {
		logger.info("@@@file : {}", file);
		logger.info("@@@perf : {}", perf);
		
		//향수 사진파일 수정
		perfService.setPerfFileUpdate(file, perf.getFileNo());
		
		//향수 정보 수정
		perfService.setPerfUpdate(perf);
		
		return "redirect:/admin/perf/list";
	}
	
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String perfWrite() {
		return null;
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String perfWriteProc(MultipartFile file, Perf perf, Model model) {
		logger.info("file : {}", file);
		logger.info("perf : {}", perf);
		
		int fileNo = perfService.setPerfFile(file);
		logger.info("fileNo : {}", fileNo);
		
		int perfumeNo = perfService.setNewPerf(perf, fileNo);
		logger.info("perfumeNo : {}", perfumeNo);
		
		perfService.setNewPerfNote(perf);
		
		return "redirect:/admin/perf/list";
	}
	
	@RequestMapping(value = "/delete")
	public String perfDelete(Perf perf) {
		perfService.deletePerf(perf);
		return "redirect:/admin/perf/list";
	}
	
}
