package book.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import book.mapper.CodeMapper;
import book.vo.Code;
/**
 *  코드 테이블 엑세스 기능을 구현하는 클래스
 * @author gorhk
 *
 */
public class CodeDaoImpl implements CodeDaoIf {
	private SqlSessionFactory factory;
	
	public CodeDaoImpl () {
		super();
		factory = getFactory();
	}
	
	@Override
	public List<Code> selectCompanies() {
		// 조회된 코드 목록이 담길 목록
		List<Code> codes = null;
		
		// SqlSession 얻기
		SqlSession session = factory.openSession();
		
		// CodeMapper 인터페이스 객체 얻기
		CodeMapper mapper = session.getMapper(CodeMapper.class);
		
		// 얻어진 매퍼 객체에 메소드 수행
		try {
			codes = mapper.selectCompanies();
			
		} finally {
			session.close();
			
		}
		// 조회된 목록 리턴
		
		return null;
	}

}
