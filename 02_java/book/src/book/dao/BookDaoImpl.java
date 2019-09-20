package book.dao;

import static book.mybatis.MybatisClient.getFactory;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.javassist.NotFoundException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import book.mapper.BookMapper;
import book.vo.Book;
import book.vo.Code;

/**
 * 도서 정보를 저장하는 Book 테이블에 여러 CRUD 작업을 MyBatis 구현으로 작업하는 DAO 구현 클래스
 * 
 * @author Jihwan
 *
 */
public class BookDaoImpl implements BookDaoIf {

	/**
	 * MyBatis DB 연결을 위하여 사용하는 SqlSessionFactory 변수
	 */
	private SqlSessionFactory factory;

	// 기본 생성자
	public BookDaoImpl() {
		super();
		// getFactory() 메소드는 static 메소드이므로 static import하여 사용하거나
		// 클래스명, 메소드명()으로 사용
		factory = getFactory();
	}

	@Override
	public List<Book> select(Book book) {
		// 전체 목록이 담길 리스트 변수 선언(리턴에 사용할)
		List<Book> books = null;

		// MyBatis 로 DB 연결하여 쿼리를 실행하기 위해서 SqlSession이 필요함
		// SqlSession은 반드시 메소드 안에서 선언하는 지역변수로만 사용하는 것이 규칙
		SqlSession session = factory.openSession();

		try {
			// 1. 매퍼인터페이스 객체 세션으로부터 얻기
			BookMapper mapper = session.getMapper(BookMapper.class);

			// 2. 얻어진 매퍼 인터페이스 객체에 메소드 호출하여 쿼리 조회 결과 얻기
			books = mapper.select(book);

		} finally {
			session.close();
		}

		// 리턴이 널이 아닌지 확인을 해야함
		return books;
	}

	@Override
	public List<Book> searchByCompanyCd(Code code) {
		// 전체 목록이 담길 리스트 변수 선언(리턴에 사용할)
		List<Book> books = null;

		// MyBatis 로 DB 연결하여 쿼리를 실행하기 위해서 SqlSession이 필요함
		// SqlSession은 반드시 메소드 안에서 선언하는 지역변수로만 사용하는 것이 규칙
		SqlSession session = factory.openSession();

		try {
			// 1. 매퍼인터페이스 객체 세션으로부터 얻기
			BookMapper mapper = session.getMapper(BookMapper.class);

			// 2. 얻어진 매퍼 인터페이스 객체에 메소드 호출하여 쿼리 조회 결과 얻기
			books = mapper.searchByCompanyCd(code);

		} finally {
			session.close();
		}

		// 리턴이 널이 아닌지 확인을 해야함
		return books;
	}

	@Override
	public List<Book> searchByBelowPrice(int price) {
		// 전체 목록이 담길 리스트 변수 선언(리턴에 사용할)
		List<Book> books = null;

		// MyBatis 로 DB 연결하여 쿼리를 실행하기 위해서 SqlSession이 필요함
		// SqlSession은 반드시 메소드 안에서 선언하는 지역변수로만 사용하는 것이 규칙
		SqlSession session = factory.openSession();

		try {
			// 1. 매퍼인터페이스 객체 세션으로부터 얻기
			BookMapper mapper = session.getMapper(BookMapper.class);

			// 2. 얻어진 매퍼 인터페이스 객체에 메소드 호출하여 쿼리 조회 결과 얻기
			books = mapper.searchByBelowPrice(price);

		} finally {
			session.close();
		}

		// 리턴이 널이 아닌지 확인을 해야함
		return books;
	}

	@Override
	public List<Book> searchByPrice(Map<String, Integer> priceMap) {
		// 전체 목록이 담길 리스트 변수 선언(리턴에 사용할)
		List<Book> books = null;

		// MyBatis 로 DB 연결하여 쿼리를 실행하기 위해서 SqlSession이 필요함
		// SqlSession은 반드시 메소드 안에서 선언하는 지역변수로만 사용하는 것이 규칙
		SqlSession session = factory.openSession();

		try {
			// 1. 매퍼인터페이스 객체 세션으로부터 얻기
			BookMapper mapper = session.getMapper(BookMapper.class);

			// 2. 얻어진 매퍼 인터페이스 객체에 메소드 호출하여 쿼리 조회 결과 얻기
			books = mapper.searchByPrice(priceMap);

		} finally {
			session.close();
		}

		// 리턴이 널이 아닌지 확인을 해야함
		return books;
	}

	@Override
	public List<Book> searchByOverPrice(int price) {
		// 전체 목록이 담길 리스트 변수 선언(리턴에 사용할)
		List<Book> books = null;

		// MyBatis 로 DB 연결하여 쿼리를 실행하기 위해서 SqlSession이 필요함
		// SqlSession은 반드시 메소드 안에서 선언하는 지역변수로만 사용하는 것이 규칙
		SqlSession session = factory.openSession();

		try {
			// 1. 매퍼인터페이스 객체 세션으로부터 얻기
			BookMapper mapper = session.getMapper(BookMapper.class);

			// 2. 얻어진 매퍼 인터페이스 객체에 메소드 호출하여 쿼리 조회 결과 얻기
			books = mapper.searchByOverPrice(price);

		} finally {
			session.close();
		}

		// 리턴이 널이 아닌지 확인을 해야함
		return books;
	}

	@Override
	public List<Book> searchByAll(String keyword) {
		// 전체 목록이 담길 리스트 변수 선언(리턴에 사용할)
		List<Book> books = null;

		// MyBatis 로 DB 연결하여 쿼리를 실행하기 위해서 SqlSession이 필요함
		// SqlSession은 반드시 메소드 안에서 선언하는 지역변수로만 사용하는 것이 규칙
		SqlSession session = factory.openSession();

		try {
			// 1. 매퍼인터페이스 객체 세션으로부터 얻기
			BookMapper mapper = session.getMapper(BookMapper.class);

			// 2. 얻어진 매퍼 인터페이스 객체에 메소드 호출하여 쿼리 조회 결과 얻기
			books = mapper.searchByAll(keyword);

		} finally {
			session.close();
		}

		// 리턴이 널이 아닌지 확인을 해야함
		return books;
	}
	
	@Override
	public int insert(Map<String, Object> map) {
		// 1. 리턴할 인서트 성공 카운트 변수
		int addCnt = -1;
		// 2. auto-commit 옵션으로 열린 SqlSession을 통해서 insert 수령
		SqlSession session = factory.openSession(true);
		// 3. Mapper 인터페이스 객체 얻어냄
		BookMapper mapper = session.getMapper(BookMapper.class);
		
		try {
			addCnt = mapper.insert(map)(map);
		} finally {
			session.close();
		}
		
		return addCnt;
	}

	@Override
	public int delete(Book book) throws NotFoundException {
		// 1. 삭제하려는 데이터가 존재하는지 검사
		if (!isExists(book.getBookSeq().intValue())) {
			throw new NotFoundException("delete", book.getBookSeq().intValue());
			
		}
		// 2. 수정 결과 카운트 변수
		int deleteCnt = -1;
		
		// 3. SqlSession 얻기
		SqlSession session = factory.openSession(true);
		
		// 4. 매퍼 인터페이스 객체 얻기
		BookMapper mapper = session.getMapper(BookMapper.class);
		
		// 5. 쿼리실행
		try {
			deleteCnt = mapper.delete(book);
		
		} finally {
			session.close();
			
		}
		return deleteCnt;
		
	}
	@Override
	public int update(Book book) throws NotFoundException {
		// 업데이트는 notFound가 발생할 수 있음!
		// 1. 수정하려는 데이터가 존재하는지 검사
		int bookSeq = ((BigDecimal) map.get("bookSeq")).intValue();
		
		if (!isExists(bookSeq)) {
			throw new NotFoundException("update", bookSeq);
			
		}
		
		// 2. 수정 결과 카운트 변수
		int updateCnt = -1;
		
		// 3. SqlSession 얻기
		SqlSession session = factory.openSession(true);
		
		// 4. 매퍼 인터페이스 객체 얻기
		BookMapper mapper = session.getMapper(BookMapper.class);
		
		// 5. 쿼리실행
		try {
			updateCnt = mapper.update(map);
		
		} finally {
			session.close();
			
		}
		return updateCnt;
		
	}
	
	
	/**
	 * 입력된 책 일련번호에 해당하는 데이터가 존재하는지 검사하여 있으면 true
	 * 없으면 false를 리턴하는 메소드
	 * @param bookSeq
	 * @return
	 */
	// isExists 쿼리를 돌릴꺼임
	private boolean isExists(int bookSeq) {
		boolean exists = false;
		
		// 1. sqlSession 얻기
		SqlSession session = factory.openSession();
		
		// 2. 매퍼 인터페이스 객체 얻기
		BookMapper mapper = session.getMapper(BookMapper.class);
		
		// 3. 쿼리 실행
		try {
			Book book = new Book();
			book.setBookSeq(new BigDecimal(bookSeq));
			int seq = mapper.isExists(book);
			
			if (seq > 0) {
				// 검색된 책의 일련번호가 0보다 크면 존재한다는 뜻
				exists = true;
			
			}
			
		} finally {
			session.close();
			
		}
		return exists;
		
	}


}
