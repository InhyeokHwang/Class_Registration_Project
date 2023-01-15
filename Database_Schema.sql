DROP DATABASE IF EXISTS db2021058995;
CREATE DATABASE IF NOT EXISTS db2021058995;
USE db2021058995;

create table building(
	building_id char(3),
	name nvarchar(10),
	admin nvarchar(10),
	rooms varchar(2),
	primary key(building_id)
);

create table class(
	class_id varchar(5),
	class_no varchar(5),
	course_id varchar(7),
	name nvarchar(20),
	major_id char(1),
	year char(1),
	credit int,
	lecturer_id char(10),
	person_max varchar(3),
	opened char(4),
	room_id varchar(3),
	primary key(class_id),
	foreign key (course_id) references course(course_id) on delete cascade,
	foreign key (lecturer_id) references lecturer(lecturer_id) on delete cascade,
	foreign key (room_id) references room(room_id) on delete cascade
);

create table course(
	course_id int not null auto_increment,
	name nvarchar(20),
	credit int,
	primary key(course_id)
);

create table credits( #성적은 이전에 열렸었던 수업들 대해서만 존재
	credits_id varchar(3),
	student_id char(10),
	course_id char(7),
	year char(4),
	grade varchar(2),
	primary key(credits_id),
	foreign key(student_id) references student(student_id) on delete cascade,
	foreign key(course_id) references course(course_id) on delete cascade
);

create table lecturer(
	lecturer_id varchar(10),
	name nvarchar(25),
	major_id char(1),
	primary key(lecturer_id),
	foreign key(major_id) references major(major_id) on delete cascade
);


create table major(
	major_id varchar(2),
	name nvarchar(20),
	primary key(major_id)
);

create table room(
	room_id varchar(3),
	building_id char(3),
	occupancy varchar(3),
	primary key (room_id),
	foreign key (building_id) references building(building_id) on delete cascade
);

create table student(
	student_id char(10),
	password varchar(20),
	name nvarchar(25),
	sex varchar(6),
	major_id varchar(2),
	lecturer_id char(10),
	year char(1),
    status nvarchar(2), #재학/휴학/자퇴 여부와 관련된 속성
	primary key(student_id),
	foreign key(major_id) references major(major_id) on delete cascade,
	foreign key(lecturer_id) references lecturer(lecturer_id) on delete cascade,
    foreign key(student_id) references user(user_id) on delete cascade
);

create table time( #수강신청의 대상과목들에 대해서만 존재함
	time_id int not null auto_increment,
	class_id varchar(5),
	period char(1),
	begin varchar(30),
	end varchar(30),
	primary key(time_id),
	foreign key(class_id) references class(class_id) on delete cascade
);

create table takes( #수강신청 내역
	takes_id int not null auto_increment,
    student_id char(10),
    class_id varchar(5),
    primary key(takes_id),
    foreign key(student_id) references student(student_id) on delete cascade,
	foreign key(class_id) references class(class_id) on delete cascade
);

create table wish( #희망신청 내역
	wish_id int not null auto_increment,
    student_id char(10),
    class_id varchar(5),
    primary key(wish_id),
    foreign key(student_id) references student(student_id) on delete cascade,
    foreign key(class_id) references class(class_id) on delete cascade 
);

create table user( #모든 사용자 정보 - 학생 + 관리자
	user_id char(10),
    password varchar(20),
    type varchar(7),
    primary key(user_id)
);

create table admin( #관리자 정보
	admin_id char(10),
    password varchar(20),
    primary key(admin_id),
    foreign key(admin_id) references user(user_id) on delete cascade 
);
