package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import web.dao.face.ExtaDao;
import web.service.face.ExtaService;

public class ExtaServiceImpl implements ExtaService {
	
	@Autowired ExtaDao extaDao;
	
	
}
