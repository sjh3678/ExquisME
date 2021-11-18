package web.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import web.dto.LayerLike;
import web.util.PagingLayer;
import web.util.PagingLayerWrite;

public interface LayerService {

	/**
	 * 페이징을 전달하여
	 * 레이어드 리스트 조회
	 * 
	 * @param userNo - 카테고리 종류 객체
	 * @param paging - 페이징 객체 
	 * @param model 
	 * @return 
	 */
	public List<HashMap<String, Object>> getList(int userNo, PagingLayer paging);

	/**
	 * userNo로 좋아요 유무 조회
	 * 
	 * @param lLike 
	 * @return - 조회한 좋아요 행 수
	 */
	public int getCntLike(LayerLike lLike);

	/**
	 * 게시글 등록
	 * 
	 * 
	 * @param model
	 */
	public void setLayer(HttpSession session,Model model);

	/**
	 * paramData 로 페이징 처리
	 * 
	 * @param paramData
	 * @return
	 */
	public PagingLayer getLayerPaging(PagingLayer paramData);

	/**
	 * paging 으로 향수 페이징 처리
	 * 
	 * @param paging - 페이징 처리될 객체
	 * @return paging처리된 향수 리스트
	 */
	public List<HashMap<String, Object>> getPerfImageList(PagingLayer paging);

	/**
	 * 레이어드 작성 페이지 향수 목록 페이징
	 * 
	 * @param paramData - 페이징 객체
	 * @return Paging 반환
	 */
	public PagingLayerWrite getPaging(PagingLayerWrite paramData);

	/**
	 * paging 처리된 향수 목록 조회
	 * 
	 * @param paging - 페이징 객체
	 * @return List<HashMap<String, Object>> 조회된 목록 반환
	 */
	public List<HashMap<String, Object>> getPerfList(PagingLayerWrite paging);
	
	/**
	 * like로 좋아요 테이블 조회 후 조회된 값이 있다면 delete
	 * 없다면 insert한다
	 * 
	 * @param cnt - 좋아요 작성 유무
	 * @param lLike - 좋아요를 등록, 삭제할 회원 번호와 레이어링 번호
	 * @return - 자신의 좋아요 등록 결과 반환
	 */
	public HashMap<String, Object> setLayerLike(int cnt, LayerLike lLike);


}
