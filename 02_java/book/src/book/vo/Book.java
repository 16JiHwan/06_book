package book.vo;

import java.math.BigDecimal;

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
	// number는 BigDecimal로 처리해야함, varchar2는 String으로 처리해도됨
	private BigDecimal bookSeq;
	private String isbn;
	private String title;
	private String author;
	private String content;
	private BigDecimal companyCd;
	private String companyNm;
	private BigDecimal price;
	private BigDecimal quantity;
	private String regId;
	private String regDate;
	private String modId;
	private String modDate;
	
	public Book() {
		
	}
	
	@Override
	public String toString() {
		return "Book [bookSeq=" + bookSeq + ", isbn=" + isbn + ", title=" + title + ", author=" + author + ", content="
				+ content + ", companyCd=" + companyCd + ", companyNm=" + companyNm + ", price=" + price + ", quantity="
				+ quantity + ", regId=" + regId + ", regDate=" + regDate + ", modId=" + modId + ", modDate=" + modDate
				+ "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bookSeq == null) ? 0 : bookSeq.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Book other = (Book) obj;
		if (bookSeq == null) {
			if (other.bookSeq != null)
				return false;
		} else if (!bookSeq.equals(other.bookSeq))
			return false;
		return true;
	}

	public BigDecimal getBookSeq() {
		return bookSeq;
	}

	public void setBookSeq(BigDecimal bookSeq) {
		this.bookSeq = bookSeq;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public BigDecimal getCompanyCd() {
		return companyCd;
	}

	public void setCompanyCd(BigDecimal companyCd) {
		this.companyCd = companyCd;
	}

	public String getCompanyNm() {
		return companyNm;
	}

	public void setCompanyNm(String companyNm) {
		this.companyNm = companyNm;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getQuantity() {
		return quantity;
	}

	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getModId() {
		return modId;
	}

	public void setModId(String modId) {
		this.modId = modId;
	}

	public String getModDate() {
		return modDate;
	}

	public void setModDate(String modDate) {
		this.modDate = modDate;
	}



}
