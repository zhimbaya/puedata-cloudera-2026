CREATE database training ;
CREATE USER 'training'@'localhost' identified by 'training' ;
GRANT ALL ON training.* to 'training'@'localhost' ;
FLUSH PRIVILEGES ;
