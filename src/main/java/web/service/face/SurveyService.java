package web.service.face;

import java.util.HashMap;
import java.util.List;

import web.dto.Perf;

public interface SurveyService {

	/**
	 * 설문으로 전달받은 파라미터로 노트 조회
	 * 
	 * @param map - 설문 정보
	 * @return - 조회된 노트 리스트 반환
	 */
	List<HashMap<String, Object>> getNoteList(HashMap<String, Object> map);

	/**
	 * 설문 결과로 나온 노트 번호로 향수 조회
	 * 
	 * @param list - 설문 결과 객체
	 * @return 향수 조회 리스트 반환
	 */
	List<HashMap<String, Object>> getPerfList(List<HashMap<String, Object>> list);

}
