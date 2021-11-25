package web.dao.face;

import java.util.HashMap;
import java.util.List;

import web.dto.Perf;

public interface SurveyDao {

	/**
	 * 전달받은 값으로 노트 리스트 조회
	 *  
	 * @param map 전달받은 파라미터 값
	 * @return - 조회된 노트 리스트 객체 반환
	 */
	List<HashMap<String, Object>> selectNoteLiteByParam(HashMap<String, Object> map);

	/**
	 * 전달 받은 값으로 랜덤 3개 향수 번호 조회
	 * 
	 * @param list - 전달받은 노트번호 
	 * @return 조회한 향수번호 객체 반환
	 */
	List<Integer> selectRandomPerfNo(List<HashMap<String, Object>> list);

	/**
	 * 랜덤 조회된 향수 번호로 향수와 이미지테이블 조회
	 * 
	 * @param perfNo - 랜덤 조회된 향수 번호 3가지
	 * @return 조회된 향수, 이미지 리스트 반환
	 */
	List<HashMap<String, Object>> selecPerfByPerfNo(List<Integer> perfNo);

}
