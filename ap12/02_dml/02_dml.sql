INSERT INTO alunos (id, nome, nota) VALUES (1, 'Yuri', 10.00);
INSERT INTO alunos (id, nome, nota) VALUES (2, 'Renato', 5.9);
INSERT INTO alunos (id, nome, nota) VALUES (3, 'Pig', 3.5);

UPDATE alunos SET nota = 9 WHERE id = 2;

DELETE FROM alunos WHERE NOTA < 5;