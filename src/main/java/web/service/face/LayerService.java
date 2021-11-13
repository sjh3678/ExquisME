package web.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import web.dto.Layer;
import web.util.Paging;
import web.util.PagingLayer;
import web.util.PagingLayerWrite;

public interface LayerService {

	/**
	 * 페이징을 전달하여
	 * 레이어드 리스트 조회
	 * 
	 * @param model - 카테고리 종류 객체
	 * @param paging - 페이징 객체 
	 * @return 
	 */
	public List<HashMap<String, Object>> getList(Model model, PagingLayer paging);

	/**
	 * 전달받은 userNo로 등록된 레이어링 조회 
	 * 
	 * @param model 조회할 레이어링 작성자 번호
	 * @return - 조회한 레이어링 정보
	 */
	public HashMap<String, Object> getView(Model model);

	/**
	 * userNo로 좋아요 유무 조회
	 * 
	 * @param userNo - 조회할 좋아요 등록자 번호
	 * @return - 조회한 좋아요 행 수
	 */
	public int getCntLike(int userNo);

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

}
