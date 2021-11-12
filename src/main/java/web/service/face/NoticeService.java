package web.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Notice;
import web.util.PagingNotice;

public interface NoticeService {

	/**
	 * 
	 * @param req
	 * @return
	 */
	public PagingNotice getPaging(HttpServletRequest req);

	/**
	 * 모든 Notice를 조회하여 List로 반환한다. 
	 * @param paging
	 * @return
	 */
	public List<HashMap<String, Object>> getNoticeList(PagingNotice paging);

	/**
	 * Notice를 작성한다.
	 * @param notice
	 */
	public void setNoticeWrite(Notice notice, MultipartFile file);

	/**
	 * Notice를 조회한다.
	 * @param notice
	 * @return
	 */
	public HashMap<String, Object> getNoticeView(Notice notice);

	/**
	 * Notice를 수정한다.
	 * @param notice
	 * @param file 
	 */
	public void setNoticeUpdate(Notice notice, MultipartFile file);

	/**
	 * Notice를 삭제한다.
	 * @param notice
	 */
	public void setNoticeDelete(Notice notice);

	/**
	 * Notice에 연결된 파일을 삭제한다.
	 * @param notice
	 */
	public void setFileDelete(Notice notice);

	
}
