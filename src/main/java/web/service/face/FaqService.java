package web.service.face;

import java.util.List;

import org.springframework.ui.Model;

import web.dto.Faq;

public interface FaqService {

	/**
	 * 전체 자주묻는문의 조회
	 * @param model
	 * @return
	 */
	public List<Faq> getFaqList();

	/**
	 * 자주묻는문의 작성
	 * @param faq
	 */
	public void setFaqWrite(Faq faq);
	
	/**
	 * 자주묻는문의 수정
	 * @param faq
	 */
	public void setFaqUpdate(Faq faq);
	
	/**
	 * 자주묻는문의 삭제
	 * @param faq
	 */
	public void setFaqDelete(Faq faq);
	
}
