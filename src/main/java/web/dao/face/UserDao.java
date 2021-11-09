package web.dao.face;

import java.util.HashMap;

import web.dto.ExComm;
import web.dto.Extragram;
import web.dto.User;

public interface UserDao {

	/**
	 * id를 검색 조건으로 맞는 아이디가 있으면 카운트 값 반환
	 * @param param - 조회할 회원의 정보
	 * @return - 조회된 회원의 총 수를 반환(유니크 값이기에 1 또는 0)
	 */
	public int selectUserCntById(User param);

	/**
	 * id를 검색조건으로 회원정보 조회
	 * @param param - 조회할 회원의 정보
	 * @return - 조회된 회원의 세부정보 반환
	 */
	public User selectUserById(User param);

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
	 * @param userno - 조회할 회원 번호
	 * @return - 조회된 세부정보 반환
	 */
	public User selectUserByUserno(int userno);

	public void deleteUserByUserno(int userno);

	public Extragram selectExtraByUserNo(int userNo);

	public Extragram selectSearchExtraByUserNo(HashMap<String, Object> map);

	public ExComm selectCommentByUserNo(int userNo);

	public Extragram selectCommentByUserNo(HashMap<String, Object> map);


}
