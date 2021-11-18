package web.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.Perf;
import web.dto.PerfLike;
import web.util.Paging;
import web.util.PagingPerf;

public interface PerfService {

	/**
	 * 향수 리스트를 위한 페이징 객체 생성하기
	 * 
	 * @param paging
	 * @return
	 */
	public PagingPerf getPaging(PagingPerf paramData);
	
	/**
	 * 페이징 적용하여 향수리스트 가져오기
	 * 
	 * @param paging
	 * @return
	 */
	public List<HashMap<String, Object>> getPerfList(PagingPerf pagingPerf);
	
	/**
	 * 향수 상세보기 하기위해 향수하나의 객체 정보 가져오기
	 * 
	 * @param perf
	 * @return
	 */
	public HashMap<String, Object> getPerfView(Perf perf);
	
	/**
	 * 향수정보 수정하기
	 * 
	 * @param perf
	 * @param req
	 */
	public void setPerfUpdate(Perf perf, HttpServletRequest req);
	
	/**
	 * 향수정보 삭제하기
	 * 
	 * @param perf
	 */
	public void setPerfDelete(Perf perf);
	
	/**
	 * 향수정보 삽입하기
	 * 
	 * @param req
	 */
	public void setPerfWrite(HttpServletRequest req);

	/**
	 * 향수 상세보기 하기위해 향수하나의 topnote 정보 가져오기
	 * 
	 * @param perf
	 * @return
	 */
	public List<HashMap<String, Object>> getPerfTopNote(Perf perf);

	
	/**
	 * 향수 상세보기 하기위해 향수하나의 middlenote 정보 가져오기
	 * 
	 * @param perf
	 * @return
	 */
	public List<HashMap<String, Object>> getPerfMiddleNote(Perf perf);

	/**
	 * 향수 상세보기 하기위해 향수하나의 basenote 정보 가져오기
	 * 
	 * @param perf
	 * @return
	 */
	public List<HashMap<String, Object>> getPerfBaseNote(Perf perf);

	/**
	 * 향수 상세보기의 메인 어코드 정보 가져오기
	 * 
	 * @param perf
	 * @return
	 */
	public List<HashMap<String, Object>> getPerfMainAccord(Perf perf);

	/**
	 * 향수 상세보기의 향수 좋아요 정보 가져오기
	 * 
	 * @param perfNo
	 * @return
	 */
	public HashMap<String, Object> getPerfLike(int perfNo);

	/**
	 * 향수 상세보기의 향수 싫어요 정보 가져오기
	 * 
	 * @param perfNo
	 * @return
	 */
	public HashMap<String, Object> getPerfDislike(int perfNo);


	/**
	 * 향수 좋아요 테이블에서 회원번호, 향수번호로 좋아요 튜플 카운트
	 * 
	 * @param perfNo
	 * @param userNo
	 * @return
	 */
	public int getPerfLikeCnt(int perfNo, int userNo);

	/**
	 * 향수 좋아요 테이블에서 회원번호, 향수번호로 싫어요 튜플 카운트
	 * 
	 * @param perfNo
	 * @param userNo
	 * @return
	 */
	public int getPerfDislikeCnt(int perfNo, int userNo);

	
	/**
	 * 향수 좋아요/싫어요 처리
	 * 
	 * @param perfLike
	 */
	public void perfLikeProc(PerfLike perfLike);




}
