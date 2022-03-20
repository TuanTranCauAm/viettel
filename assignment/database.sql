DROP database IF EXISTS assweb;
CREATE DATABASE assweb;
USE assweb;


CREATE TABLE `PRODUCTS` (
  `id` varchar(255),
  `product_price` int(11)  DEFAULT NULL,
  `product_name` varchar(255)  DEFAULT NULL,
  `product_content` varchar(10000)  DEFAULT NULL,
  `comment_status` BOOLEAN  DEFAULT NULL,
  `product_img` varchar(255)  DEFAULT NULL,
  primary key (id)
);

CREATE TABLE `POSTS` (
   `id` varchar(255),
  `post_status` int(11)  DEFAULT NULL,
  `post_date` datetime  DEFAULT NULL,
  `post_content` varchar(10000)  DEFAULT NULL,
  `post_title` varchar(255)  DEFAULT NULL,
  `comment_status` BOOLEAN  DEFAULT NULL,
  `Guid` varchar(255)  DEFAULT NULL,
  `comment_count` int(11)  DEFAULT NULL,
  primary key (id)
) ;
CREATE TABLE `USERS` (
  `Email` varchar(255) ,
  `profile_photo` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `createAt` datetime DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  primary key (Email)
) ;

CREATE TABLE `COMMENTS` (
  `id` varchar(255) ,
  `comment_date` datetime DEFAULT NULL,
  `comment_approved` BOOLEAN,
  `flag` BOOLEAN,
  `comment_content` varchar(10000) ,
  `comment_id_parent` varchar(255) ,
  `post_id` varchar(255) ,
  `userr_id` varchar(255) ,
  `product_id` varchar(255) ,
  primary key (id),
  foreign key(comment_id_parent) references COMMENTS(id) ON DELETE CASCADE ON UPDATE CASCADE,
  foreign key(post_id) references POSTS(id) ON DELETE CASCADE ON UPDATE CASCADE,
  foreign key(product_id) references PRODUCTS(id) ON DELETE CASCADE ON UPDATE CASCADE,
  foreign key(userr_id) references USERS(Email) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE `ADMIN` (
  `username` varchar(255) ,
  `password` varchar(255) DEFAULT NULL,
  primary key (username)
) ;
