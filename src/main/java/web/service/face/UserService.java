package web.service.face;

import web.dto.ExComm;
import web.dto.Extagram;
import web.dto.User;

public interface UserService {

	/**
	 * 로그인 확인
	 * @param user - 확인할 유저 정보
	 * @return - 확인 결과 반환
	 */
	public boolean getLoginCheck(User user);

	/**
	 * 회원가입 확인
	 * @param user - 확인할 유저 정보
	 * @return - 확인 결과 반환
	 */
	public boolean getJoinCheck(User user);

	/**
	 * 비밀번호 변경
	 * @param pw - 변경할 암호화 솔트값
 	 * @param pwChk - 암호 확인 솔트값
	 * @param userno - 변경할 회원의 번호
	 * @return - 변경 결과 반환
	 */
	public boolean setUpdatePw(String pw, String pwChk, int userno);

	/**
	 * 회원 탈퇴
	 * @param userno - 탈퇴할 유저 번호
	 */
	public void deleteUser(int userno);

	/**
	 * 비밀번호 인증
	 * @param salt - 인증 비밀번호 솔트값
	 * @param userno - 인증할 회원 번호
	 * @return - 인증 결과 반환
	 */
	public boolean getCheckPassword(String salt, int userno);

	/**
	 * 유저 세부정보 조회
	 * @param user - 조회할 유저의 정보
	 * @return - 조회결과 반환
	 */
	public User getUserInfo(User user);

	public Extagram getExtaHistory(int userNo);

	public Extagram searchExtaHistory(String search, int userNo);

	public ExComm getHistory(int userNo);

	public ExComm searchCommentHistory(String search, int userNo);

}
