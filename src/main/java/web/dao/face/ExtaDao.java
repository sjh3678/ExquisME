package web.dao.face;

import java.util.HashMap;
import java.util.List;

import web.dto.ExComm;
import web.dto.ExLike;
import web.dto.Extagram;
import web.dto.FileUpload;
import web.dto.Report;
import web.util.Paging;
import web.util.PagingExtagram;

public interface ExtaDao {

	
//LIST	
	/**
	 * 페이징을 적용하여 DB의 게시글 목록 조회
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<HashMap<String, Object>> selectExtaAll(PagingExtagram paging);
	
	/**
	 * 전체 Extagram 수를 조회
	 * @return 총 게시글 수
	 */
	public int selectExtaCntAll(PagingExtagram paramData);

//VIEW
	/**
	 * Extagram 상세보기
	 * @param extagram, excomm - 상세보기할 게시글의 DTO
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

	
	/**
	 * comment의 exCommNo를 이용하여 나머지 DTO의 값을 불러옴
	 * @param comment
	 * @return 
	 */
	public ExComm selectInfoComment(ExComm comment);
	public Extagram selectInfoViewExta(ExComm comment);

	/**
	 * 댓글 수 구하기
	 * @param comment - 게시글에 작성된 댓글 개수 구하기
	 * @return 댓글 개수
	 */
	public int countComment(ExComm comment);
	
	/**
	 * 사용자가 해당 게시글을 좋아요 누른적이 있는지 조회
	 * @param heart - 사용자와 게시글 정보를 가지고 있는 객체
	 * @return 1 - 좋아요 누른적 있음, 0 - 좋아요 누른적 없음
	 */
	public int selectCntHeart(ExLike heart);

	/**
	 * 좋아요 상태 넣기
	 * @param heart - 좋아요 정보 객체
	 */
	public void insertHeart(ExLike heart);

	/**
	 * 사용자의 최근 작성 5개 글 rownum 기준으로 조회
	 * @param view - userNo
	 * @return 리스트 반환
	 */
	public List<HashMap<String, Object>> selectUserResentWrite(HashMap<String, Object> view);
	
	/**
	 * 게시글 전체 추천 수 조회
	 * @param heart - 좋아요 수를 조회할 게시글 정보
	 * @return 전체 좋아요 수
	 */
	public int selectTotalCntHeart(ExLike heart);

	
//WRITE
	/**
	 * 첨부파일 정보를 삽입
	 * @param fileUpload - 삽입할 첨부파일 DTO
	 */
	public void insertFile(FileUpload fileUpload);

	/**
	 * 작성한 Extagram DB에 삽입
	 * @param extagram - 작성할 게시글의 DTO
	 */
	public void insertExtaWrite(Extagram extagram);

	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * @param viewExta - 조회할 파일 번호
	 * @return 조회된 첨부파일 정보
	 */
	public FileUpload selectFileUploadByExNo(Extagram viewExta);
	

//UPDATE
	
	/**
	 * Extagram 수정시에 파일 수정
	 * @param fileUpload
	 */
	public void updateExtaFile(FileUpload fileUpload);
	
	/**
	 * Extagram 수정
	 * @param viewExta
	 */
	public void updateExta(Extagram viewExta);
	
	
//DELETE 영역
	/**
	 * commNo에 해당하는 댓글 데이터 삭제
	 * @param comment - exCommNo
	 */
	public void deleteComment(ExComm comment);
	
	/**
	 * exNo에 해당하는 댓글 데이터 삭제
	 * @param extagram
	 */
	public void deleteCommentByExNo(Extagram extagram);
	
	/**
	 * ExLikeNo 값을 이용하여 좋아요 상태 지우기
	 * @param heart - 좋아요 정보 객체
	 */
	public void deleteHeart(ExLike heart);
	
	/**
	 * ExNo를 이용하여 좋아요 상태 전부 지우기
	 * @param extagram
	 */
	public void deleteHeartByExNo(Extagram extagram);
	

	/**
	 * 첨부파일 삭제
	 * @param extagram - 첨부파일을 삭제할 게시글 DTO
	 */
	public void deleteFile(Extagram extagram);
	
	/**
	 * DB에서 Extagram 삭제
	 * @param extagram - 삭제할 게시글의 DTO
	 */
	public void deleteExta(Extagram extagram);
	
	
//REPORT 영역
	/**
	 * 리포트 페이지의 select option에 불러올 댓글 목록
	 * @param viewExta - exNo 게시글 번호
	 * @return - exNo에 해당하는 댓글 목록
	 */
	public HashMap<String, Object> selectCommentListForReport(Extagram viewExta);

	/**
	 * 리포트 내용 전송
	 * @param report - 리포트 내용
	 */
	public void insertExtaReport(Report report);

	/**
	 * 피신고자 닉네임으로 userNo 구함
	 * @param defendantNick - 닉네임
	 * @return userNo
	 */
	public int selectUserNoByNick(String defendantNick);

//ADMIN REPORT	
	/**
	 * 접수된 신고글 리스트
	 * @param report - 신고가 된 extagram의 게시글번호
	 * @return 목록
	 */
	public List<HashMap<String, Object>> selectReportList(Paging paging);
	public int selectCntAll(Paging paramData);

	




	





	




	
}
