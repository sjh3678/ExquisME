package web.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import web.dto.NoteLike;
import web.dto.Perf;
import web.dto.PerfLike;
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
		logger.info("paramData {} : ", paramData);
		
		
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

		
		return "perf/list_ok";
	}
	
	@RequestMapping(value = "/view")
	public String perfView(Perf perf, Model model, HttpSession session) {
		logger.info("perf : {}", perf);
		
		//PERFUME_NO, PERFUME_NAME, PERFUME_VITALITY, PERFUME_GENDER, ORIGIN_NAME, STORED_NAME, BRAND_NAME
		HashMap<String, Object> viewPerf = perfService.getPerfView(perf);
		logger.info("viewPerf : {}", viewPerf);
		
		//RANKING, NOTE_NO, CNT(노트 추천수), NOTE_NAME
		List<HashMap<String, Object>> viewPerfMainAccord = perfService.getPerfMainAccord(perf);
		logger.info("viewPerfMainAccord : {}", viewPerfMainAccord);
		
		//CNT(향수 좋아요 수)
		HashMap<String, Object> viewPerfLike = perfService.getPerfLike(perf.getPerfumeNo());
		logger.info("viewPerfLike : {}", viewPerfLike);
		
		//CNT(향수 싫어요 수)
		HashMap<String, Object> viewPerfDislike = perfService.getPerfDislike(perf.getPerfumeNo());
		logger.info("viewPerfDislike : {}", viewPerfDislike);
		
		// 탑노트 NOTE_NO, NOTE_NAME, NOTE_ATTRIBUTES, NOTE_TYPE, CNT(노트 추천수)
		List<HashMap<String, Object>> viewPerfTopNote = perfService.getPerfTopNote(perf);
		logger.info("viewPerfTopNote : {}", viewPerfTopNote);
		
		// 미들노트 NOTE_NO, NOTE_NAME, NOTE_ATTRIBUTES, NOTE_TYPE, CNT(노트 추천수)
		List<HashMap<String, Object>> viewPerfMiddleNote = perfService.getPerfMiddleNote(perf);
		logger.info("viewPerfMiddleNote : {}", viewPerfMiddleNote);
		
		// 베이스노트 NOTE_NO, NOTE_NAME, NOTE_ATTRIBUTES, NOTE_TYPE, CNT(노트 추천수)
		List<HashMap<String, Object>> viewPerfBaseNote = perfService.getPerfBaseNote(perf);
		logger.info("viewPerfBaseNote : {}", viewPerfBaseNote);
		
		
		if( session.getAttribute("login") != null) {
			int userNo = (int) session.getAttribute("userNo");
			logger.info("userNo : {}", userNo);
		
			//회원의 향수 좋아요 여부 count
			int userLikeCnt = perfService.getPerfLikeCnt(perf.getPerfumeNo(), userNo);
			logger.info("userLikeCnt : {}", userLikeCnt);
			
			//회원의 향수 싫어요 여부 count
			int userDislikeCnt = perfService.getPerfDislikeCnt(perf.getPerfumeNo(), userNo);
			logger.info("userDislikeCnt : {}", userDislikeCnt);
			
			model.addAttribute("userLikeCnt", userLikeCnt);
			model.addAttribute("userDislikeCnt", userDislikeCnt);
		}
		
		model.addAttribute("perf", viewPerf);		
		model.addAttribute("mainAccord", viewPerfMainAccord);
		model.addAttribute("perfLike", viewPerfLike);
		model.addAttribute("perfDislike", viewPerfDislike);
		model.addAttribute("topNote", viewPerfTopNote);
		model.addAttribute("middleNote", viewPerfMiddleNote);
		model.addAttribute("baseNote", viewPerfBaseNote);
		
		return "perf/view";
	}
	
	@RequestMapping(value = "/like")
	public String perfLike(PerfLike perfLike, Model model, HttpSession session) {
		
		perfLike.setUserNo( (int) session.getAttribute("userNo"));
		logger.info("perfNo : {}", perfLike);
		logger.info("likeType : {}", perfLike.getLikeType());
		
		//좋아요/싫어요 처리
		perfService.perfLikeProc(perfLike);
		
		model.addAttribute("perfLike", perfLike);
		
		//CNT(향수 좋아요 수)
		HashMap<String, Object> viewPerfLike = perfService.getPerfLike(perfLike.getPerfumeNo());
		logger.info("viewPerfLike : {}", viewPerfLike);
		
		//CNT(향수 싫어요 수)
		HashMap<String, Object> viewPerfDislike = perfService.getPerfDislike(perfLike.getPerfumeNo());
		logger.info("viewPerfDislike : {}", viewPerfDislike);
		
		//회원의 향수 좋아요 여부 count
		int userLikeCnt = perfService.getPerfLikeCnt(perfLike.getPerfumeNo(), perfLike.getUserNo());
		logger.info("userLikeCnt : {}", userLikeCnt);
		
		//회원의 향수 싫어요 여부 count
		int userDislikeCnt = perfService.getPerfDislikeCnt(perfLike.getPerfumeNo(), perfLike.getUserNo());
		logger.info("userDislikeCnt : {}", userDislikeCnt);
		
		model.addAttribute("perfLike", viewPerfLike);
		model.addAttribute("perfDislike", viewPerfDislike);
		model.addAttribute("userLikeCnt", userLikeCnt);
		model.addAttribute("userDislikeCnt", userDislikeCnt);
		
		return "perf/like";
	}
	
	@RequestMapping(value = "/vote")
	public String perfNoteVote(Perf perf, Model model, HttpSession session) {
		
		
		//PERFUME_NO, PERFUME_NAME, PERFUME_VITALITY, PERFUME_GENDER, ORIGIN_NAME, STORED_NAME, BRAND_NAME
		HashMap<String, Object> viewPerf = perfService.getPerfView(perf);
		logger.info("viewPerf : {}", viewPerf);
				
		//RANKING, NOTE_NO, CNT(노트 추천수), NOTE_NAME
		List<HashMap<String, Object>> viewPerfMainAccord = perfService.getPerfMainAccord(perf);
		logger.info("viewPerfMainAccord : {}", viewPerfMainAccord);
				
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
		model.addAttribute("mainAccord", viewPerfMainAccord);
		model.addAttribute("topNote", viewPerfTopNote);
		model.addAttribute("middleNote", viewPerfMiddleNote);
		model.addAttribute("baseNote", viewPerfBaseNote);
		
		return "perf/vote";
	}
	
	@RequestMapping(value = "/voteProc")
	public String noteVote(NoteLike noteLike, HttpSession session) {
		noteLike.setUserNo( (int) session.getAttribute("userNo"));
		logger.info("noteNo ; {}", noteLike);
		
		logger.info("noteNo ; {}", noteLike.getClass());
		
		//노트 투표 처리
		perfService.noteLikeProc(noteLike);
		
		return "redirect:/perf/view?perfumeNo="+noteLike.getPerfumeNo();
	}
	
	
	
}
