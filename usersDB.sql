create database if not exists users;

use users;

drop table if exists comments;
drop table if exists posts;
drop table if exists userdata;


create table userdata (
		user_id int(11) not null auto_increment,
		username varchar(20) not null,
		password varchar(40) not null,
		email varchar(40) not null,
		primary key(user_id)
);

create table posts (
		post_id int(11) not null auto_increment,
		user_id int(11) not null,
		time_created datetime default current_timestamp,
		post varchar(150),
		primary key (post_id),
		foreign key(user_id) references userdata(user_id)
);

create table comments (
	comment_id int(11) not null auto_increment,
	post_id int(11) not null,
	user_id int(11) not null,
	time_created datetime default current_timestamp,
	comment varchar(60),
	primary key(comment_id),
	foreign key (post_id) references posts(post_id),
	foreign key (user_id) references userdata(user_id)
);
