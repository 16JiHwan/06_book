package book.mapper;

import java.util.*;
import book.vo.*;

public interface BookMapper {

	// 쿼리 아이디가 메소드 이름으로 와야함
	// 동적쿼리니까 항상 목록으로 올 수도 있음에 대비해서 LIST<>로 만듬
	public abstract List<Book> select(Book book);
					List<Book> searchByCompanyCd(Code code);
					List<Book> searchByBelowPrice(int price);
					List<Book> searchByPrice(Map<String, Integer> priceMap);
					List<Book> searchByOverPrice(int price);
					List<Book> searchByAll(String keyword);
					int insurt(Map<String, Object> map);
					int delete(Map<String, Object> map);
					int update(Book book);
					int isExists(Book book);

}	
