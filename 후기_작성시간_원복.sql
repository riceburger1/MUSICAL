-- 첫사랑 뮤지컬: 후기 작성 개방시간 원복 (2026-11-22 14:30 KST)
-- Supabase firstlove-musical > SQL Editor에서 실행합니다.
-- 기존 댓글 데이터는 삭제하거나 수정하지 않습니다.
BEGIN;
DROP POLICY IF EXISTS firstlove_public_create ON public.firstlove_messages;
CREATE POLICY firstlove_public_create
ON public.firstlove_messages
FOR INSERT TO anon, authenticated
WITH CHECK (
  kind = 'cheer'
  OR (kind = 'review' AND now() >= timestamptz '2026-11-22 14:30:00+09')
);
COMMIT;

-- 적용 후 확인: with_check에 2026-11-22 14:30:00+09가 표시되어야 합니다.
SELECT policyname, cmd, with_check
FROM pg_policies
WHERE schemaname = 'public'
  AND tablename = 'firstlove_messages'
  AND policyname = 'firstlove_public_create';
