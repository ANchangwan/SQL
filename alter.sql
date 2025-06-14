use movies;
use users_v2;
create table users (
    user_id bigint unsigned primary key  auto_increment,
                       username char(10) not null,
                       email varchar(50) not null unique, -- 가변적인 데이터 이메일과같은 데이터 타임에 공백이 없이 string 길이 만큼 생성 --
                       gender ENUM('Male', 'Female'), -- column을 male or female로만 지정할 수 있게 제한,
                       interests set (
                           'sport',
                           'music',
                           'Art',
                           'Travel'
                           ),
                       bio text,
                       profile_picture tinyblob,
                       age int unsigned not null, -- 나이는 0부터 1부터 시작
                       is_admin BOOLEAN not null, -- tynyInt(1,0)
                       balance FLOAT,
                       join_at timestamp default current_timestamp,
                       update_at timestamp default current_timestamp on update current_timestamp,
                       birth_date DATE, -- datetime과 비슷하지만 date만 사용 ex)2025-01-01
                       bed_time time, -- time만 원할때
                       graduation_year year not null, -- 1901 to 2155

                       CONSTRAINT chk_age CHECK(age < 100),
                       CONSTRAINT uq_email UNIQUE(email)

);
select * from users;

drop table users;

INSERT INTO users (
    username,
    email,
    gender,
    interests,
    bio,
    age,
                   is_admin,
    birth_date,
    bed_time,
    graduation_year
) VALUES (
             'changwan',
             'mr@gmail.com',
             'Male',
             'Travel,Art,music', -- SET 타입의 값
             'I like traveling and eating.',
             18,
          true,
             '2005-05-03', -- 출생일 수정
             '22:30:00', -- 취침 시간
             2022 -- 졸업 연도 수정
         );

-- drop column
alter table users drop column profile_picture;

-- rename column
-- chang column : 컬럼 이름 과 타입 변경
-- modify column : 타입만 변경하고 싶을 때
alter table users change column bio about_me tinytext;
alter table users modify column about_me text;

-- 추가 삭제 null 조건
alter table users modify column bed_time time null;
alter table users modify column bed_time time not null;

-- rename database  : 데이터베이스 이름 변경
alter table users Rename to customers;
alter table customers rename to users;

-- 제약 조건 삭제
alter table users drop constraint uq_email;
alter table users drop constraint chk_age;

-- 조건 추가
alter table users add constraint uq_email unique (email);
alter table users add constraint user_age check ( age < 100 );
--




show create table users;
