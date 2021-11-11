package web.dao.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.Perf;
import web.util.PagingPerf;

public interface PerfDao {

	/**
	 * 향수 전체 수 가져오기
	 * 
	 * @return
	 */
	public int selectCntPerfAll();
	
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
	public List<Perf> selectListByKeyword(PagingPerf pagingPerf, HttpServletRequest req);
	
	/**
	 * 상세보기시 향수번호로 향수하나의 객체 가져오기
	 * 
	 * @param perf
	 * @return
	 */
	public Perf selectPerfByPerfNo(Perf perf);
	
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
}
