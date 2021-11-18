package web.dao.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.Perf;
import web.dto.PerfLike;
import web.util.PagingPerf;

public interface PerfDao {

	/**
	 * 향수 전체 수 가져오기
	 * 
	 * @return
	 */
	public int selectCntPerfAll( PagingPerf paramData);
	
	/**
	 * 향수 전체 리스트 가져오기
	 * 
	 * @param paing
	 * @return
	 */
	public List<HashMap<String, Object>> selectPerfAll(PagingPerf pagingPerf);
	
	/**
	 * 필터링 정보로 향수리스트 가져오기
	 * 
	 * @param paging
	 * @param req
	 * @return
	 */
	public List<Perf>  selectPerfByFilter(PagingPerf pagingPerf, HttpServletRequest req);
	
	/**
	 * 검색 키워드로 향수리스트 가져오기
	 * 
	 * @param paging
	 * @param req
	 * @return
	 */
	public List<Perf> selectListByKeyword(PagingPerf pagingPerf, String search);
	
	/**
	 * 상세보기시 향수번호로 향수하나의 객체 가져오기
	 * 
	 * @param perf
	 * @return
	 */
	public HashMap<String, Object> selectPerfByPerfNo(Perf perf);
	
	/**
	 * 향수 정보 좋아요 업데이트하기
	 * 
	 * @param perf
	 * @return
	 */
	public boolean updatePerfLike(Perf perf);
	
	/**
	 * 향수 정보 싫어요 업데이트하기
	 *
	 * @param perf
	 * @return
	 */
	public boolean updatePerfDislike(Perf perf);
	
	/**
	 * 향수 정보 수정(업데이트)하기
	 * 
	 * @param perf
	 * @param req
	 */
	public void updatePerf(Perf perf, HttpServletRequest req);
	
	/**
	 * 향수 정보 삭제하기
	 * 
	 * @param perf
	 */
	public void deletePerf(Perf perf);
	
	/**
	 * 향수 정보 삽입(추가등록)하기
	 * 
	 * @param req
	 */
	public void insertPerf(HttpServletRequest req);

	/**
	 * 상세보기시 향수의 topnote 정보 조회
	 * 
	 * @param perf
	 * @return
	 */
	public List<HashMap<String, Object>> selectTopNoteByPerfNo(Perf perf);

	/**
	 * 상세보기시 향수의 middlenote 정보 조회
	 * 
	 * @param perf
	 * @return
	 */
	public List<HashMap<String, Object>> selectMiddleNoteByPerfNo(Perf perf);

	/**
	 * 상세보기시 향수의 basenote 정보 조회
	 * 
	 * @param perf
	 * @return
	 */
	public List<HashMap<String, Object>> selectBaseNoteByPerfNo(Perf perf);

	/**
	 * 상세보기시 향수의 mainaccord 정보 조회
	 * 
	 * @param perf
	 * @return
	 */
	public List<HashMap<String, Object>> selectMainAccordByPerfNo(Perf perf);

	/**
	 * 상세보기시 향수의 좋아요 정보 조회
	 * 
	 * @param perfNo
	 * @return
	 */
	public HashMap<String, Object> selectPerfLikeByPerfNo(int perfNo);

	
	/**
	 * 상세보기시 향수의 싫어요 정보 조회
	 * 
	 * @param perfNo
	 * @return
	 */
	public HashMap<String, Object> selectPerfDislikeByPerfNo(int perfNo);

	/**
	 * 상세보기시 유저의 좋아요 여부 확인
	 * 
	 * @param perf
	 * @param userNo
	 * @return
	 */
	public int selectPerfLikeCntByPerNoUserNo(HashMap<String, Object> hashmap);

	
	/**
	 * 상세보기시 유저의 싫어요 여부 확인
	 * 
	 * @param perf
	 * @param userNo
	 * @return
	 */
	public int selectPerfDislikeCntByPerNoUserNo(HashMap<String, Object> hashmap);

	/**
	 * 향수 좋아요 추가
	 * 
	 * @param perfLike
	 */
	public void insertPerfLike(PerfLike perfLike);

	/**
	 * 향수 싫어요 추가
	 * 
	 * @param perfLike
	 */
	public void insertPerfDislike(PerfLike perfLike);

	/**
	 * 향수 좋아요/싫어요 삭제
	 * 
	 * @param perfLike
	 */
	public void deletePerfLike(PerfLike perfLike);

	
}
