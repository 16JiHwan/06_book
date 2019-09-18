package book.vo;

import java.math.BigInteger;

/**
 * 작성법
 * ---------------------------------------------------------------
 * book.
 * 1. vo 	     : 테이블과 동일한 형태로 클래스 작성
 * 				   빈즈 규격의 클래스
 * 				   기본적으로 PK컬럼을 써서 equals, hashCode, toString 재정의
 * 2. exception  : 데이터 중복, 데이터 없음 
 * 3. mybatis    : 마이바티스 연결 설정 및 기타 작업
 * 4. dao        : 마이바티즈 설정으로 디비 엑세스 작업 코드 작성
 *    mapper     : 매퍼 xml 파일 작성
 * 5. factory
 * 6. biz        : 순수 자바로 만드는 비즈니스 로직 클래스
 * 7. controller : 서블릿 작성
 *    filter     : 서블릿 필터(인코딩, 로그인 필터)
 * 8. util       : static 메소드가 있는 유틸 클래스
 *                 유틸리티성 작업이 필요한 경우 작성      
 * @author Jihwan
 *
 */
public class Book {
	// number는 BigInteger로 처리해야함, varchar2는 String으로 처리해도됨
	private BigInteger bookSeq;
	private String isbn;
	private String title;
	private String author;
	private String content;
	private BigInteger companyCd;
	private BigInteger price;
	private BigInteger quantity;
	private String regId;
	private String regDate;
	private String modId;
	private String modDate;
	
	public Book() {
		
	}

}
