
-- user 등록
INSERT INTO users(user_id, user_pw, user_name)
    VALUES('aaa','aaa','zzzkkk');
INSERT INTO users(user_id, user_pw, user_name)
    VALUES('bbb','bbb','매우어려워');
INSERT INTO users(user_id, user_pw, user_name)
    VALUES('ccc','ccc','김기호');
INSERT INTO users(user_id, user_pw, user_name)
    VALUES('ddd','ddd','팡소리');
INSERT INTO users(user_id, user_pw, user_name)
    VALUES('eee','eee','fender');
INSERT INTO users(user_id, user_pw, user_name)
    VALUES('fff','fff','하이위');
INSERT INTO users(user_id, user_pw, user_name)
    VALUES('ggg','ggg','코딩짱');   
INSERT INTO users(user_id, user_pw, user_name)
    VALUES('hhh','hhh','wowwowwow');   
INSERT INTO users(user_id, user_pw, user_name)
    VALUES('iii','iii','ANACODER');       
INSERT INTO users(user_id, user_pw, user_name)
    VALUES('jjj','jjj','Prac0311');   
INSERT INTO users(user_id, user_pw, user_name)
    VALUES('kkk','kkk','iOS_Moya');       
INSERT INTO users(user_id, user_pw, user_name)
    VALUES('lll','lll','이정석');
INSERT INTO users(user_id, user_pw, user_name)
    VALUES('mmm','mmm','이콰레이서');     
INSERT INTO users(user_id, user_pw, user_name)
    VALUES('nnn','nnn','개발');
    commit;



-- 게시글 등록
INSERT INTO bulletin(board_no, writer, user_name, title, content, post_time)
    VALUES(SEQ_BOARD.nextval, 'nnn', '개발', 'nodejs 세션설정 도움이 필요합니다ㅠㅠ', '로그인하면서 세션을 설정하고싶은데 구글보고 미들웨어설정을 똑같이했는데 세션설정이안되네요 ㅠㅠ 
이것때문에 지금 몇시간째 찾고있는데 도움이 절실합니다 ㅠㅠ mysqlstore를 사용하였고 데이터베이스에 sessions테이블은 만들어졌는데 값이 들어가질않습니다 ㅠㅠ', sysdate);

INSERT INTO bulletin(board_no, writer, user_name, title, content, post_time)
    VALUES(SEQ_BOARD.nextval, 'bbb', '매우어려워', 'ajax 질문드립니다.', '안녕하세요
spring으로 회원가입 페이지 구현중입니다.
아이디 중복확인은 ajax로 구현하고있는데
테스트해보면 sql문에 자동으로 =가 붙어서 제대로 실행이 안됩니다.
데이터로 유저아이디 하나 보내는건데 =이 왜 붙어나오는건지 잘 모르겠네요', sysdate);

INSERT INTO bulletin(board_no, writer, user_name, title, content, post_time)
    VALUES(SEQ_BOARD.nextval, 'fff', '하이위', '객체지향 공부중에 궁금한점입니다', 'jsp, 스프링을 배우기 이전에 자바 복습할겸 과거 대학교 수업에서 어렴풋이나마 배웠던 객체지향을 다시 한번 제대로 해보고 있습니다.
공부를 하면 할 수록 객체지향이라는 개념이 참 어렵더라구요
한 클래스 파일에 짜여진 코드를 topDown방식으로 쪼개는것도 버거운데
bottomUp으로 처음부터 작성해보려니 어디서부터 작성을 해야하는지 감이 안잡히더라구요
저는 일단 통짜로 만들고 그것을 추후에 topDown방식으로 바꾸려고 하는데 이렇게 공부해도 괜찮을지 궁금하기도 하고 또 어떻게 공부를 해야 좀 더 효율적일지 궁금합니다.
감사합니다!!', sysdate);

INSERT INTO bulletin(board_no, writer, user_name, title, content, post_time)
    VALUES(SEQ_BOARD.nextval, 'ddd', '팡소리', '사수 때문에 고민입니다', '안녕하세요. 얼마전에 취업했는데 고민이 생겨서요
사수가 과묵히 자기 할일만 해요. 
개발 환경 셋팅 문제로 정상 실행도 안되는 코드 던져주고 분석하라고 하는데
가이드가 하나도 없어요. 주석으로 막을거 막아놓고 어거지로 디버깅 하면서 따라가는데
문서도 없고 주석도 없는 코드는 신입 냄새 풀풀 풍기는 저에게는 버거워서
분석이 안되더라구요. 도저히 안되겠어서 코드 분석 미루고
다른 소규모 프로젝트를 혼자 진행 중인데 
다른 회사도 엇비슷한지.. 분위기가 궁금합니다.   그렇지 않은 회사가 많다면 이직을 준비하게요.
엇 비슷하면 이직해도 소용이 없으니 이걸 이겨내야할텐데
이걸 어떤 식으로 이겨내야 좋을지 조언 부탁드려요', sysdate);

INSERT INTO bulletin(board_no, writer, user_name, title, content, post_time)
    VALUES(SEQ_BOARD.nextval, 'eee', 'fender', '신입 개발자를 위한 간단한 포트폴리오 작성 팁
', '우선 이는 전적으로 제 개인적인 기준이며, 저 또한 오직 이러한 내용으로 만 포트폴리오를 평가하지 않는다는 점을 전제로 글을 쓰겠습니다.
전 신입 개발자 면접을 볼 때 항상 코드 예제를 요구하는데, 이는 소스 코드만 보면 생각보다 개발자의 수준이나 습관 등에 대해 많은 것을 알 수 있기 때문입니다.
저는 신입 개발자를 뽑는다면 해당 지원자가 개발 자체에 흥미를 느끼고 적성을 가지고 있는지를 가장 중요하게 생각합니다. 그리고 이는 어느정도 제출하는 포트폴리오의 내용에서도 드러나는 내용이기도 합니다.
예컨대 포트폴리오를 받았는데 파워포인트에 멋진 디자인의 최종 화면의 스크린샷이 잔뜩 들어있고 정작 소스 코드는 프리젠테이션에 일부 복사 붙여넣기를 했다거나 하는 경우는 아마도 취업 대비 학원 같은 데서 하라는 대로 작성한 내용일 가능성이 높습니다.
만일 제출한 깃헙 저장소에 "classes" 같은 경로가 통째로 올라가 있다면 해당 지원자가 소스 저장소의 개념을 마치 웹 드라이브 처럼 생각하는 것이 아닌지 의심해볼 여지가 있는 것이나 비슷한 문제입니다.
물론 앞서 말씀드린대로, 전 이런 내용 만을 가지고 지원자의 모든 것을 판단하지는 않으려고 노력합니다. 하지만 이런 사소한 부분에서 의외로 지원자의 개발 경험이나 습관 등에 대해 생각보다 많은 내용을 유추할 수 있는 것도 사실입니다.
다른 회사에서도 이런 부분을 신경 쓰는지까지는 잘 모르겠습니다만, 그래도 포트폴리오를 준비하는 신입 개발자라면 조금 신경써서 보완해도 괜찮을 내용이라고 생각해서 적어 보았습니다.', sysdate);

INSERT INTO bulletin(board_no, writer, user_name, title, content, post_time)
    VALUES(SEQ_BOARD.nextval, 'ggg', '코딩짱', 'mysql 컬럼 별칭 설정
', 'SELECT ID AS KEY, NAME AS VALUE FROM place
제가 위와같이 ID를 KEY라고 명칭하고, NAME를 VALUE로 명칭해 사용하고 싶은데
KEY 라고 설정한 부분이 오류가 납니다. 다른 이름으로 설정하면 오류가 안 나던데 이유가 뭔가요??', sysdate);

INSERT INTO bulletin(board_no, writer, user_name, title, content, post_time)
    VALUES(SEQ_BOARD.nextval, 'hhh', 'wowwowwow', '파이썬에서 여러개의 함수를 동시에 실행할수 있나요?
', '파이썬에서 채팅 만드는중인데 여러함수를 동시에 실행할수 있나요?', sysdate);

INSERT INTO bulletin(board_no, writer, user_name, title, content, post_time)
    VALUES(SEQ_BOARD.nextval, 'iii', 'ANACODER', '톰캣이 가끔 죽네요ㅠ DBCP 질문입니다,,
', '대략 300명정도의 사용자를 대상으로 웹서비스를 제공하고 있는데요
간혹 서비스 중에,, DB연결로 인해서 뭔가 톰캣이 죽어버리는 느낌이 듭니다. 그때마다 재시작합니다 ㅠ
(에러 메시지가 있었는데 캡쳐해놓은게 없어졌네요 ㅠㅜ)
혹시 DBCP 관련 셋업에 문제가 있어서 그런지 궁금해서 server.xml을 열어보니
maxActive=30, maxIdle=15로 지정되어있습니다
검색을 해보니..maxActive, maxIdle 같은값이 좋다고 하는데 맞을까요?
', sysdate);

INSERT INTO bulletin(board_no, writer, user_name, title, content, post_time)
    VALUES(SEQ_BOARD.nextval, 'jjj', 'Prac0311', '알려지지 않은 웹포트 빨리 찾는 방법 있나요?
', '개발자 입장은 아니고 취약점 진단하는 사람 입장에서 nmap이나 port scanner 돌렸을 때 80,443,8080 이런 기본 포트가 아니라
웹 개발자가 지정한 포트(5453 와 같은..)일 때 웹이라고 표시되지 않아서
일일이 들어가서 웹인지 확인해야하는 번거로움이 있습니다.
예를들어  port 스캐너의 경우 1.1.1.1 을 포트스캔한다고 치면
만약 4000~6000번 사이에 포트가 다 열려있다라고 하면 
어떤 포트가 웹인지 확인하기 위해
1.1.1.1:4000, 1.1.1.1:4001 ~~ . .. 1.1.1.1:6000  이렇게 일일이 웹에서 접속을 해봐야할겁니다.
너무 노가다죠.. 이걸 자동화할 수 있는 방법이 있을란지요. 
', sysdate);

INSERT INTO bulletin(board_no, writer, user_name, title, content, post_time)
    VALUES(SEQ_BOARD.nextval, 'kkk', 'iOS_Moya', 'iOS개발 소기업 근무 VS 네이버 부스트캠프
', '현재 10인정도되는 기업에서 iOS 개발을 한지 3개월이 되었습니다.
네이버 부스트캠프가 유명하기도 하고, 업무를 하면서 스스로 문제들을 해결할 줄은 알겠으나,
맞는방법인지에 대한 의문도 들고, 오래 성장하기 위해서는 교육과 커뮤니티가 필요하지 않나라는 생각을 했습니다.
또한 네이버 부스트캠프 자체가 공신력과 어느정도 취업에 대한 기회도 밝구요.
혹시 경험자이시거나 경력자분들에게 만약 저라면 어떠한 선택을 하셨을지 여쭙고 싶습니다.
쓴소리든 어떤 말씀이든 부탁드립니다!
', sysdate);

INSERT INTO bulletin(board_no, writer, user_name, title, content, post_time)
    VALUES(SEQ_BOARD.nextval, 'lll', '이정석', '질문이요...
', 'ip공유해서 쓰는 컴퓨터에(클라이언트) tomcat+apache 연동해서
웹서버 구축이 가능한지요. 저는 안될 것 같은데, 만일
구축이 된다면 다른 컴퓨터에서 접근하려면 어떻게
해야 합니까?
', sysdate);

INSERT INTO bulletin(board_no, writer, user_name, title, content, post_time)
    VALUES(SEQ_BOARD.nextval, 'mmm', '이콰레이서', '에러페이지 리다이렉트 질문드려요
', 'jeus + webtob 환경인데요
web.xml 에 404와 503등등 error.jsp로 설정해줬는데 리다이렉트가 안되길래 웹투비 환경파일
http.m 에 404와 503 등등 적어주고 error.html 파일만들어서 여기로 리다이렉트 설정해주니 그제서야 error.html로 리다이렉트가 되더군요.. 이거 왜이런걸가요.. web.xml에 설정해준건 안되고.. 웹투비쪽에 해준건 리다이렉트가 되고.. 왜이런건지 궁금해서 질문드려요!
', sysdate);
commit;

-- 댓글
INSERT INTO  reply(reply_no, board_no, writer, user_name, content, reply_date)
VALUES(SEQ_REPLY.nextval, 1, 'aaa', 'zzzkkk', 'router 와 session 미들웨서 순서를 바꿔야 req.session 이 더 이상 undefined가 나오지 않을겁니다.', sysdate);

INSERT INTO  reply(reply_no, board_no, writer, user_name, content, reply_date)
VALUES(SEQ_REPLY.nextval, 1, 'fff', '하이위', 
'개념을 잡기에 도움 되시라고 몇 글자 더 적어드립니다.
코드가 실행 될때, node는 위에서부터 아래로 컨텍스트를 뜹니다(다른 말로 스택을 쌓는다).
원래 코드 기준으로
로그인 router를 타고가서 loginRouter 코드를 실행한다고 하면
그때 app.use(session())이 설정 되지 않았던 것입니다.', sysdate);

INSERT INTO  reply(reply_no, board_no, writer, user_name, content, reply_date)
VALUES(SEQ_REPLY.nextval, 12, 'jjj', 'Prac0311', 
'키워드라서요.`KEY` 와 같이 backtick 으로 감싸서 해보세요.', sysdate);

INSERT INTO  reply(reply_no, board_no, writer, user_name, content, reply_date)
VALUES(SEQ_REPLY.nextval, 12, 'nnn', '개발', 
'예약어, 키워드는 가급적 피하시는 게 좋습니다', sysdate);

INSERT INTO  reply(reply_no, board_no, writer, user_name, content, reply_date)
VALUES(SEQ_REPLY.nextval, 8, 'nnn', '개발', 
'예약어, 키워드는 가급적 피하시는 게 좋습니다', sysdate);
commit;