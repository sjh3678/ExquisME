package web.dao.face;

import java.util.List;

import web.dto.ExComm;
import web.dto.ExLike;
import web.dto.Extagram;
import web.util.Paging;

public interface ExtaDao {

	/**
	 * 페이징을 적용하여 DB의 게시글 목록 조회
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Extagram> selectExtaAll(Paging paging);
	
	/**
	 * 전체 Extagram 수를 조회
	 * @return 총 게시글 수
	 */
	public int selectExtaCntAll();
	
	/**
	 * 작성한 Extagram DB에 삽입
	 * @param extagram - 작성할 게시글의 DTO
	 */
	public void insertExtaWrite(Extagram extagram);
	
	/**
	 * 수정할 Extagram DB에서 조회
	 * @param extagram - 수정할 게시글의 DTO
	 */
	public void updateExtaByExPostNo(Extagram extagram);
	
	/**
	 * DB에서 Extagram 삭제
	 * @param extagram - 삭제할 게시글의 DTO
	 */
	public void deleteExtaByExPostNo(Extagram extagram);
	
	/**
	 * Extagram 상세보기
	 * @param extagram - 상세보기할 게시글의 DTO
	 */
	public void selectExtaViewByExPostNo(Extagram extagram);
	
	/**
	 * 조회수 증가
	 * @param extagram 상세보기를 할 경우 조회수 증가
	 */
	public void updateHit(Extagram extagram);
	
	/**
	 * 신고하는 Extagram글을 신고DTO에 삽입
	 * @param extagram - 신고할 게시글
	 */
	public void insertExtaReportByExPostNo(Extagram extagram);
	
	/**
	 * 좋아요 정보 DB삽입
	 * @param exLike
	 */
	public void insertExtaHeart(ExLike exLike);
	
	/**
	 * 좋아요 정보 DB삭제
	 * @param exLike
	 */
	public void deleteExtaHeart(ExLike exLike);
	
	/**
	 * 작성된 댓글 DB에 삽입
	 * @param exComm
	 */
	public void insertExtaComm(ExComm exComm);
	
	/**
	 * 작성된 댓글 DB에서 삭제
	 * @param exComm
	 */
	public void deleteExtaComm(ExComm exComm);
	
}
