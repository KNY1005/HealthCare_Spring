[HealthCare]

-프로젝트 주소 : http://jjezen.cafe24.com/HealthCare/

- 기간 : 2022.12.12~2023.02.17

- 개발 인원 : 4

- 서비스의 정의 : 보건 의료에 대한 정보 서비스 통합화를 통해 예방 접종, 건강 검진 예약 및 정보 제공과 현업 의료진과의 1:1 의사 소통 제공

- 개발 환경 및 관리 도구 : Apache Tomcat 9.0v, jdk1.6, Spring Framework, My batis 3.4.1, MySQL 8.0.24, Github

- 프로그래밍 언어 : Java, JavaScript, HTML, CSS, JSTL

- 주요 업무 : 
▶ UX / UI기획 디자인 및 제작
메인화면 및 다양한 UI 디자인을 총괄하여 제작하였습니다. 
이 과정에서는 사용자 경험과 시각적 효과를 최적화하기 위해 사용자 인터페이스(UI) 요소들을 설계하고 구성했습니다. 
UI 요소들은 노령화 시대에 맞춰 노약자분들이 쉽게 이해하고 상호작용할 수 있도록 디자인되었으며, 일관된 디자인 양식과 시각적 일관성을 유지하였습니다.
또한, 색상, 레이아웃, 아이콘, 버튼 등의 디자인 요소들을 섬세하게 조정하여 사용자에게 직관적이고 매력적인 환경을 제공하도록 노력했습니다. 
이를 통해 사용자들이 웹 페이지나 애플리케이션을 보다 쾌적하게 이용할 수 있도록 하였습니다.

▶ 관리자페이지
데이터베이스에서는 일반 회원과 관리자 간의 권한 차별을 위해 관리자 유무를 구별하는 번호를 할당하고, 이를 활용하여 관리자로 로그인할 경우 추가적인 유효성 검사를 수행하여 관리자 전용 페이지를 동적으로 렌더링하도록 구현하였습니다.

▶ 마이페이지
사용자가 마이 페이지를 클릭하면 해당 사용자의 고유한 식별자인 midx를 주소 뒷부분에 추가하여 요청하면, 해당 사용자에게 특화된 동적 페이지를 생성하여 엽니다. 
이 페이지에서는 개인 정보 수정 및 해당 사용자가 작성한 글을 조회할 수 있습니다. 
게시판에서는 해당 사용자가 작성한 게시물을 동적으로 로딩하여 마이 페이지에서 표시하며, 사용자가 게시물을 클릭하면 해당 게시글 페이지로 이동됩니다. 
또한, 사용자의 개인 정보는 사용자 테이블에서 가져와 비밀번호를 입력하면 수정할 수 있도록 되어 있습니다. 
추가로, 헌혈, 예방접종, 건강검진 예약 정보를 별도의 페이지를 통해 조회할 수 있도록 구현되었습니다.

▶ 로그인, 아웃 및 회원 가입
회원가입 과정에서 전문의 회원과 일반 회원으로 구분하여 선택할 수 있도록 설정하였습니다. 
전문의 회원은 의사면허 번호를 입력하면 해당 번호가 DB에 저장된 면허번호와 일치해야만 회원가입이 완료되도록 구현하였습니다.
주소 등록 시, 정확성을 높이기 위해 도로명주소 API를 활용하여 주소를 검색한 후 자동으로 입력되도록 하였습니다.
또한, 보안을 강화하기 위해 사용자의 비밀번호는 SHA-256의 단방향 암호화 알고리즘을 적용하여 암호화한 후 16진수 문자열 형태로 DB에 저장하였습니다.

▶ 아이디, 비밀번호 찾기
아이디 찾기 기능은 회원가입 시 필수로 입력하는 아이디와 전화번호를 입력하면 해당 정보에 해당하는 사용자를 화면에 표시합니다.
비밀번호 찾기 기능은 저장된 SHA-256 단방향 암호화 알고리즘으로 인해 비밀번호를 다시 불러오는 것이 불가능하기 때문에, 아이디, 이름, 핸드폰번호를 입력하면 시스템이 랜덤 문자열 8자를 생성하여 화면에 표시하도록 구현되었습니다.

▶건강 소식 및 자가 진단
건강 소식 게시판은 질병관리청 채널의 영상들을 유튜브 API를 활용하여 불러와서 사용자가 해당 페이지에서 바로 시청할 수 있도록 구현하였습니다. 
자가진단 기능은 코로나, 감기, 독감의 질병 특징을 조사하여 14개의 질문을 포함하고 있으며, 사용자가 모든 질문에 예, 아니오로 체크 후완료 하면 알럿창이 표시되어 어떤 질병에 속하는지 뜨게 구현했습니다.

- 성과 및 결과(실제 서비스를 했다면 기대 효과) :

▶건강 검진 예약 서비스:
- 사용자들은 이 서비스를 통해 건강 검진 예약을 간편하게 진행할 수 있습니다. 이로써 예약을 위한 복잡한 절차나 시간 소요를 줄일 수 있어, 사용자들의 일상에 편의성을 제공합니다.

▶ 예약 관리 및 의사소통:
- 서비스는 사용자들의 예약 관리를 효과적으로 지원하여 병원과 사용자 간의 의사소통과 협력을 강화합니다. 예약 변경이나 취소와 같은 사항들을 신속하게 처리함으로써, 병원의 업무 효율성을 향상시키고 사용자들에게 편의성을 제공합니다.

▶ 전문 의사 소통:
- 전문 의료진과의 1:1 의사 소통 기능은 사용자들이 의료에 관한 질문이나 우려를 더 신속하고 정확하게 해결할 수 있도록 돕습니다. 이를 통해 사용자들은 의료 서비스에 대한 신뢰를 높이고, 전문적인 의견에 기반한 안내를 받을 수 있습니다.

- 테스트용 ID : wjsansdml / 1111 [전문의 회원], dlfqks / 1111 [일반 회원], rhksflwk123 / 1111 [관리자 회원]
