package web.dao.face;

import java.util.HashMap;
import java.util.List;

import web.dto.ExComm;
import web.dto.ExLike;
import web.dto.Extagram;
import web.util.Paging;

public interface ExtaDao {

	
//LIST	
	/**
	 * 페이징을 적용하여 DB의 게시글 목록 조회
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<HashMap<String, Object>> selectExtaAll(Paging paging);
	
	/**
	 * 전체 Extagram 수를 조회
	 * @return 총 게시글 수
	 */
	public int selectExtaCntAll(Paging paramData);

//VIEW
	/**
	 * Extagram 상세보기
	 * @param extagram - 상세보기할 게시글의 DTO
	 * @return 
	 */
	public HashMap<String, Object> selectExtaView(Extagram viewExta);

	/**
	 * 게시글 상세보기의 댓글 목록 불러오기
	 * @param viewExta - 댓글을 불러올 게시글 번호
	 * @return - 댓글LIST
	 */
	public List<HashMap<String, Object>> selectExtaComment(Extagram viewExta);
	
	/**
	 * 신규 댓글 삽입
	 * @param comm - 삽입하려는 댓글 정보
	 * @return 
	 */
	public void insertComment(ExComm comm);
//WRITE	
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
