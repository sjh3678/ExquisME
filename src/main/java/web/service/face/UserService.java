package web.service.face;

import web.dto.User;

public interface UserService {

	public boolean getLoginChk(User user);

	public boolean getJoinChk(User user);

	public boolean setChangePw(String pw, String pwChk);

	public boolean deleteUser(int userno);

	public boolean getCheckPassword(String pw);

}
