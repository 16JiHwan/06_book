package book.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Manager;
import org.apache.ibatis.javassist.NotFoundException;

import book.dao.BookDaoIf;
import book.dao.BookDaoImpl;
import book.dao.CodeDaoIf;
import book.dao.CodeDaoImpl;
import book.dao.ManagerDaoIf;
import book.dao.ManagerDaoImpl;
import book.vo.Book;
import book.vo.Code;

/**
 * 모든 요청을 받아들이는 컨트롤러 서블릿 클래스 :
 * 		무슨 액션할 것인지 파라미터로 이름을 달고 들어오게 하면
 *		이 메인 안에서 다시 서브 컨트롤러로 분기를 시키면 됨
 * 			==> 이런 방식을 "프론트 컨트롤러"라 부름
 */
@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 서비스 메소드를 프론트 컨트롤러 메소드를 작성
	 * 모든 서비스는 action이라는 이름의 파라미터로 수행할 작업을 추가하여 요청될 것.
	 * 
	 * 프론트 컨트롤러는
	 * 1. 공통작업을 수행
	 * 2. 액션값에 따라 서브 컨트롤러로 분기시키는 역할을 함
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 공통작업
		// 	 1) 요청으로부터 액션 파라미터 추출
		String action = request.getParameter("action");
		
		
		// 2. 서브 컨트롤러 분기
		if ("select".equals(action)) {
			select(request, response);
		} else if ("detail".equals(action)) {
			detail(request, response);
		} else if ("update".equals(action)) {
			update(request, response);
		} else if ("delete".equals(action)) {
			delete(request, response);
		} else if ("insert".equals(action)) {
			insert(request, response);
		} else if ("login".equals(action)) {
			login(request, response);
		} else if  ("logout".equals(action)) {
			logout(request, response);
		}
	}
	
	/**
	 * 세션 해제 처리하여 로그아웃 시키는 메소드
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 로그아웃 처리를 위해서는
		// 1. 현재 이 요청에 연결된 세션 객체 얻기 -> false로 얻어짐
		HttpSession session = request.getSession(false);
		// 세션에 붙어있던 아이디 추출
		String userId = (String) session.getAttribute("userId");
		
		// 2. 얻어진 세션 객체ㅏ null이 아니면
		if (session != null && userId != null) {
			// 로그인 중으로 판단하고 해제함
			// 3. 세션 invalidate()처리
			session.invalidate();
			
		}
		
		// 4. 초기 화면으로 이동
		response.sendRedirect("/index");
	}
	/**
	 * 로그인 처리하는 메소드
	 * GET요청 : 로그인을 할 수 있는 페이지르 ㄹ보여줌
	 * POST 요청 :  DB 테이이블의 회원(관리자) 아이디/비번 일치시 로그인 세션 처리
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청된 HTTP 메소드 추출
		String method = request.getMethod();
	
		if ("GET".equals(method)) {
			// 1. 로그인을 하기위한 화면 제공
			// 메인 컨텐츠 위치 content 값 설정
			String mainContent = "/LoginJap";
			request.setAttribute("content", mainContent);
			
			// /index화면으로 뷰 이동
			String view = "/index";
			request.getRequestDispatcher(view).forward(request, response);
			
		} else if ("POST".equals(method)) {
			// 2. 로그인 처리
			// login.jsp에서 넘어온 form 파라미터 추출
			String userId = request.getParameter("userId");
			String password = request.getParameter("password");
			
			// 파라미터를 매니저 객체로 포장
			Manager manager = new Manager();
			manager.setManagerId(userId);
			manager.setPassword(password);
			
			ManagerDaoIf dao = new ManagerDaoImpl();
			
			if (dao.login(manager)) {
				// 로그인 성공 : 세션 처리 ==> 기본 화면으로 이동
				HttpSession session = request.getSession(true);
				// login 시에는 HTTP세션을 얻어낼 때 true로 얻어내야함
				
				// 세션에 매니저 아이디를 속성으로 주기 : userId 라는 이름으로
				session.setAttribute("userId", userId);
				
				// 화면에 ~님, 로그인 하였습니다. 메세지 출력 후 이동 
				String message = String.format("%s님, 로그인 하셨습니다." userId);
				request.setAttribute("message", message);
				
				// 2초 후 이동할 nextPage 설정
				String nextPage = "/index";
				request.setAttribute("nextPage", nextPage);
				
				
			} else {
				//  로그인 실패 : 메세지 처리 ==> 로그인화면으로 이동
				String message = "로그인이 실패하였습니다.";
				request.setAttribute("message", message);
				
				// 다시 로그인 시도하도록 로그인 화면으로 nextPage 설정
				String nextPage = "main?action=login";
				request.setAttribute("nextPage", nextPage);
			}
			
			// 메인 컨텐츠 영역에 보여줄 페이지 설정
			String mainContent = "/messageLogin";
			request.setAttribute("content", mainContent);
			
			// 메인 화면 뷰 이동
			String view = "/index";
			request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * 도서 1건 정보를 삽입하는 메소드
	 * get으로 요청될 때는 신규 입력할 수 있는 화면을 제공하고
	 * post로 요청될 때는 서버로 전달된 form 파라미터를 사용하여 DB에 insert 쿼리 수행한다
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청된 HTTP 메소드 추출
		String method = request.getMethod();
	
		if ("GET".equals(method)) {
			// 2. GET 요청 처리 : 신규입력 화면 제공
			// mainContent 화면 결정
			String mainContent = "/insertBook";
			request.setAttribute("content", mainContent);
			
			//-- 출판사 목록을 조회해서 요청 객체에 추가
			CodeDaoIf dao = new CodeDaoImpl();
			List<Code> codes = dao.selectCompanies();
			request.setAttribute("codes", codes);
			
			// index로 이동
			String view = "/index";
			request.getRequestDispatcher(view).forward(request, response);
			
		} else if ("POST".equals(method)) {
			// 3. POST 요청 처리 : insertBook이라는 신규입력 저장 처리			
			//   1) insert.jsp에서 넘어오는 form  파라미터 추출
			
			
			//   2) map으로 작성
			
			
			//   3) dao 얻기
			BookDaoIf dao = new BookDaoImpl();
			
			//   4) dao로 insert 쿼리 수행
			try {
				int addCnt = dao.insert(bookMap);
				
				// 5-1) 입력 성공에 대한 화면 이동
				// 입력 성공 메세지 처리
				String message = String.format("도서 정보 1건 [%s] 추가", title);
				// 입력 성공 메세지 처리 후 이동할 nextPage 설정
				String nextPage = "main?action=select";
				request.setAttribute("nextPage", nextPage);
				// 메인 컨테츠 영역에 표시할 content 속성 설정
				String mainContent = "/messageBook";
				request.setAttribute("content", mainContent);
				// 이동할 뷰 화면 설정
				String view = "/index";
				request.getRequestDispatcher(view).forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
				// 5-2) 입력 실패 수행 결과 처리하여 화면 이동
				String message = e.getMessage();
				request.setAttribute("message", message);
			}
			
			//   5) 입력 성공, 실패 수행 결과 처리하여 화면 이동

			
		}

		
		
	}

	/**
	 * 도서 정보 1건을 삭제하는 메소드
	 * @param request
	 * @param response
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) {
		// 1. 삭제할 도서 bookSeq 파라미터 추출
		int bookSeq = Integer.valueOf(request.getParameter("bookSeq"));
		
		// 2. dao 객체 얻기
		BookDaoIf dao = new BookDaoImpl();
		
		// 3. dao로 delete 쿼리 수행
		try {
			Book book = new Book();
			book.setBookSeq(bookSeq);

			dao.delete(book);
			// 4. 삭제 성공에 따른 화면이동
			//   1) 삭제 성공 화면 이동
			//		삭제 성공 메세지 생성
			String message = String.format("도서정보[일련번호 : %d] 삭제 성공", book.getBookSeq());
			request.setAttribute("message", message);

		} catch (NotFoundException e) {
			//   2)  삭제 실패 화면 이동
			String message = e.getMessage();
			request.setAttribute("message", message);
			
		}
		
		//		삭제 성공 메세지를 2초간 보여준 후 이동할 nextPage 속성 설정
		String nextPage = "/main?action=select";
		request.setAttribute("nextPage", nextPage);
		// 		메인 컨텐트 화면에 갈아끼울 content 속성 설정
		String mainContent = "/messageBook";
		request.setAttribute("content", mainContent);
		// 		/index로 화면이동
		String view = "/index";
		request.getRequestDispatcher(view).forward(request, response);
		
	}


	/**
	 * 도서 정보 1건을 수정하는 메소드
	 * GET으로 들어올 시 수정을 위한 화면 제공
	 * POST로 들어올 시 수정 내용을 반영
	 * @param request
	 * @param response
	 */
	private void update(HttpServletRequest request, HttpServletResponse response) {
		// 1. get, post 중 어떤 HTTP메소드로 들어왔는지 추출
		String method = request.getMethod();
		
		if ("GET".equals(method)) {
			// 2. get으로 진입한 경우 수정을 위한 화면제공
			//   1) 요청으로 전달된 파라미터 중 bookSeq 추출
			int bookSeq = Integer.valueOf(request.getParameter("bookSeq"));
			
			//   2) bookSeq에 해당하는 북 객체 1건 조회
			BookDaoIf dao = new BookDaoImpl();
			Book book = new Book();
			book.setBookSeq(bookSeq);
			
			List<Book> books = dao.select(book);
			
			//   3) 조회된 Book 객체 요청에 추가
			request.setAttribute("book", books.get(0));
			
			//   4) 수정 가능한 화면으로 이동
			String content = "/updateBook";
			request.setAttribute("content", content);
			
			String view = "/index";
			request.getRequestDispatcher(view).forward(request, response);
			
		} else if ("POST".equals(method)) {
			// 3. POST로 진입한 경우 수정된 내용을 DB에 반영
			
		}	
	}

	/**
	 * 도서 정보 1건 상세보기
	 * @param request
	 * @param response
	 */
	private void detail(HttpServletRequest request, HttpServletResponse response) {
		// 1. bookSeq 파라미터 추출 (약속이라 반드시 순서를 지켜줘야함)
		int bookSeq = Integer.valueOf(request.getParameter("bookSeq"));
		
		// 2. dao 객체 얻기
		BookDaoIf dao = new BookDaoImpl();
		
		// 3. dao 객체에 1건 조회 실행
		//   1) 1건 조회에 사용할 책 일련번호가 담길 비어있는 Book 객체 생성
		Book book = new Book();
		//   2) 비어있는 Book 객체에 책 일련번호 설정
		book.setBookSeq(bookSeq);
		//   3) select()에 책 일련번호가 다긴 객체 전달하여 1건 조회쿼리로 작동하게함
		List<Book> books = dao.select(book);
		
		// 4. 얻어진 도서 정보 1건 요청 객체에 추가
		request.setAttribute("book", books.get(0));
		
		// 5. 도서 정보 1건 상세보기 페이지로 이동
		//   1) index.jsp의 컨텐트 영역에 표시할 JSP주소를 content라는 이름으로 추가
		String content = "/detailBook";
		request.setAttribute("content", content);
		//   2) /index 주소로 요청 forward(메인화면으로 돌려보냄)
		String view = "/index";
		request.getRequestDispatcher(view).forward(request,  response);
	}

	private void select(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. dao 객체 얻기
		BookDaoIf dao = new BookDaoImpl();
		
		// 2. dao 객체에 목록 조회 메소드 호출하여 결과 얻기
		List<Book> books = dao.select(null);
		
		// 3. 얻어진 결과 request 객체에 속성으로 추가
		request.setAttribute("books", books);
		
		// 4. 목록을 보여줄 수 있는 뷰로 forward
		// 메인 화면인 index로 모든 포워딩을 전달
		String view = "/index";
		
		// 메인 컨텐트 영역에 바꿔 끼울 뷰를 선택
		String content = "/listBook";
				
		// 컨텐트 영역에 끼울 뷰를 속성으로 요청 객체에 추가
		request.setAttribute("content", content);
		request.getRequestDispatcher(view).forward(request, response);
	}

}
