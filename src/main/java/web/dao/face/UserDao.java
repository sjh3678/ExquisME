package web.dao.face;

import web.dto.User;

public interface UserDao {

	public int selectCntById(User param);

	public User selectById(User param);

	public void insertUserJoin(User param);


}
