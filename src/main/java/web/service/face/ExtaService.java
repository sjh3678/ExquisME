package web.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.ExLike;
import web.dto.Extagram;
import web.util.Paging;

public interface ExtaService {
	
	/**
	 * 페이징이 적용된(무한스크롤 필요) 게시글 조회
	 * @param paramData - 페이징 정보 객체
	 * @return 페이징이 적영된 게시글 목록
	 */
	public List<Extagram> getExtaList(Paging paging);

	/**
	 * 페이징 처리
	 * @param paramData
	 * @return
	 */
	public Paging getExtaPaging(Paging paramData);
	
	/**
	 * 게시글 + 첨부파일 처리
	 * @param extagram - 게시글 정보 DTO
	 * @param file - 첨부파일 정보 DTO
	 */
	public void setExtaWrite(Extagram extagram, MultipartFile file);
	
	/**
	 * 게시글 수정
	 * @param extagram - Extagram DTO의 ExPostNo값으로 업데이트할 게시글 선정
	 */
	public void setExtaUpdateByExPostNo(Extagram extagram);
	
	/**
	 * 게시글 삭제
	 * @param extagram - Extagram DTO의 ExPostNo값으로 삭제할 게시글 선정
	 */
	public void setExtaDeleteByExPostNo(Extagram extagram);
	
	/**
	 * 게시글 상세보기
	 * @param extagram - Extagram DTO의 ExPostNo값으로 상세하게 볼 게시글 선정
	 * @return
	 */
	public Extagram getExtaViewByExPostNo(Extagram extagram);
	
	/**
	 * 게시글 신고
	 * @param extagram - Extagram DTO의 ExPostNo값으로 신고할 게시글 선정
	 */
	public void setExtaReportByExPostNo(Extagram extagram);
	
	/**
	 * 좋아요
	 * @param exLike
	 */
	public void setHeart(ExLike exLike);
	
	/**
	 * 좋지않아요
	 * @param exLike
	 */
	public void setHeartDelete(ExLike exLike);
	
}
