package book.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

/**
 * 서블릿 서비스에 진입하는 요청에 대해서
 * 요청객체, 응답객체에 한글 설정을 하는 인코딩 필터 클래스
 * 
 * web.xml에 <filter>로 등록하거나 @WebFilter 에노테이션으로 등록해서 사용
 * -----------------------------------------------------------------------
 * - filterName = encodingFilter
 * 
 * 두 개의 초기화 파라미터를 넘겨서 필터 초기화
 * - initParams
 * charEncoding : utf-8
 * contentType : text/html; charset=utf-8
 * 
 * 필터가 작동할 주소 형태 등록
 *  - urlPatterns : /* <== 모든 입력 주소에 대해 작동하라는 뜻임
 *  				==> 이 서비스(웹 어플리케이션)의 컨텍스트 패스 이하로 들어오는 모든 요청 주소에 대해서
 *  					이 필터가 작동한다.
 *  
 */
@WebFilter(filterName = "encordingFilter"
		 , initParams = {@WebInitParam(name="charEncoding", value="utf-8")
					   , @WebInitParam(name="contentType", value="text/html; charset=utf-8")}
		 , urlPatterns = {"/*"} )
public class EncodingFilter implements Filter {
	private FilterConfig config;

	/**
	 * 필터를 초기화 하는 메소드
	 */
	@Override
	public void init(FilterConfig config) throws ServletException {
		this.config = config;
		/*-------------------
		 * 필터의 init() 는 웹 컨테이너(톰캣)에 의해 필터 초기화시에 자동으로 작동되는 필터 라이프사이클 메소드
		 * 
		 * init() 이 호출될 때, 웹 컨테이너(톰캣, 서블릿 컨테이너)는
		 * web.xml에 <filter>로 설정된 내용 혹은 @WebFilter로 설정된 내용을 읽어서 이 메소드 매개변수로 전달
		 * 
		 * 이렇게 전달된 필터 설정 값을 멤버변수로 저장하여 사용한다.
		 * ----------------------------------------------------------
		 */
	}
	
	/**
	 * 필터 클래스의 가장 핵심적인 메소드,
	 * 필터는 항상 여러개가 존재할 수 있기 때문에
	 * 전처리 후 다음 필터, 혹은 다음 필터가 없어서 서블릿으로 요청이 진입되어야 하는 경우
	 * chain.doFilter(request, response); 로 호출한다.
	 * 
	 * 이 때, 다음 필터나 다음 서블릿을 요청하는 doFilter() 호출
	 * 윗줄에 쓰여진 코드는 자동으로 전처리 코드로 인식되고 아랫줄에 쓰여진 코드는 자동으로 후처리됨
	 */
	// 웹 컨테이너가 request, response을 자동으로 만들어줌
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 아래가 호출이 되면서 다음 필터로 전달을 해줌
		// 두필터는 chaimdoFilter() 의 위에 입력하면 전처리
		// 아래에 입력하면 후처리가 자동으로 됨
		
		// 1. 전처리 
		System.out.println("=====1. (1) 인코딩 필터 진입=====");
		// 1) 요청 객체에 한글 설정
		// config 객체에서 인코딩 값 추출
		String charEncoding = config.getInitParameter("charEncoding");
		request.setCharacterEncoding(charEncoding);
		// 2) 응답 객체에 컨텐츠 타입 설정
		// config 객체에서 초기화 파라미터로 넘긴 컨텐츠 타입 값 추출
		String contentType = config.getInitParameter("contentType");
		response.setContentType(contentType);
		// 3) 값 확인을 위한 출력
		System.out.println("charEncoding : "  + charEncoding);
		System.out.println("contentType : " + contentType);
		
		// 다음 필터로 요청, 응답객체로 전달
		chain.doFilter(request, response);
		
		// 2. 후처리
		System.out.println("=====1. (2) 인코딩 필터 종료 =====");
		
		
	}
	
	/**
	 * 구현 내용은 없으나 필수 구현 메소드이기 때문에 내용을 비워둔다
	 * config 멤버변수를 null로 초기화 시키기 위해서 아래에는 this.를 사용해준다
	 */
	@Override
	public void destroy() {
		this.config = null;
	}


    /**
     * Default constructor. 
     */
    public EncodingFilter() {
        // TODO Auto-generated constructor stub
    }


}
