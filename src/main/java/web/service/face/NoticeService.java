package web.service.face;

import java.util.List;

import web.dto.Notice;
import web.util.Paging;

public interface NoticeService {

	/**
	 * 
	 * @param paramData
	 * @return
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 모든 Notice를 조회하여 List로 반환한다. 
	 * @param paging
	 * @return
	 */
	public List<Notice> getNoticeList(Paging paging);

	/**
	 * Notice를 작성한다.
	 * @param notice
	 */
	public void setNoticeWrite(Notice notice);

	/**
	 * Notice를 조회한다.
	 * @param notice
	 * @return
	 */
	public Notice getNoticeView(Notice notice);

	/**
	 * Notice를 수정한다.
	 * @param notice
	 */
	public void setNoticeUpdate(Notice notice);

	/**
	 * Notice를 삭제한다.
	 * @param notice
	 */
	public void setNoticeDelete(Notice notice);

	
}
