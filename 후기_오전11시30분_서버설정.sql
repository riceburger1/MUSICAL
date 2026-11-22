-- 첫사랑 뮤지컬 후기 작성 가능 시간: 2026-11-22 11:30 KST
-- 기존 응원 및 후기 게시글은 삭제하지 않습니다.
BEGIN;
DROP POLICY IF EXISTS firstlove_public_create ON public.firstlove_messages;
CREATE POLICY firstlove_public_create
ON public.firstlove_messages
FOR INSERT TO anon, authenticated
WITH CHECK (
  kind = 'cheer'
  OR (kind = 'review' AND now() >= timestamptz '2026-11-22 11:30:00+09')
);
COMMIT;
-- 적용 결과 확인
SELECT policyname, cmd, with_check
FROM pg_policies
WHERE schemaname='public' AND tablename='firstlove_messages'
  AND policyname='firstlove_public_create';
