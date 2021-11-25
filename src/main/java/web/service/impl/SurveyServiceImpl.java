package web.service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.controller.SurveyController;
import web.dao.face.SurveyDao;
import web.dto.Perf;
import web.service.face.SurveyService;

@Service
public class SurveyServiceImpl implements SurveyService {

	private static final Logger logger = LoggerFactory.getLogger(SurveyServiceImpl.class);
	
	@Autowired SurveyDao surveyDao;
	
	@Override
	public List<HashMap<String, Object>> getNoteList(HashMap<String, Object> map) {
		return surveyDao.selectNoteLiteByParam(map);
	}

	@Override
	public List<HashMap<String, Object>> getPerfList(List<HashMap<String, Object>> list) {
		
		List<Integer> perfNo = surveyDao.selectRandomPerfNo(list);
		logger.info("perfNo : {}", perfNo);
		
		
		List<HashMap<String, Object>> perfList = surveyDao.selecPerfByPerfNo(perfNo);
		logger.info("perfList : {}", perfList);
		
		return perfList;
	}

}
