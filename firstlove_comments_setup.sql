-- Supabase SQL Editor에서 한번 실행하세요.
-- 기존 다른 프로젝트의 테이블을 수정하지 않고 첫사랑 전용 테이블만 생성합니다.
create table if not exists public.firstlove_messages (
 id bigint generated always as identity primary key,
 kind text not null check (kind in ('cheer','review')),
 display_name text not null check (char_length(btrim(display_name)) between 1 and 30),
 body text not null check (char_length(btrim(body)) between 1 and 1000),
 created_at timestamptz not null default now()
);
create index if not exists firstlove_messages_kind_created_idx on public.firstlove_messages (kind, created_at desc);
alter table public.firstlove_messages enable row level security;
revoke all on public.firstlove_messages from public, anon, authenticated;
grant select, insert on public.firstlove_messages to anon, authenticated;
-- 기존 정책 중 동일 이름만 안전하게 교체
drop policy if exists firstlove_public_read on public.firstlove_messages;
create policy firstlove_public_read on public.firstlove_messages for select to anon, authenticated using (true);
drop policy if exists firstlove_public_create on public.firstlove_messages;
create policy firstlove_public_create on public.firstlove_messages for insert to anon, authenticated
with check (kind='cheer' or (kind='review' and now() >= timestamptz '2026-11-22 14:30:00+09'));
