package web.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import jdk.nashorn.internal.runtime.logging.Logger;

@ControllerAdvice
@Logger
public class CommonExeptionAdvice {
	
	@ExceptionHandler(Exception.class)
	public String exept(Exception ex, Model model) {
		
		model.addAttribute("exception", ex);
		
		return "/layout/errors";
		
	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex) {
		return "/layout/404error";
	}
}
