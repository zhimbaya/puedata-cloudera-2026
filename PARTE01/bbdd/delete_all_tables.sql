-- **********************************************************************
-- Borrar Constraints
ALTER TABLE IF EXISTS royalties DROP FOREIGN KEY fk_royalties_title_id;
ALTER TABLE IF EXISTS titles DROP FOREIGN KEY fk_titles_pub_id;
ALTER TABLE IF EXISTS title_authors DROP FOREIGN KEY fk_title_authors_title_id;
ALTER TABLE IF EXISTS title_authors DROP FOREIGN KEY fk_title_authors_au_id;
ALTER TABLE IF EXISTS emp DROP FOREIGN KEY fk_emp_ref_dept;
ALTER TABLE IF EXISTS jobhist DROP FOREIGN KEY fk_jobhist_ref_emp;
ALTER TABLE IF EXISTS jobhist DROP FOREIGN KEY fk_jobhist_ref_dept;


-- **********************************************************************
-- Borrar tablas
DROP TABLE IF EXISTS royalties;
DROP TABLE IF EXISTS title_authors;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS publishers;
DROP TABLE IF EXISTS new_publishers;

DROP TABLE IF EXISTS employees;

DROP TABLE IF EXISTS test_scores ;

DROP TABLE IF EXISTS jobhist ;
DROP TABLE IF EXISTS emp ;
DROP TABLE IF EXISTS dept ;
DROP TABLE IF EXISTS salgrade ;
