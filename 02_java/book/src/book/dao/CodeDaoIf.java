package book.dao;

import java.util.List;

import book.vo.Code;
/**
 *  코드 테이블에 엑세스하는 기능을 모아둔 인터페이스
 * @author gorhk
 *
 */
public interface CodeDaoIf {
	List<Code> selectCompanies();
}
