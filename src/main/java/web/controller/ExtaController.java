package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import web.dto.ExComm;
import web.dto.Extagram;
import web.service.face.ExtaService;
import web.util.Paging;

public class ExtaController {
	
	@Autowired ExtaService extaService;
	
	private static final Logger logger = LoggerFactory.getLogger(ExtaController.class);

	
	
	
	@RequestMapping(value="/extagram/list")
	public void extaList(Paging paramData, Model model) {
		
	}
	
	@RequestMapping(value="/extagram/write", method=RequestMethod.GET)
	public String extaWrite(Extagram extagram, HttpSession session) {
		return null;
	}
	
	@RequestMapping(value="/extagram/write", method=RequestMethod.POST)
	public String extaWriteProc(Extagram extagram, HttpSession session, MultipartFile file) {
		return null;		
	}
	
	@RequestMapping(value="/extagram/update", method=RequestMethod.GET)
	public void extaUpdate(Extagram extagram) {
		
	}
	
	@RequestMapping(value="/extagram/update", method=RequestMethod.POST)
	public void extaUpdateProc(Extagram extagram) {
		
	}
	
	@RequestMapping(value="/extagram/delete")
	public String extaDelete(Extagram extagram) {
		return null;
	}
	
	@RequestMapping(value="/extagram/view")
	public void extaView(Extagram extagram, Model model) {
		
	}
	
	@RequestMapping(value="/extagram/report")
	public void extaReport(Extagram extagram, Model model) {
		
	}
	
	@RequestMapping(value="/extagram/heart")
	public void heart(ExLike exLike, HttpSession session) {
		
	}
	
	@RequestMapping(value="/extagram/heart_delete")
	public void heartDelete(ExLike exLike, HttpSession session) {
		
	}
	
	@RequestMapping(value="/extagram")
	public void commWrite(ExComm exComm) {
		
	}
	
	@RequestMapping(value="/extagram")
	public void commWriteProc(ExComm exComm) {
		
	}
	
	@RequestMapping(value="/extagram")
	public void commDelete(ExComm exComm) {
		
	}

	
	
	
	
	
}
