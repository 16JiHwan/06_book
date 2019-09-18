-- Book sample project table

/* Table : BOOK                                    || 테이블 명 : MANAGER
   ------------------------------------------------||----------------------------------------------------
   컬럼명,     데이터 타입(크기),      제약조건          =  컬럼명,        데이터 타입(크기),    제약조건
   ------------------------------------------------||----------------------------------------------------
   BOOK_SEQ   NUMBER               PK              || MANAGER_SEQ    NUMBER             PK
   ISBN       VARCHAR2(13)         U               || MANAGER_ID     VARCHAR2(10)       U
   TITLE      VARCHAR2(50)         NOT NULL        || NAME           VARCHAR2(30)
   AUTHOR     VARCHAR2(30)                         || PASSWORD       VARCHAR2(10)       NOT NULL 
   CONTENT    VARCHAR2(3000)                       || REG_ID         VARCHAR2(10)   
   COMPANY_CD NUMBER(4)                            || REG_DATE       DATE               DEFAULT SYSDATE  
   PRICE      NUMBER(6)                            || MOD_ID         VARCHAR2(10)
   QUANTITY   NUMBER(4)                            || MOD_DATE       DATE  
   REG_ID     VARCHAR2(10)                         ||
   REG_DATE   DATE                 DEFAULT SYSDATE ||
   MOD_ID     VARCHAR2(10)                         ||
   MOD_DATE   DATE                                 ||
   ------------------------------------------------||---------------------------------------------------
   Table : CODE                                    ||
   ------------------------------------------------||---------------------------------------------------
   코드명,     데이터 타입(크기),      제약조건          =
   ------------------------------------------------||---------------------------------------------------
   CODE       NUMBER(4)            PK              || 시퀀스 명 :  SEQ_BOOK, SEQ_MANAGER : NOCYCLE, NOMAXVALUE
   P_CODE     NUMBER(4)            NOT NULL        ||                                     ==> 1씩 증가
   CODE_NM    VARCHAR2(60)         NOT NULL        ||
   CODE_VAL   VARCHAR2(300)        NOT NULL        ||
   USE_YN     CHAR(1)                              ||
   CODE_DESC  VARCHAR2(300)                        ||
   ORDER      NUMBER               NOT NULL        ||
   REG_ID     VARCHAR2(10)                         ||
   REG_DATE   DATE                 DEFAULT SYSDATE ||
   MOD_ID     VARCHAR2(10)                         ||
   MOD_DATE   DATE                                 ||
   ------------------------------------------------||
*/
DROP TABLE CODE;
CREATE TABLE CODE(
    CODE       NUMBER(4)            
  , P_CODE     NUMBER(4)            NOT NULL 
  , CODE_NM    VARCHAR2(60)         NOT NULL 
  , CODE_VAL   VARCHAR2(300)        NOT NULL
  , USE_YN     CHAR(1)
  , CODE_DESC  VARCHAR2(300)   
  , SORT_ORDER NUMBER               NOT NULL
  , REG_ID     VARCHAR2(10)
  , REG_DATE   DATE                 DEFAULT SYSDATE
  , MOD_ID     VARCHAR2(10)
  , MOD_DATE   DATE
  , CONSTRAINT PK_CODE              PRIMARY KEY(CODE)
  );
-- CODE INSERT INTO 구문            
INSERT INTO CODE(CODE, P_CODE, CODE_NM, CODE_VAL, USE_YN, CODE_DESC, SORT_ORDER, REG_ID)
         VALUES (1000, 0, 'COMPANY', '출판사', 'Y', '출판사 코드', 0, 0);
INSERT INTO CODE(CODE, P_CODE, CODE_NM, CODE_VAL, USE_YN, CODE_DESC, SORT_ORDER, REG_ID)
         VALUES (1001, 1000, 'CHANGBI', '창비', 'Y', '창작과 비평사', 0, 1);
INSERT INTO CODE(CODE, P_CODE, CODE_NM, CODE_VAL, USE_YN, CODE_DESC, SORT_ORDER, REG_ID)
         VALUES (1002, 1000, 'THE_STORY', '더스토리', 'Y', '더 스토리', 0, 2);
INSERT INTO CODE(CODE, P_CODE, CODE_NM, CODE_VAL, USE_YN, CODE_DESC, SORT_ORDER, REG_ID)
         VALUES (1003, 1000, 'WISDOM', '위즈덤', 'Y', '위즈덤 하우스', 0, 3);
INSERT INTO CODE(CODE, P_CODE, CODE_NM, CODE_VAL, USE_YN, CODE_DESC, SORT_ORDER, REG_ID)
         VALUES (1004, 1000, 'HUEN', '흔', 'Y', '독립출판 흔', 0, 4);
INSERT INTO CODE(CODE, P_CODE, CODE_NM, CODE_VAL, USE_YN, CODE_DESC, SORT_ORDER, REG_ID)
         VALUES (1005, 1000, 'BOOK_HOUSE', '북하우스', 'Y', '북하우스', 0, 5);
COMMIT;


DROP TABLE MANAGER;
CREATE TABLE MANAGER(
    MANAGER_SEQ    NUMBER           
  , MANAGER_ID     VARCHAR2(10)     NOT NULL   
  , NAME           VARCHAR2(30) 
  , PASSWORD       VARCHAR2(10)     NOT NULL
  , REG_ID         VARCHAR2(10)
  , REG_DATE       DATE             DEFAULT SYSDATE
  , MOD_ID         VARCHAR2(10)
  , MOD_DATE       DATE
  , CONSTRAINT     PK_MANAGER       PRIMARY KEY(MANAGER_SEQ)
  , CONSTRAINT     U_MANAGER_ID     UNIQUE(MANAGER_ID)
  );
-- MANAGER INSERT INTO 구문            
INSERT INTO MANAGER(MANAGER_SEQ, MANAGER_ID, NAME, PASSWORD, REG_ID)
         VALUES (0, 'admin', 'Jihwan', '1q2w3e', 0);
         
COMMIT;

DROP TABLE BOOK;
CREATE TABLE BOOK(
    BOOK_SEQ   NUMBER               
  , ISBN       VARCHAR2(13)         
  , TITLE      VARCHAR2(50)         NOT NULL 
  , AUTHOR     VARCHAR2(30) 
  , CONTENT    VARCHAR2(3000)
  , COMPANY_CD NUMBER(4)   
  , TOTAL_PAGE NUMBER(4)
  , PRICE      NUMBER(6)
  , QUANTITY   NUMBER(4)
  , REG_ID     VARCHAR2(10)
  , REG_DATE   DATE                 DEFAULT SYSDATE
  , MOD_ID     VARCHAR2(10)
  , MOD_DATE   DATE
  , CONSTRAINT PK_BOOK              PRIMARY KEY(BOOK_SEQ)
  , CONSTRAINT U_BOOK_ISBN          UNIQUE(ISBN)
  );
-- MANAGER INSERT INTO 구문            
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (0, 'ISBN', '제목', '저자', '책 내용', 1000, 0, 0, 0, 0);
         
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9788936433598', '채식주의자', '한강', '어린시절 자신의 다리를 문 개를 죽이는 장면이 뇌리에 박혀 점점 육식을 멀리하고 스스로가 나무가 되어간다고 생각하는 영혜를 주인공으로 각 편에서 다른 화자가 등장한다. ', 1001, 247, 10800, 5, 1);
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9791159039690', '어린왕자(초판본)', '생텍쥐페리', '비행기 고장으로 사막에 불시착한 조종사는 한 이상한 소년을 만난다. 소년은 조종사에게 양을 그려달라고 부탁한다. 소년은 자신이 사는 작은 별에 사랑하는 장미를 남겨두고 세상을 보기 위해 여행을 온 어린 왕자였다.
어린 왕자는 몇 군데의 별을 돌아다닌 후 지구로 와 뱀, 여우, 조종사와 친구가 된다. 어느덧 여우와 어린 왕자는 서로를 길들여 ‘세상에서 하나밖에 없는 꼭 필요한 존재’로 남는다. 그리고 어린 왕자는 자신만의 특별한 존재인 장미를 떠올리며 떠나온 별로 다시 돌아가기로 결심한다.', 1002, 150, 8820, 5, 2);         
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9791190182645', '제 인생에 답이 없어요', '선바', '50만 구독자의 웃음을 책임지는 유튜버 선바의 만담 에세이 『제 인생에 답이 없어요』. 대학을 10년째 다니고 있는 학생이자 게임 스트리밍 전문 유튜버 선바가 방송으로는 못다 한 드립과 생각을 엮은 책으로, 약간 망했어도 즐겁게 내 갈 길을 가는 힘에 대해 이야기한다. 1인 크리에이터로 사는 법, 인터넷 방송과 유머에 대한 그만의 지론은 물론, 인생이 적성이 아닌 사람들을 위한 삶의 TMI와 꿀팁을 풀어놓는다.', 1003, 192, 10800, 5, 3);         
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9791196394509', '죽고 싶지만 떡볶이는 먹고 싶어', '백세희', '10년 넘게 기분부전장애(가벼운 우울 증상이 지속되는 상태)와 불안장애를 겪으며 정신과를 전전했던 저자와 정신과 전문의와의 12주간의 대화를 엮은 『죽고 싶지만 떡볶이는 먹고 싶어』. 지독히 우울하지도 행복하지도 않은 애매한 기분에 시달렸고, 이러한 감정들이 한 번에 일어날 수 있다는 사실을 알지 못해서 괴로웠던 저자는 2017년 잘 맞는 병원을 찾아 약물치료와 상담치료를 병행하고 있다.', 1004, 208, 12420, 5, 4);         
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9788956055466', '책은 도끼다', '박웅현', '저는 책 읽기에 있어 ‘다독 콤플렉스’를 버려야 한다고 생각합니다. 다독 콤플렉스를 가지면 쉽게 빨리 읽히는 얇은 책들만 읽게 되니까요. 올해 몇 권 읽었느냐, 자랑하는 책 읽기에서 벗어났으면 합니다. 일 년에 다섯 권을 읽어도 거기 줄 친 부분이 몇 페이지냐가 중요한 것 같습니다. 줄 친 부분이라는 것은 말씀드렸던, 제게 ‘울림’을 준 문장입니다. 그 울림이 있느냐 없느냐가 중요한 것이지 숫자는 의미가 없다고 봅니다.', 1005, 348, 14400, 5, 5);         
         
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9788936434267', '아몬드', '손원평', '감정 표현 불능증을 앓고 있는 열여섯 살 소년 선윤재. ‘아몬드’라 불리는 편도체가 작아 분노도 공포도 잘 느끼지 못하는 그는 타고난 침착성, 엄마와 할머니의 지극한 사랑 덕에 별 탈 없이 지냈지만 크리스마스이브이던 열여섯 번째 생일날 벌어진 비극적인 사고로 가족을 잃는다. 그렇게 세상에 홀로 남겨진 윤재 앞에 ‘곤이’가 나타난다. 놀이동산에서 엄마의 손을 잠깐 놓은 사이 사라진 후 13년 만에 가족의 품으로 돌아오게 된 곤이는 분노로 가득 찬 아이다. 곤이는 윤재를 괴롭히고 윤재에게 화를 쏟아 내지만, 감정의 동요가 없는 윤재 앞에서 오히려 쩔쩔매고 만다. 그 후 두 소년은 남들이 이해할 수 없는 특별한 우정을 쌓아가고, 윤재는 조금씩 내면의 변화를 겪는데…….', 1001, 263, 10800, 5, 6);
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9788936477196', '선량한 차별주의자', '김지혜', '은밀하고 사소하며 일상적이고 자연스럽게 벌어지는 일들 속에서 선량한 우리가 놓치고 있던 차별과 혐오의 순간을 날카롭게 포착하는 『선량한 차별주의자』. 차별의 사각지대에 놓인 이들을 직접 찾아가는 현장 활동가이자, 통계학·사회복지학·법학을 넘나드는 통합적인 시각을 바탕으로 국내의 열악한 혐오·차별 문제의 이론적 토대를 구축하는 데 전념해온 연구자인 김지혜 교수가 인간 심리에 대한 국내외의 최신 연구, 현장에서 기록한 생생한 사례, 학생들과 꾸준히 진행해온 토론수업과 전문가들의 학술포럼에서의 다양한 논쟁을 버무려 우리 일상에 숨겨진 혐오와 차별의 순간들을 생생하게 담아냈다.', 1001, 244, 13500, 5, 7);  
         
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9788971543429', '교회오빠 이관희', '오은주', '오은주에게 이관희는 ‘엄친아’이면서 첫사랑이었습니다. 이별의 아픔 뒤에 다시 만나 결혼하기까지 10년이 걸렸습니다. 달콤한 신혼과 전쟁 같은 적응기를 보낸 후 3년 만에 예쁜 딸을 낳고 세상 제일 행복한 여자가 되었을 때, ‘비극의 문’이 열렸습니다. 출산 후 한 달도 되기 전에 남편이 ‘대장암 4기’ 판정을 받은 것입니다. 그때 오은주(1983년생)는 중학교 음악교사였고, 남편 이관희(1979년생)는 글로벌 IT회사인 퀄컴 코리아(Qualcomm Korea)의 차장으로 전도양양한 인재였습니다.', 1002, 288, 13500, 5, 8);
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9791159036514', '데미안(초판본)(리커버 한정판)', '헤르만 헤세', '싱클레어는 부모의 따뜻한 보살핌과 기독교 신앙의 가르침 안에서 자라는 평범한 소년이었다. 그는 부모가 품어주는 밝은 세계가 주는 편안함 속에서 안락을 누렸지만, 동시에 부모의 세계 밖에 있는 어둠의 세계에도 두려움과 함께 호기심을 갖고 접촉하고 있었다. 그곳은 때로는 욕설과 싸움이 있었지만, 때로는 솔직한 감정의 교류가 그를 유혹하고 있었다. 싱클레어는 자신의 환경으로부터 밝음과 어둠의 두 세계를 발견하고 모두 마음에 품으면서, 어느 곳에도 온전히 속하지 못한 채 갈등하게 된다.', 1002, 248, 10800, 5, 9);         
         
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9791190065672', '박막례 이대로 죽을 순 없다(땡큐 에디션) ', '박막례', '책 내용', 1003, 344, 13320, 5, 10); 
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9791162202913', '모든 순간이 너였다', '하태완', '사랑, 청춘, 삶에 대해 써내려 간 에세이집 《#너에게》와 SNS를 통해 사랑받은 하태완 작가의 두 번째 에세이 『모든 순간이 너였다』. 위로받고 싶을 때, 설레고 싶을 때, 사람에게 상처받았을 때, 삶의 모든 순간에 특별한 위로와 공감을 건네는 이야기를 담았다.', 1003, 272, 12420, 5, 11); 
 
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9791196394578', '죽고 싶지만 떡볶이는 먹고 싶어. 2', '백세희', '10년 넘게 기분부전장애(가벼운 우울 증상이 지속되는 상태)와 불안장애를 겪으며 정신과 전문의와 나눴던 12주간의 대화를 잊지 않기 위해 녹취를 풀어 쓴 것에서 시작된 《죽고 싶지만 떡볶이는 먹고 싶어》로 2018년 한 해 큰 사랑을 받았던 백세희 작가가 1권에 마저 담지 못했던 내용을 포함해 그 이후에 이어진 16주간의 상담기록을 엮은 『죽고 싶지만 떡볶이는 먹고 싶어』 제2권.', 1004, 264, 12420, 5, 12); 
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9791196394547', '어색하지 않게 사랑을 말하는 방법', '소은성', '속마음을 숨기고, 무덤덤한 척하고, 적당한 말들로 대화를 이어가는 것에 익숙해진 우리는 정작 진짜 마음을 주고 싶은 상대 앞에선 아이처럼 서툴다. 어딘지 어색하고, 어딘지 불편한 대화 속에서 서로의 마음이 오해될까 걱정하기 바쁘다. 어쩌다 우리는 솔직하고 다정한 말들을 좀처럼 주고받지 않게 됐을까. 어떻게 해야 나의 말은 ‘너’에게 가닿을 수 있을까.', 1004, 292, 13320, 5, 13); 
 
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9788956056609', '다시, 책은 도끼다', '박웅현', '정답이라고 주장할 수 있는 독법은 없으나, ‘이 사람의 것’이라면 믿을 만하다고 여겨지는 독법은 있다. 바로, 베스트셀러 《책은 도끼다》의 저자 박웅현의 독법이 그러하다. 그런 그가 《책은 도끼다》 이후 5년 만에 자신의 이름을 내걸은 인문학 강독회로 돌아왔다. 모두가 후속작이 나오기만을 기다려왔던 책, 그래서 제목도 『다시, 책은 도끼다』이다.', 1005, 349, 14400, 5, 14);
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9788956055619', '영어 그림책의 기적', '전은주', '『영어 그림책의 기적』는 아이들이 공부라는 방식에서 벗어나 읽기를 통해 영어 실력을 키울 수 있도록 도와주는 책이다. 아이의 영어 교육은 모든 엄마의 고민이라고 할 수 있는데, 이 책은 그런 고민의 해결 방안을 제시해준다. 보다 즐겁게, 살아 있는 언어로 영어를 배울 수 있도록 영어 그림책을 소개한 것. 실생활에서 쓰는 자연스러운 표현을 익힐 수 있고, 독서습관을 잡는데도 효과적이다.', 1005, 376, 13500, 5, 15);         
COMMIT;


DROP SEQUENCE SEQ_BOOK;
CREATE SEQUENCE SEQ_BOOK
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;
   
CREATE SEQUENCE SEQ_MANAGER
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCYCLE;

/*---------------------------------------------------------------------------------
    출판사 번호와 출판사 이름을 코드로 관리
    출판사 관련 코드는 1000번대가 출판사 코드
    자세한 개별 출판사의 정보는 1001, 1002, 1003, ... 순서로 증가하도록 설계 데이터를 넣고 시작
    -------------------------------------------------------------------------------
    개발할 때는 최소한의 데이터를 넣고 시작해야 조회가 됨!! 반드시 기본 데이터를 넣어줘야함
*/

