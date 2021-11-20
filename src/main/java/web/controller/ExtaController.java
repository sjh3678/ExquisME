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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import web.dao.face.ExtaDao;
import web.dto.ExComm;
import web.dto.ExLike;
import web.dto.Extagram;
import web.dto.FileUpload;
import web.service.face.ExtaService;
import web.util.PagingExtagram;

@Controller
public class ExtaController {
	private static final Logger logger = LoggerFactory.getLogger(ExtaController.class);
	
	@Autowired ExtaService extaService;
	@Autowired ExtaDao extaDao;
	
	
//LIST	
	@RequestMapping(value="/extagram/list")
	public void extaList(PagingExtagram paramData, Model model) {
		logger.info("Extagram 리스트");
	}
	
	@RequestMapping(value="/extagram/list_ok", method = RequestMethod.GET)
	public String extaListOk(Model model, PagingExtagram paramData, String target) {
		
		System.out.println("target : " + paramData.getTarget());
		System.out.println("paramData : " + paramData);
		System.out.println("target : " + target);
		
		PagingExtagram paging = extaService.getExtaPaging(paramData);
		
		//목록
		List<HashMap<String, Object>> list = extaService.getExtaList(paging);
		
		if(paramData.getCurPage() > paging.getEndPage()) {
			return null;
		}
		
		model.addAttribute("paging",paging);
		model.addAttribute("list",list);
		model.addAttribute("linkurl", "/extagram/list");
		
		return "/extagram/list_ok";
	} 
	
	
//VIEW	
	@RequestMapping(value="/extagram/view", method=RequestMethod.GET)
	public String extaView(Extagram viewExta, Model model, HttpSession session, MultipartFile file) {
		
		if(viewExta.getExNo() < 1) {
			return "redirect:/extagram/list";
		}
		
		if( session.getAttribute("login") == null) {
			model.addAttribute("msg", "로그인 후 상세보기가 가능합니다.");
			model.addAttribute("url", "/extagram/list");
		}
		
		//첨부파일 정보
		FileUpload fileUpload = extaService.getAttachFile(viewExta);
		model.addAttribute("fileUpload", fileUpload);
		
		
		
		//좋아요 상태 조회
		ExLike heart = new ExLike();
		heart.setExPostNo(viewExta.getExNo()); //게시글 번호
		if( session.getAttribute("login") != null) {
			heart.setUserNo((Integer)session.getAttribute("userNo"));
		}
		
		//좋아요 상태 전달
		boolean isHearted = extaService.isHearted(heart);
		model.addAttribute("isHearted", isHearted);
		model.addAttribute("cntHeart", extaService.getTotalCntHeart(heart));

		
		model.addAttribute("viewExta",extaService.getExtaView(viewExta));
		
		return "/extagram/view";
	}

//COMMENT(ajax)
	@RequestMapping(value="/extagram/view_ok", method=RequestMethod.POST)
	public String extaComment(ExComm comment, Extagram viewExta, HttpSession session, Model model) {

		comment.setUserNo((Integer) session.getAttribute("userNo"));
		if( comment.getExComm() != "") {
			extaService.setComment(comment);
		}
		
		//댓글
		List<HashMap<String, Object>> commentList = extaService.getCommentList(viewExta);
		model.addAttribute("viewComm", commentList);
		
		return "/extagram/view_ok";
	}

//좋아요, 댓글 숫자 count
	@RequestMapping(value="/extagram/view_ok2", method=RequestMethod.GET)
	public String extaCommentCount(ExComm comment, Extagram viewExta, Model model) {
		
		Extagram viewExtagram = extaService.getInfoViewExta(comment);
		
		model.addAttribute("viewExta",extaService.getExtaView(viewExtagram));
		
		return "/extagram/view_ok2";
	}
	
//COMMENT DELETE
	@RequestMapping(value="/extagram/deleteComment")
	public String extaCommentDelete(ExComm comment) {
		
		ExComm comm = extaService.getInfoComment(comment);
		
		extaService.deleteComment(comm);
		
		return "redirect:/extagram/view?exNo=" + comm.getExPostNo();
	}
	
//HEART(ajax)
	@RequestMapping(value="/extagram/heart", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView extaHeart(int exNo, ExLike heart, Extagram viewExta, ModelAndView mav, HttpSession session ) {
		
		//좋아요 정보
		heart.setUserNo((Integer) session.getAttribute("userNo"));
		heart.setExPostNo(exNo);
		boolean result = extaService.getHeart(heart);
		
		//좋아요 수 조회
		int cnt = extaService.getTotalCntHeart(heart);
		
		mav.addObject("result", result);
		mav.addObject("cnt", cnt);
		
		return mav;
		
	}
	
	
//WRITE	
	@RequestMapping(value="/extagram/write", method=RequestMethod.GET)
	public String extaWrite(Extagram extagram, HttpSession session, Model model) {

		if( session.getAttribute("login") == null) {
			model.addAttribute("msg", "로그인 후 글 작성이 가능합니다.");
			model.addAttribute("url", "/extagram/list");
		}
		return "/extagram/write";
	}
	@RequestMapping(value="/extagram/write", method=RequestMethod.POST)
	public String extaWriteProc(Extagram extagram, HttpSession session, MultipartFile file) {
		
		extagram.setUserNo((Integer) session.getAttribute("userNo"));
		
		extaService.setExtaWrite(extagram, file);

		return "redirect:/extagram/list";
	}
	
//UPDATE
	@RequestMapping(value="/extagram/update", method=RequestMethod.GET)
	public String extaUpdate(Extagram viewExta, HttpSession session, Model model) {
		
		//첨부파일 정보
		FileUpload fileUpload = extaService.getAttachFile(viewExta);
		model.addAttribute("fileUpload", fileUpload);

		viewExta.setFileNo(fileUpload.getFileNo());
		logger.info("##viewExta 1: {}", viewExta);
		
		model.addAttribute("viewExta",extaService.getExtaView(viewExta));
		
		return "/extagram/update";
	}
	@RequestMapping(value="/extagram/update", method=RequestMethod.POST)
	public String extaUpdateProc(Extagram viewExta, MultipartFile file) {
		
		logger.info("##viewExta 2: {}", viewExta);
		logger.info("##file 2: {}", file);
		extaService.setExtaUpdate(viewExta, file);
		
		return "redirect:/extagram/view?exNo=" + viewExta.getExNo();
	}
	
	
	
//DELETE
	@RequestMapping(value="/extagram/delete")
	public String extaDelete(Extagram extagram, Model model) {
		
		extaService.deleteExta(extagram);
		
		return"redirect:/extagram/list";
	}
	
	
	
	
	
	
	
	
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
//	@RequestMapping(value="/extagram/report")
//	public void extaReport(Extagram extagram, Model model) {
//		
//	}
//	
//	@RequestMapping(value="/extagram")
//	public void commWrite(ExComm exComm) {
//		
//	}


	
	
	
	
	
}
