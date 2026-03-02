-- pub_id en tabla titles apuntando a publisher que no existe
-- INSERT INTO titles VALUES('T70','1977!','history','P99',107,21.99,566, '2000-08-01',1);

-- Foreign keys incorrectas en title_authors
-- INSERT INTO title_authors VALUES('T99','A01',1,1.0);
-- INSERT INTO title_authors VALUES('T02','A99',1,1.0);
-- INSERT INTO title_authors VALUES('T99','A99',1,1.0);

-- Páginas igual a 0
-- INSERT INTO titles VALUES('T70','1977!','history','P01',0,21.99,566, '2000-08-01',1);

-- Title id con formato erróneo: X70
-- INSERT INTO titles VALUES('X70','1977!','history','P01',10,21.99,566, '2000-08-01',1);

-- Title id con formato erróneo: TAA
-- INSERT INTO titles VALUES('TAA','1977!','history','P01',10,21.99,566, '2000-08-01',1);

-- Precio menor que 0
-- INSERT INTO titles VALUES('T70','1977!','history','P01',107,-3.1,566, '2000-08-01',1);

-- Precio no inferior a 100
-- INSERT INTO titles VALUES('T70','1977!','history','P01',107,200.01,566, '2000-08-01',1);

-- Ventas negativas
-- INSERT INTO titles VALUES('T70','1977!','history','P01',107,21.99,-2, '2000-08-01',1);

-- Fecha anterior a 1950
-- INSERT INTO titles VALUES('T70','1977!','history','P01',107,21.99,566, '1949-08-01',1);

-- Título con longitud 0
-- INSERT INTO titles VALUES('T70','','history','P01',107,21.99,566, '2000-08-01',1);
