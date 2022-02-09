
CREATE TABLE Boards (
	boardId INT NOT NULL AUTO_INCREMENT,
	boardTitle VARCHAR(255) ,
	boardContent text,
    boardWriteTime datetime,
    boardWriter VARCHAR(255),
	PRIMARY KEY (boardId)
);
CREATE TABLE Files (
	fileId INT NOT NULL AUTO_INCREMENT,
	originalFileName text,
	savedFileName text,
	boardId int,
	PRIMARY KEY (fileId)
);
CREATE TABLE Users (
	userId INT NOT NULL AUTO_INCREMENT,
	username VARCHAR(255) unique ,
	password VARCHAR(255) ,
    salt VARCHAR(255),
	PRIMARY KEY (userId)
);
select * from boards;
select * from files;
select * from users;

drop table Boards;
drop table Files;
drop table Users;

        
select * from files;
delete from files where fileid=1 or fileid=2;