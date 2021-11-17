package web.dao.face;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.fileupload.FileUpload;

import web.dto.ExComm;
import web.dto.Extagram;
import web.dto.User;

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
	public User selectUserByUserno(int userno);

	/**
	 * 회원 탈퇴 요청
	 * @param userno - 탈퇴할 회원 번호 
	 */
	public void deleteUserByUserno(int userno);

	/**
	 * 회원의 Extagram 기록 조회
	 * @param userNo - 조회할 회원 번호
	 * @return - 조회된 리스트 반환
	 */
	public List<Extagram> selectExtraByUserNo(int userNo);

	/**
	 * 회원의 Extagram 기록 검색
	 * @param map - 검색할 조건
	 * @return - 조회된 리스트 반환
	 */
	public List<Extagram> selectSearchExtaByUserNo(HashMap<String, Object> map);

	/**
	 * 회원의 댓글 기록 조회
	 * @param userNo - 조회할 회원 번호
	 * @return - 조회된 리스트 반환
	 */
	public List<ExComm> selectCommentByUserNo(int userNo);

	/**
	 * 회원의 댓글 기록 검색
	 * @param map - 검색할 조건
	 * @return - 조회된 리스트 반환
	 */
	public List<ExComm> selectCommentByUserNo(HashMap<String, Object> map);

	/**
	 * 회원의 프로필 사진 정보 조회
	 * @param user - 조회할 회원 정보
	 * @return - 조회된 파일 정보 반환
	 */
	public FileUpload selectFileByUserNo(User user);
}
