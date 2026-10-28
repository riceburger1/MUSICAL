26년 추수감사절 창작뮤지컬 《첫사랑》 앱

파일 구성
- index.html : 앱 본체
- poster.jpg : 포스터
- supabase_setup.sql : 온라인 댓글 공유용 데이터베이스 설정

[바로 확인]
index.html을 더블클릭하면 5개 탭을 확인할 수 있습니다.
기본 상태에서 응원메시지/후기는 해당 브라우저에만 저장됩니다. 다른 사람이 올린 글은 보이지 않습니다.

[모든 방문자가 메시지 공유하도록 설정]
1. Supabase 프로젝트를 준비합니다.
2. SQL Editor에서 supabase_setup.sql을 실행합니다.
3. index.html 하단의 SUPABASE_URL, SUPABASE_ANON_KEY에 프로젝트 URL과 공개용 anon/publishable 키를 입력합니다. service_role 비밀키는 절대 입력하지 마세요.
4. index.html과 poster.jpg를 함께 GitHub Pages에 업로드합니다.
5. 공개 게시판 스팸 및 부적절한 게시물 방지를 위해 실운영 시 CAPTCHA, 요청 제한, 관리자 삭제 절차를 마련하세요.

[출연자 정보]
직분은 요청에 따라 생략했습니다. 원본의 모든 출연자 및 스태프 명단을 반영했습니다.
