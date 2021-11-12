package web.dao.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import web.dto.Layer;
import web.dto.LayerLike;
import web.util.Paging;
import web.util.PagingLayer;

public interface LayerDao {

	/**
	 * 최신,좋아요순 레이어드 조회
	 * 
	 * @param model - 선택한 정렬 방법
	 * @return - List<Layer> 선택한 정렬 방법으로 조회한 레이어드 리스트
	 */
	public List<HashMap<String, Object>> selectLayerListByTarget(PagingLayer paging);

	/**
	 * userNo로 레이어드 상세정보 조회
	 * 
	 * @param userNo - 상세정보를 조회 할 회원번호
	 * @return Layer 상세정보 객체 반환
	 */
	public Layer selectLayerViewByuserNo(int userNo);

	/**
	 * userNo로 등록된 좋아요 조회
	 * 	 
	 * @param userNo 좋아요 유무를 조회할 회원번호
	 * @return int 좋아요 유무
	 */
	public int selectLayerLikeCntByuserNo(int userNo);
	
	/**
	 * userNo로 레이어드좋아요 등록
	 * 
	 * @param userNo 좋아요 등록한 회원 번호
	 */
	public void insertLayerLikeByuserNo(int userNo);
	
	/**
	 * userNo로 레이어드좋아요 삭제
	 * 
	 * @param userNo 좋아요 삭제한 회원 번호
	 */
	public void deleteLayerLikeByuserNo(int userNo);

	/**
	 * model로 전달된 정보로 레이어드 등록
	 * 
	 * @param model - 등록될 레이어드 정보
	 */
	public void insertLayerByUserNo(Model model);

	public int selectLayerCntAll();


	
}
