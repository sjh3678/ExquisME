package web.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import web.dto.ExComm;
import web.dto.Extagram;
import web.service.face.ExtaService;
import web.util.Paging;

@Controller
public class ExtaController {
	private static final Logger logger = LoggerFactory.getLogger(ExtaController.class);
	
	@Autowired ExtaService extaService;
	
	
//LIST	
	@RequestMapping(value="/extagram/list")
	public void extaList(Paging paramData, Model model) {
		logger.info("Extagram 리스트");
		
		Paging paging = extaService.getExtaPaging(paramData);
		
		//목록
		List<HashMap<String, Object>> list = extaService.getExtaList(paging);
		
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
	}
	
	
//VIEW	
	@RequestMapping(value="/extagram/view", method=RequestMethod.GET)
	public String extaView(Extagram viewExta, Model model, HttpSession session, MultipartFile file) {
		
		if(viewExta.getExNo() < 1) {
			return "redirect:/board/list";
		}
		
		
		//댓글
		List<HashMap<String, Object>> commentList = extaService.getCommentList(viewExta);
		logger.info("해쉬맵 전달값 확인 : {}", commentList);
		model.addAttribute("viewComm", commentList);
		
		//게시글
		model.addAttribute("viewExta",extaService.getExtaView(viewExta));
		
		return "/extagram/view";
	}

//COMMENT
	@RequestMapping(value="/extagram/view", method=RequestMethod.POST)
	public String extaComment(ExComm comment, Model model, HttpSession session) {
		
		extaService.setComment((ExComm) session.getAttribute("nick"));
		
		return "redirect:/extagram/view?exNo=" + comment.getExPostNo();
		
	}
	
//	@RequestMapping(value="/extagram/write", method=RequestMethod.GET)
//	public String extaWrite(Extagram extagram, HttpSession session) {
//		return null;
//	}
//	
//	@RequestMapping(value="/extagram/write", method=RequestMethod.POST)
//	public String extaWriteProc(Extagram extagram, HttpSession session, MultipartFile file) {
//		return null;		
//	}
//	
//	@RequestMapping(value="/extagram/update", method=RequestMethod.GET)
//	public void extaUpdate(Extagram extagram) {
//		
//	}
//	
//	@RequestMapping(value="/extagram/update", method=RequestMethod.POST)
//	public void extaUpdateProc(Extagram extagram) {
//		
//	}
//	
//	@RequestMapping(value="/extagram/delete")
//	public String extaDelete(Extagram extagram) {
//		return null;
//	}
//	@RequestMapping(value="/extagram/report")
//	public void extaReport(Extagram extagram, Model model) {
//		
//	}
//	
//	@RequestMapping(value="/extagram/heart")
//	public void heart(ExLike exLike, HttpSession session) {
//		
//	}
//	
//	@RequestMapping(value="/extagram/heart_delete")
//	public void heartDelete(ExLike exLike, HttpSession session) {
//		
//	}
//	
//	@RequestMapping(value="/extagram")
//	public void commWrite(ExComm exComm) {
//		
//	}
//	
//	@RequestMapping(value="/extagram")
//	public void commWriteProc(ExComm exComm) {
//		
//	}
//	
//	@RequestMapping(value="/extagram")
//	public void commDelete(ExComm exComm) {
//		
//	}

	
	
	
	
	
}
