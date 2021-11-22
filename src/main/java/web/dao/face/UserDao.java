package web.dao.face;

import web.dto.FileUpload;
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
	 * 
	 * @param user
	 * @return
	 */
	public int selectCntByUser(User user);
}
