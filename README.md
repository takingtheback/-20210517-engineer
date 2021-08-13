# -20210517-20211105 BigData engineer Process
   
# 1번째 자바 미니프로젝트 - 회원관리(Java)
  - 자바 기능을 활용하여 CRUD 항목을 수행할 수 있도록 제작
  - 장점
    - 짧은 기간내에 배운 많지 않은 지식으로 CRUD의 전 기능을 구현
  - 단점
    - 로그인한 회원 정보를 유지할 수 없는 한계점으로 인하여 회원정보 메뉴가 지저분하게 설계되는 아쉬움
    - static 메서드의 무분별한 남발
    - ArrayList, Map 등에 대한 이해도가 전무해 기능을 전혀 구현해내지 못함
 

# 2번째 JDBC 미니프로젝트 - 회원관리(Java + Oracle SQL) + 게시판기능
  - 장점
    - 기존 회원관리 + 로그인항목을 추가하여 서블릿에서 배울 session 개념으로 대체
    - 로그인 회원 정보를 1로 반영하여 1인 회원에 대한 정보값을 출력하는 방식으로 작성
    - 1번째 프로젝트에서 생겼던 지저분한 회원메뉴 개선
    - 1번째 프로젝트에서 생각없이 남발한 static 함수들 제거
    - 회원관리, 게시판 두가지 테이블에 대한 기능 구현
    - 게시판에서 like 항목을 이용한 일부 조건문만 입력하여도 검색되도록 작성
  - 단점
    - 여전히 사용자관점에서 불편한 UI 설계로 메뉴입력 반복
    - 로그인 항목이 1로 표시된채 온라인에 연결된다면 생길 수 있는 많은 보안이슈와 문제점들
    - 불필요하고 중복된 코드들 산재
    

# 3번째 WebUI 미니프로젝트 
  - 첫 그룹 프로젝트 
  - 담당기능 : 로그인 페이지, 비밀번호 찾기 페이지
  - 사용기능
    - 로그인
    - 카카오 로그인 API 사용
    - 네이버 로그인 API 사용
    - 구글 로그인 API 사용(아이콘 사이즈 못맞춰서 최종에서 탈락)
    - 비밀번호 찾기 페이지에서 아이디 이메일 입력시 해당 이메일로 인증메일 발송
    -> EmailJS API 사용, 랜덤함수를 부모창에서 자식창으로 전달 후 검증하는 기능 추가
    - 비밀번호와 비밀번호 확인이 동일하면 변경

  - 문제점
    - 팀에서 지정된 색상코드와 동떨어진 배경설정
    - 구글 API를 성공했음에도 불구하고 css 마무리를 못해 아이콘을 집어넣지 못함
    - 구글 API 연동시 발생되는 문제들 시간내 해결 못함
    - 비밀번호 변경 후 자식창이 닫히고 로그인창으로 변경되도록 설계하였으나 마지막 실행시 작동안됨
    - 프로젝트 마감까지 충분한 시간이 남았음에도 다른 기능 구현 생각 안함


# 4번째 SpringBoot 중간프로젝트
  - 스프링부트를 이용한 Web Service 프로젝트
  - 담당영역
    >> Front : MyPage,FaQ, MainPage, Chat, ContactMail, QnA
  - 담당기능
    >> 문의게시판 CRUD, 페이징기능, 조회수 증가
    >> WebSocket 채팅
    >> EmailJS API 이용한 메일발송
    >> Git utterances 이용한 댓글기능
  - 작업일지: https://docs.google.com/spreadsheets/d/1jENdIVo4ApYGiXRLbir6EyPEVjGdDAUm/edit#gid=436256202
  

