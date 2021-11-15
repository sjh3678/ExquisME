package web.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import web.dao.face.FaqDao;
import web.dto.Faq;
import web.service.face.FaqService;

@Service
public class FaqServiceImpl implements FaqService {
	
	@Autowired FaqDao faqDao;
	
	@Override
	public List<Faq> getFaqList() {
		return faqDao.selectFaqAll();
	}
	
	@Override
	public void setFaqWrite(Faq faq) {
		faqDao.insertFaq(faq);
	}
	
	@Override
	public void setFaqUpdate(Faq faq) {
		faqDao.updateFaqByFaqNo(faq);
	}
	
	@Override
	public void setFaqDelete(Faq faq) {
		faqDao.deleteFaqByFaqNo(faq);
	}
	
	@Override
	public int getFaqCnt() {
		return faqDao.selectCntAll();
	}
	
	@Override
	public Faq getFaqView(Faq faq) {
		return faqDao.selectFaqByFaqNo(faq);
	}
}
