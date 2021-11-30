package web.dao.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.FileUpload;
import web.dto.NoteLike;
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
	 * 상세보기시 향수번호로 향수하나의 객체 가져오기
	 * 
	 * @param perf
	 * @return
	 */
	public HashMap<String, Object> selectPerfByPerfNo(Perf perf);
	
	

	
	/**
	 * 향수 정보 수정(업데이트)하기
	 * 
	 * @param perf
	 */
	public void updatePerf(Perf perf);
	
	
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
	public void deleteUserPerfLike(PerfLike perfLike);

	
	/**
	 * 노트 좋아요 삭제
	 * 
	 * @param noteLike
	 */
	public void deleteUserNoteLike(NoteLike noteLike);

	/**
	 * 노트 좋아요 추가삽입
	 * 
	 * @param userNo
	 * @param perfumeNo
	 * @param i
	 */
	public void insertNoteLike(HashMap<String, Object> hashmap);

	
	/**
	 * 향수 사진 파일 업로드
	 * 
	 * @param perfFile
	 */
	public void insertPerfFile(FileUpload perfFile);

	/**
	 * 신규 향수 정보 삽입
	 * 
	 * @param perf
	 */
	public int insertNewPerf(Perf perf);

	
	/**
	 * 신규 향수 노트정보 삽입
	 * @param hashmap
	 */
	public void insertPerfNote(HashMap<String, Object> hashmap);

	
	/**
	 * 향수-노트 삭제
	 * 
	 * @param perf
	 */
	public void deletePerfNote(Perf perf);

	/**
	 * 향수 정보 삭제하기
	 * 
	 * @param perf
	 */
	public void deletePerf(Perf perf);

	/**
	 * 향수 사진 파일 삭제
	 * 
	 * @param perf
	 */
	public void deletePerfFile(Perf perf);

	/**
	 * 향수 사진 파일 업데이트
	 * 
	 * @param hashmap
	 */
	public void updatePerfFile(HashMap<String, Object> hashmap);

	
	/**
	 * 유저가 투표한 향수-노트 조회
	 * 
	 * @param hashmap
	 * @return
	 */
	public List<HashMap<String, Object>> selectUserNoteVote(HashMap<String, Object> hashmap);

	
	/**
	 * 향수 노트-좋아요tb 삭제
	 * 
	 * @param perf
	 */
	public void deleteNoteLike(Perf perf);

	/**
	 * 향수 향수-좋아요tb 삭제
	 * 
	 * @param perf
	 */
	public void deletePerfLike(Perf perf);

	/**
	 * 향수 좋아요-싫어요가 n 이상인 것 리스트
	 * @return
	 */
	public List<HashMap<String, Object>> selectPerfMostLike();
	
	
}
