-- Supabase SQL Editor에서 한 번 실행합니다. 공개 게시판이므로 스팸 및 부적절한 글의 운영 관리가 필요합니다.
create table if not exists public.firstlove_messages (
  id bigint generated always as identity primary key,
  kind text not null check (kind in ('cheer','review')),
  display_name text not null check (char_length(trim(display_name)) between 1 and 30),
  body text not null check (char_length(trim(body)) between 1 and 1000),
  created_at timestamptz not null default now()
);
create index if not exists firstlove_messages_kind_created_idx on public.firstlove_messages(kind,created_at desc);
alter table public.firstlove_messages enable row level security;
revoke all on public.firstlove_messages from anon, authenticated;
grant select, insert on public.firstlove_messages to anon, authenticated;
create policy "firstlove_public_read" on public.firstlove_messages for select to anon, authenticated using (true);
create policy "firstlove_public_insert" on public.firstlove_messages for insert to anon, authenticated with check (
 kind in ('cheer','review') and char_length(trim(display_name)) between 1 and 30 and char_length(trim(body)) between 1 and 1000
);
-- 개인정보/악성 댓글을 관리자가 Supabase Table Editor에서 삭제할 수 있습니다.
-- 운영 전 CAPTCHA / 요청 제한 등의 스팸 방지 설정을 추가하는 것을 권장합니다.
