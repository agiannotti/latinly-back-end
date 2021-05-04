BEGIN;

TRUNCATE
  "word",
  "language",
  "user";

INSERT INTO "user" ("id", "username", "name", "password")
VALUES
  (
    1,
    'admin',
    'agiannotti',
    -- password = "password"
    '$2a$10$fCWkaGbt7ZErxaxclioLteLUgg4Q3Rp09WW0s/wSLxDKYsaGYUpjG'
  );

INSERT INTO "language" ("id", "name", "user_id")
VALUES
  (1, 'Latin', 1);

INSERT INTO "word" ("id", "language_id", "original", "translation", "next")
VALUES
  (1, 1, 'ad hoc', 'to this', 2),
  (2, 1, 'bona fide', 'with good faith', 3),
  (3, 1, 'multi', 'many', 4),
  (4, 1, 'impromptu', 'spontaneous', 5),
  (5, 1, 'bonus', 'good', 6),
  (6, 1, 'et cetera', 'and soon', 7),
  (7, 1, 'carpe diem', 'seize the day', 8),
  (8, 1, 'de facto', 'in fact', null);

UPDATE "language" SET head = 1 WHERE id = 1;

-- because we explicitly set the id fields
-- update the sequencer for future automatic id setting
SELECT setval('word_id_seq', (SELECT MAX(id) from "word"));
SELECT setval('language_id_seq', (SELECT MAX(id) from "language"));
SELECT setval('user_id_seq', (SELECT MAX(id) from "user"));

COMMIT;
