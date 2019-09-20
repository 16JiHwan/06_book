package book.dao;

import org.apache.catalina.Manager;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import book.mapper.ManagerMapper;
/**
 * MANAGER 테이블 access관련 기능을 모아둔 DAO 클래스
 * @author gorhk
 *
 */
public class ManagerDaoImpl implements ManagerDaoIf {
	private SqlSessionFactory factory;
	
	public ManagerDaoImpl() {
		// MybatisClient 클래스 안에 있는 static 메소드이므로
		// static import로 사용한다.
		factory = getFactory();
	}

	@Override
	public boolean login(Manager manager) {
		// TODO Auto-generated method stub
		boolean success = false;
		
		SqlSession session = factory.openSession();
		
		// ManagerMapper 인터페이스 객체 얻기
		ManagerMapper mapper = session.getMapper(ManagerMapper.class);
		
		// 얻어진 매퍼 객체에 메소드 호출하여 로그인 처리
		try {
			Integer managerSeq = mapper.login(manager);
			if (managerSeq != null) {
				success = true;
			}
		} finally {
			session.close();
		}
		return success;
	}
}
