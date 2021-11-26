package web.dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import web.dto.Extagram;
import web.dto.FileUpload;
import web.dto.Report;
import web.dto.User;
import web.util.PagingExtagram;
import web.util.PagingUser;

public interface UserDao {

	/**
	 * 검색 조건으로 맞는 아이디가 있으면 카운트 값 반환
	 * @param param - 조회할 회원의 정보
	 * @return - 조회된 회원의 총 수를 반환(유니크 값이기에 1 또는 0)
	 */
	public int selectUserCnt(User param);

	/**
	 * id를 검색조건으로 회원정보 조회
	 * @param param - 조회할 회원의 정보
	 * @return - 조회된 회원의 세부정보 반환
	 */
	public User selectUserById(User user);

	/**
	 * 회원가입 DB 처리
	 * @param param - 가입할 회원의 정보
	 */
	public void insertUserJoin(User param);

	/**
	 * 비밀번호 변경
	 * @param user - 변경할 회원 정보
	 */
	public void updatePw(User user);

	/**
	 * 회원 번호로 회원 정보 조회
	 * @param user - 조회할 회원 번호
	 * @return - 조회된 세부정보 반환
	 */
	public User selectUserByUserno(int userNo);

	/**
	 * 회원 탈퇴 요청
	 * @param userno - 탈퇴할 회원 번호 
	 */
	public void deleteUserByUserno(int userNo);

	/**
	 * 회원의 프로필 사진 정보 조회
	 * @param fileNo - 조회할 파일 정보
	 * @return - 조회된 파일 정보 반환
	 */
	public FileUpload selectFileByFileNo(int fileNo);

	/**
	 * 새 프로필 사진 업로드
	 * @param file - 파일 정보 객체
	 */
	public void insertFile(FileUpload file);
	
	/**
	 * 이전 프로필 사진 삭제
	 * @param user - 삭제할 유저의 정보
	 */
	public void deleteFileByFileNo(User user);

	/**
	 * 파일이 존재하는지 여부를 숫자로 반환
	 * @param user - 삭제 성공 여부
	 * 1 - 삭제 안됨
	 * 0 - 삭제 완료
	 * @return - 1 or 0 반환
	 */
	public int selectFileCntByFileNo(User user);

	/**
	 * 회원 정보 업데이트
	 * @param user - 수정할 회원 정보
	 */
	public void updateUserInfo(User user);

	/**
	 * 이메일을 통해 유저의 유무를 조회
	 * @param user - 조회할 유저의 정보
	 * @return - 조회된 숫자 반환
	 */
	public int selectCntByEmail(User user);

	/**
	 * 이메일과 아이디 대조로 유저의 유무를 조회
	 * @param user - 조회할 유저의 정보
	 * @return - 조회된 숫자 반환
	 */
	public int selectCntByEmail2(User user);
	/**
	 * 이메일을 통해 유저의 정보를 조회
	 * @param user - 조회할 유저의 정보
	 * @return - 조회할 숫자 반환
	 */
	public User selectUserByEmail(User user);

	/**
	 * 유저가 쓴 게시글의 모든 수를 조회
	 * @param map - 페이징 정보 객체 + 유저 정보 객체
	 * @return - 조회된 게시글 수 반환
	 */
	public int selectExtaCntByUserNo(HashMap<String, Object> map);

	/**
	 * 유저의 extagram 기록 조회
	 * @param map - 조회할 유저 정보 및 페이징 정보
	 * @return - 조회된 리스트 반환
	 */
	public List<Map<String, Object>> selectExtaHistoryByUserNo(HashMap<String, Object> map);

	/**
	 * 유저가 쓴 댓글의 모든 수를 조회
	 * @param map - 페이징 정보 객체 + 유저 정보 객체
	 * @return - 조회된 댓글 수 반환
	 */
	public int selectCommCntByUserNo(HashMap<String, Object> map);

	/**
	 * 유저의 댓글 기록 조회
	 * @param map - 조회할 유저 정보 및 페이징 정보
	 * @return - 조회된 리스트 반환
	 */
	public List<Map<String, Object>> selectCommHistoryByUserNo(HashMap<String, Object> map);

	/**
	 * 조회할 회원 리스트 갯수
	 * 
	 * @param paramData - 회원 페이징 객체
	 * @return - 조회된 리스트 반환
	 */
	public int selectCntUserAll(PagingUser paramData);

	/**
	 * 조회된 회원 리스트 (페이징 적용, 검색 적용)
	 * 
	 * @param pagingUser - 페이징 객체 
	 * @return - 조회된 리스트 반환 
	 */
	public List<HashMap<String, Object>> selectUserAll(PagingUser pagingUser);

	/**
	 * 회원의 댓글 내역 전체를 삭제
	 * @param userNo - 삭제할 회원정보
	 */
	public void deleteCommByUserNo(int userNo);

	/**
	 * 회원의 extagram 내역 전체를 삭제
	 * @param userNo - 삭제할 회원 정보
	 */
	public void deleteExtaByUserNo(int userNo);

	/**
	 * 회원의 extagram 좋아요 내역 삭제
	 * @param userNo - 삭제할 회원 정보
	 */
	public void deleteExtaLikeUserNo(int userNo);

	/**
	 * 레이어링 좋아요 내역 삭제
	 * @param userNo - 삭제할 유저 정보
	 */
	public void deleteLayerLikeByUserNo(int userNo);

	/**
	 * 레이어링 삭제
	 * @param userNo - 삭제할 유저 정보
	 */
	public void deleteLayerByUserNo(int userNo);

	/**
	 * 노트 좋아요 삭제
	 * @param userNo - 삭제할 유저 정보
	 */
	public void deleteNoteLikeByUserNo(int userNo);

	/**
	 * 문의 정보 삭제
	 * @param userNo - 삭제할 유저 정보
	 */
	public void deleteFaqByUserNo(int userNo);

	/**
	 * 공지사항 삭제
	 * @param userNo - 삭제할 유저 정보
	 */
	public void deleteNoticeByUserNo(int userNo);

	/**
	 * 향수 좋아요 삭제
	 * @param userNo - 삭제할 유저 정보
	 */
	public void deletePerfLikeByUserNo(int userNo);

	/**
	 * 유저의 제재유무 조회
	 * @param user - 조회할 유저 정보
	 * @return - 조회된 수 반환
	 */
	public int selectReportCntByUserNo(User user);

	/**
	 * 유저의 제재 결과 조회
	 * @param user - 조회할 유저 정보
	 * @return - 조회된 결과 리스트 반환
	 */
	public List<Report> selectReportByUserNo(User user);
}
