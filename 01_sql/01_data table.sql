-- Book sample project table

/* Table : BOOK                                    || ���̺� �� : MANAGER
   ------------------------------------------------||----------------------------------------------------
   �÷���,     ������ Ÿ��(ũ��),      ��������          =  �÷���,        ������ Ÿ��(ũ��),    ��������
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
   �ڵ��,     ������ Ÿ��(ũ��),      ��������          =
   ------------------------------------------------||---------------------------------------------------
   CODE       NUMBER(4)            PK              || ������ �� :  SEQ_BOOK, SEQ_MANAGER : NOCYCLE, NOMAXVALUE
   P_CODE     NUMBER(4)            NOT NULL        ||                                     ==> 1�� ����
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
-- CODE INSERT INTO ����            
INSERT INTO CODE(CODE, P_CODE, CODE_NM, CODE_VAL, USE_YN, CODE_DESC, SORT_ORDER, REG_ID)
         VALUES (1000, 0, 'COMPANY', '���ǻ�', 'Y', '���ǻ� �ڵ�', 0, 0);
INSERT INTO CODE(CODE, P_CODE, CODE_NM, CODE_VAL, USE_YN, CODE_DESC, SORT_ORDER, REG_ID)
         VALUES (1001, 1000, 'CHANGBI', 'â��', 'Y', 'â�۰� �����', 0, 1);
INSERT INTO CODE(CODE, P_CODE, CODE_NM, CODE_VAL, USE_YN, CODE_DESC, SORT_ORDER, REG_ID)
         VALUES (1002, 1000, 'THE_STORY', '�����丮', 'Y', '�� ���丮', 0, 2);
INSERT INTO CODE(CODE, P_CODE, CODE_NM, CODE_VAL, USE_YN, CODE_DESC, SORT_ORDER, REG_ID)
         VALUES (1003, 1000, 'WISDOM', '�����', 'Y', '����� �Ͽ콺', 0, 3);
INSERT INTO CODE(CODE, P_CODE, CODE_NM, CODE_VAL, USE_YN, CODE_DESC, SORT_ORDER, REG_ID)
         VALUES (1004, 1000, 'HUEN', '��', 'Y', '�������� ��', 0, 4);
INSERT INTO CODE(CODE, P_CODE, CODE_NM, CODE_VAL, USE_YN, CODE_DESC, SORT_ORDER, REG_ID)
         VALUES (1005, 1000, 'BOOK_HOUSE', '���Ͽ콺', 'Y', '���Ͽ콺', 0, 5);
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
-- MANAGER INSERT INTO ����            
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
-- MANAGER INSERT INTO ����            
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (0, 'ISBN', '����', '����', 'å ����', 1000, 0, 0, 0, 0);
         
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9788936433598', 'ä��������', '�Ѱ�', '����� �ڽ��� �ٸ��� �� ���� ���̴� ����� ������ ���� ���� ������ �ָ��ϰ� �����ΰ� ������ �Ǿ�ٰ� �����ϴ� ������ ���ΰ����� �� ���� �ٸ� ȭ�ڰ� �����Ѵ�. ', 1001, 247, 10800, 5, 1);
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9791159039690', '�����(���Ǻ�)', '�������丮', '����� �������� �縷�� �ҽ����� ������� �� �̻��� �ҳ��� ������. �ҳ��� �����翡�� ���� �׷��޶�� ��Ź�Ѵ�. �ҳ��� �ڽ��� ��� ���� ���� ����ϴ� ��̸� ���ܵΰ� ������ ���� ���� ������ �� � ���ڿ���.
� ���ڴ� �� ������ ���� ���ƴٴ� �� ������ �� ��, ����, ������� ģ���� �ȴ�. ����� ����� � ���ڴ� ���θ� ��鿩 �����󿡼� �ϳ��ۿ� ���� �� �ʿ��� ���硯�� ���´�. �׸��� � ���ڴ� �ڽŸ��� Ư���� ������ ��̸� ���ø��� ������ ���� �ٽ� ���ư���� ����Ѵ�.', 1002, 150, 8820, 5, 2);         
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9791190182645', '�� �λ��� ���� �����', '����', '50�� �������� ������ å������ ��Ʃ�� ������ ���� ������ ���� �λ��� ���� ����䡻. ������ 10��° �ٴϰ� �ִ� �л����� ���� ��Ʈ���� ���� ��Ʃ�� ���ٰ� ������δ� ���� �� �帳�� ������ ���� å����, �ణ ���߾ ��̰� �� �� ���� ���� ���� ���� �̾߱��Ѵ�. 1�� ũ�������ͷ� ��� ��, ���ͳ� ��۰� ���ӿ� ���� �׸��� ������ ����, �λ��� ������ �ƴ� ������� ���� ���� TMI�� ������ Ǯ����´�.', 1003, 192, 10800, 5, 3);         
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9791196394509', '�װ� ������ �����̴� �԰� �;�', '�鼼��', '10�� �Ѱ� ��к������(������ ��� ������ ���ӵǴ� ����)�� �Ҿ���ָ� ������ ���Ű��� �����ߴ� ���ڿ� ���Ű� �����ǿ��� 12�ְ��� ��ȭ�� ���� ���װ� ������ �����̴� �԰� �;. ������ ��������� �ູ������ ���� �ָ��� ��п� �ô޷Ȱ�, �̷��� �������� �� ���� �Ͼ �� �ִٴ� ����� ���� ���ؼ� ���ο��� ���ڴ� 2017�� �� �´� ������ ã�� �๰ġ��� ���ġ�Ḧ �����ϰ� �ִ�.', 1004, 208, 12420, 5, 4);         
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9788956055466', 'å�� ������', '�ڿ���', '���� å �б⿡ �־� ���ٵ� ���÷������� ������ �Ѵٰ� �����մϴ�. �ٵ� ���÷����� ������ ���� ���� ������ ���� å�鸸 �а� �Ǵϱ��. ���� �� �� �о�����, �ڶ��ϴ� å �б⿡�� ������� �մϴ�. �� �⿡ �ټ� ���� �о �ű� �� ģ �κ��� �� �������İ� �߿��� �� �����ϴ�. �� ģ �κ��̶�� ���� ������ȴ�, ���� ���︲���� �� �����Դϴ�. �� �︲�� �ִ��� �����İ� �߿��� ������ ���ڴ� �ǹ̰� ���ٰ� ���ϴ�.', 1005, 348, 14400, 5, 5);         
         
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9788936434267', '�Ƹ��', '�տ���', '���� ǥ�� �Ҵ����� �ΰ� �ִ� ������ �� �ҳ� ������. ���Ƹ�塯�� �Ҹ��� ��ü�� �۾� �г뵵 ������ �� ������ ���ϴ� �״� Ÿ�� ħ����, ������ �ҸӴ��� ������ ��� ���� �� Ż ���� �������� ũ���������̺��̴� ������ ��° ���ϳ� ������ ������� ���� ������ �Ҵ´�. �׷��� ���� Ȧ�� ������ ���� �տ� �����̡��� ��Ÿ����. ���̵��꿡�� ������ ���� ��� ���� ���� ����� �� 13�� ���� ������ ǰ���� ���ƿ��� �� ���̴� �г�� ���� �� ���̴�. ���̴� ���縦 �������� ���翡�� ȭ�� ��� ������, ������ ���䰡 ���� ���� �տ��� ������ ¿¿�Ű� ����. �� �� �� �ҳ��� ������ ������ �� ���� Ư���� ������ �׾ư���, ����� ���ݾ� ������ ��ȭ�� �޴µ�����.', 1001, 263, 10800, 5, 6);
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9788936477196', '������ ����������', '������', '�����ϰ� ����ϸ� �ϻ����̰� �ڿ������� �������� �ϵ� �ӿ��� ������ �츮�� ��ġ�� �ִ� ������ ������ ������ ��ī�Ӱ� �����ϴ� �������� ���������ڡ�. ������ �簢���뿡 ���� �̵��� ���� ã�ư��� ���� Ȱ��������, ����С���ȸ�����С������� �ѳ���� �������� �ð��� �������� ������ ������ ���������� ������ �̷��� ��븦 �����ϴ� �� �����ؿ� �������� ������ ������ �ΰ� �ɸ��� ���� �������� �ֽ� ����, ���忡�� ����� ������ ���, �л���� ������ �����ؿ� ��м����� ���������� �м����������� �پ��� ������ ������ �츮 �ϻ� ������ ������ ������ �������� �����ϰ� ��Ƴ´�.', 1001, 244, 13500, 5, 7);  
         
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9788971543429', '��ȸ���� �̰���', '������', '�����ֿ��� �̰���� ����ģ�ơ��̸鼭 ù����̾����ϴ�. �̺��� ���� �ڿ� �ٽ� ���� ��ȥ�ϱ���� 10���� �ɷȽ��ϴ�. ������ ��ȥ�� ���� ���� �����⸦ ���� �� 3�� ���� ���� ���� ���� ���� ���� �ູ�� ���ڰ� �Ǿ��� ��, ������� ������ ���Ƚ��ϴ�. ��� �� �� �޵� �Ǳ� ���� ������ ������� 4�⡯ ������ ���� ���Դϴ�. �׶� ������(1983���)�� ���б� ���Ǳ��翴��, ���� �̰���(1979���)�� �۷ι� ITȸ���� ���� �ڸ���(Qualcomm Korea)�� �������� ��������� ���翴���ϴ�.', 1002, 288, 13500, 5, 8);
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9791159036514', '���̾�(���Ǻ�)(��Ŀ�� ������)', '�츣�� �켼', '��Ŭ����� �θ��� ������ �����˰� �⵶�� �ž��� ����ħ �ȿ��� �ڶ�� ����� �ҳ��̾���. �״� �θ� ǰ���ִ� ���� ���谡 �ִ� ����� �ӿ��� �ȶ��� ��������, ���ÿ� �θ��� ���� �ۿ� �ִ� ����� ���迡�� �η���� �Բ� ȣ����� ���� �����ϰ� �־���. �װ��� ���δ� �弳�� �ο��� �־�����, ���δ� ������ ������ ������ �׸� ��Ȥ�ϰ� �־���. ��Ŭ����� �ڽ��� ȯ�����κ��� ������ ����� �� ���踦 �߰��ϰ� ��� ������ ǰ���鼭, ��� ������ ������ ������ ���� ä �����ϰ� �ȴ�.', 1002, 248, 10800, 5, 9);         
         
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9791190065672', '�ڸ��� �̴�� ���� �� ����(��ť �����) ', '�ڸ���', 'å ����', 1003, 344, 13320, 5, 10); 
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9791162202913', '��� ������ �ʿ���', '���¿�', '���, û��, � ���� �᳻�� �� �������� ��#�ʿ��ԡ��� SNS�� ���� ������� ���¿� �۰��� �� ��° ������ ����� ������ �ʿ��١�. ���ιް� ���� ��, ������ ���� ��, ������� ��ó�޾��� ��, ���� ��� ������ Ư���� ���ο� ������ �ǳ״� �̾߱⸦ ��Ҵ�.', 1003, 272, 12420, 5, 11); 
 
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9791196394578', '�װ� ������ �����̴� �԰� �;�. 2', '�鼼��', '10�� �Ѱ� ��к������(������ ��� ������ ���ӵǴ� ����)�� �Ҿ���ָ� ������ ���Ű� �����ǿ� ������ 12�ְ��� ��ȭ�� ���� �ʱ� ���� ���븦 Ǯ�� �� �Ϳ��� ���۵� ���װ� ������ �����̴� �԰� �;�� 2018�� �� �� ū ����� �޾Ҵ� �鼼�� �۰��� 1�ǿ� ���� ���� ���ߴ� ������ ������ �� ���Ŀ� �̾��� 16�ְ��� ������� ���� ���װ� ������ �����̴� �԰� �; ��2��.', 1004, 264, 12420, 5, 12); 
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9791196394547', '������� �ʰ� ����� ���ϴ� ���', '������', '�Ӹ����� �����, �������� ô�ϰ�, ������ ����� ��ȭ�� �̾�� �Ϳ� �ͼ����� �츮�� ���� ��¥ ������ �ְ� ���� ��� �տ��� ����ó�� ������. ����� ����ϰ�, ����� ������ ��ȭ �ӿ��� ������ ������ ���صɱ� �����ϱ� �ٻڴ�. ��¼�� �츮�� �����ϰ� ������ ������ ��ó�� �ְ���� �ʰ� ������. ��� �ؾ� ���� ���� ���ʡ����� ������ �� ������.', 1004, 292, 13320, 5, 13); 
 
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9788956056609', '�ٽ�, å�� ������', '�ڿ���', '�����̶�� ������ �� �ִ� ������ ������, ���� ����� �͡��̶�� ���� ���ϴٰ� �������� ������ �ִ�. �ٷ�, ����Ʈ���� ��å�� �����١��� ���� �ڿ����� ������ �׷��ϴ�. �׷� �װ� ��å�� �����١� ���� 5�� ���� �ڽ��� �̸��� ������ �ι��� ����ȸ�� ���ƿԴ�. ��ΰ� �ļ����� �����⸸�� ��ٷ��Դ� å, �׷��� ���� ���ٽ�, å�� �����١��̴�.', 1005, 349, 14400, 5, 14);
INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
         VALUES (SEQ_BOOK.NEXTVAL, '9788956055619', '���� �׸�å�� ����', '������', '������ �׸�å�� �������� ���̵��� ���ζ�� ��Ŀ��� ��� �б⸦ ���� ���� �Ƿ��� Ű�� �� �ֵ��� �����ִ� å�̴�. ������ ���� ������ ��� ������ ����̶�� �� �� �ִµ�, �� å�� �׷� ����� �ذ� ����� �������ش�. ���� ��̰�, ��� �ִ� ���� ��� ��� �� �ֵ��� ���� �׸�å�� �Ұ��� ��. �ǻ�Ȱ���� ���� �ڿ������� ǥ���� ���� �� �ְ�, ���������� ��µ��� ȿ�����̴�.', 1005, 376, 13500, 5, 15);         
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
    ���ǻ� ��ȣ�� ���ǻ� �̸��� �ڵ�� ����
    ���ǻ� ���� �ڵ�� 1000���밡 ���ǻ� �ڵ�
    �ڼ��� ���� ���ǻ��� ������ 1001, 1002, 1003, ... ������ �����ϵ��� ���� �����͸� �ְ� ����
    -------------------------------------------------------------------------------
    ������ ���� �ּ����� �����͸� �ְ� �����ؾ� ��ȸ�� ��!! �ݵ�� �⺻ �����͸� �־������
*/

