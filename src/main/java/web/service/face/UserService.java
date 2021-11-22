package web.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.ExComm;
import web.dto.Extagram;
import web.dto.FileUpload;
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
	 * 회원 탈퇴
	 * @param userno - 탈퇴할 유저 번호
	 * @return 
	 */
	public boolean deleteUser(int userno);

	/**
	 * 비밀번호 인증
	 * @param salt - 인증 비밀번호 해시값
	 * @param userno - 인증할 회원 번호
	 * @return - 인증 결과 반환
	 */
	public boolean getCheckPassword(String pw, int userNo);

	/**
	 * 유저 세부정보 조회
	 * @param user - 조회할 유저의 정보
	 * @return - 조회결과 반환
	 */
	public User getUserInfo(User user);

	/**
	 * 유저 번호를 사용하여 유저의 닉네임 반환
	 * @param user - 유저 정보 DTO
	 * @return - 조회결과 반환
	 */
	public User getUserNickByUserno(User user);

	/**
	 * 유저 아이디 중복검사 요청
	 * @param user - 검사할 입력값
	 * @return - 중복 여부 반환
	 */
	public boolean searchId(User user);

	/**
	 * 유저 이메일 중복검사 요청
	 * @param user - 검사할 입력값
	 * @return - 중복 여부 반환
	 */
	public boolean searchEmail(User user);

	/**
	 * 유저 닉네임 중복검사 요청
	 * @param user - 검사할 입력값
	 * @return - 중복 여부 반환
	 */
	public boolean searchNick(User user);

	/**
	 * 프로필 사진의 정보를 요청
	 * @param user - 정보를 요청할 DTO 객체
	 * @return - 조회된 파일 정보 반환
	 */
	public FileUpload getFileInfo(User user);

	/**
	 * 회원의 프로필 정보 조회
	 * @param user - 조회할 유저 번호
	 * @return - 조회된 정보 반환
	 */
	public User getUserProfile(User user);
	
	/**
	 * 비밀번호 변경
 	 * @param pwChk - 암호 확인
	 * @param user - 변경할 회원의 정보
	 * @return - 변경 결과 반환
	 */
	public boolean setUpdatePw(User user, String pwChk);

	/**
	 * 프로필 파일 업데이트
	 * @param user - 회원 정보
	 * @param fileUpload - 파일 정보
	 * @return - 파일 정보 반환
	 */
	public FileUpload updateProfileFile(User user, MultipartFile fileUpload);

	/**
	 * 회원 정보 모두 수정(프로필 X)
	 * @param user - 수정할 회원정보
	 * @param file
	 * @return
	 */
	public boolean updateUserInfo(User user);

	/**
	 * 이메일을 통한 아이디 유무 요청
	 * @param user - 요청할 유저 정보
	 * @return - 조회된 유저 정보 반환
	 */
	public User getUserInfoByEmail(User user);

}
