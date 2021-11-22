package web.dao.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.FileUpload;
import web.dto.Notice;
import web.util.PagingNotice;

public interface NoticeDao {

	/**
	 * 공지사항 전체 행 수 조회
	 * @param paging 
	 * @return
	 */
	public int selectCntAll(PagingNotice paging);

	/**
	 * 공지사항 전체 목록 조회
	 * @param paging
	 * @return
	 */
	public List<HashMap<String, Object>> selectNoticeAll(PagingNotice paging);

	/**
	 * 공지사항 작성 시 신규 파일 삽입
	 * @param file
	 */
	public void insertFile(FileUpload file);
	
	/**
	 * 신규 공지사항 작성
	 * @param notice
	 */
	public void insertNotice(Notice notice);
	
	/**
	 * 공지사항 상세 조회
	 * @param notice
	 */
	public HashMap<String, Object> selectNoticeByNoticeNo(Notice notice);
	
	/**
	 * 공지사항 수정 시 파일 수정
	 * @param file
	 */
	public void updateFile(FileUpload file);
	
	/**
	 * 공지사항 수정
	 * @param notice
	 */
	public void updateNoticeByNoticeNo(Notice notice);
	
	/**
	 * 공지사항 삭제
	 * @param notice
	 */
	public void DeleteNoticeByNoticeNo(Notice notice);

	/**
	 * 공지사항 내 파일 삭제
	 * @param notice
	 */
	public void DeleteFileByNoticeNo(Notice notice);
}
