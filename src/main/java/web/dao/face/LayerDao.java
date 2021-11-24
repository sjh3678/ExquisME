package web.dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import web.dto.Layer;
import web.dto.LayerLike;
import web.util.PagingLayer;
import web.util.PagingLayerWrite;

public interface LayerDao {

	/**
	 * 최신,좋아요순 레이어드 조회
	 * 
	 * @param model - 선택한 정렬 방법
	 * @return - List<Layer> 선택한 정렬 방법으로 조회한 레이어드 리스트
	 */
	public List<HashMap<String, Object>> selectLayerListByTarget(Map<String, Object> map);


	/**
	 * userNo로 등록된 좋아요 조회
	 * 	 
	 * @param lLike 좋아요 유무를 조회할 회원번호
	 * @return int 좋아요 유무
	 */
	public int selectLayerLikeCntByuserNo(LayerLike lLike);
	
	/**
	 * userNo로 레이어드좋아요 등록
	 * 
	 * @param lLike 좋아요 등록한 회원 번호
	 */
	public void insertLayerLikeByuserNo(LayerLike lLike);
	
	/**
	 * userNo로 레이어드좋아요 삭제
	 * 
	 * @param lLike 좋아요 삭제한 회원 번호
	 */
	public void deleteLayerLikeByuserNo(LayerLike lLike);

	/**
	 * model로 전달된 정보로 레이어드 등록
	 * 
	 * @param layer - 등록될 레이어드 정보
	 */
	public void insertLayerByUserNo(Layer layer);

	public int selectLayerCntAll();

	public int selectCntPerfAll(PagingLayerWrite paramData);

	public List<HashMap<String, Object>> selectPerfAll(PagingLayerWrite paging);


	public void deleteLayerLike(LayerLike lLike);


	public HashMap<String, Object> selectLayerLikeInfo(LayerLike lLike);


	public void insertLayerLike(LayerLike lLike);





	
}
