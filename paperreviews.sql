create table AUTHOR ( LastName varchar(255), FirstName varchar(255), EMAILAddr varchar(255) NOT NULL,PRIMARY KEY(EMAILAddr)); // EMAILAddr represents unique primary key of author table

insert into author values ('Uppuluri','Hemanth','hemanthuppuluri95@gmail.com'); 
insert into author values ('Testing Last Name 1','Testing First Name 1','testingemail1@gmail.com');
insert into author values ('Testing Last Name 2','Testing First Name 2','testingemail2@gmail.com');
insert into author values ('Testing Last Name 3','Testing First Name 3','testingemail3@gmail.com');
insert into author values ('Testing Last Name 4','Testing First Name 4 ','testingemail4@gmail.com');
insert into author values ('Testing Last Name 5','Testing First Name 5','testingemail5@gmail.com');

create table PAPER (Id int NOT NULL, Title varchar(255), Abstract varchar(255), FileName varchar(255), PRIMARY KEY(Id));  

Insert into paper values ('1','casade','thriller','April');
Insert into paper values ('2','harry','scifi','May');
Insert into paper values ('3','sherlock','dectetive','June');
Insert into paper values ('4','Avatar','anime','July');
Insert into paper values ('5','Game','Series','August');

create table REVIEWER( EMAILAddr varchar(255) not null, PRIMARY KEY(EMAILAddr), LastName varchar(255), FirstName varchar(255), CommiteeFeedback varchar(255), PhoneNum int, Affliation varchar(255), AuthorFeedback varchar(255));

insert into reviewer values ('testingemail1@gmail','test','part1','excellent','1112223456','Affliationtest','Feedbacktest');
insert into reviewer values ('testingemail2@gmail','test1','part2','excellent1','1112223457','Affliationtest1','Feedbacktest1');
insert into reviewer values ('testingemail3@gmail','test2','part3','excellent2','1112223458','Affliationtest2','Feedbacktest2');
insert into reviewer values ('testingemail4@gmail','test3','part4','excellent3','1112223459','Affliationtest3','Feedbacktest3');
insert into reviewer values ('testingemail5@gmail','test4','part5','excellent4','1112223460','Affliationtest4','Feedbacktest4');


create table REVIEW ( Recommendation varchar(255),
Id int NOT NULL,
PaperId int, FOREIGN KEY(PaperId) REFERENCES paper(Id),
ReadabilityScore int,
ReviewerId varchar(255) , FOREIGN KEY(ReviewerId) REFERENCES reviewer(EmailAddr),
RelevanceScore int,
OriginalityScore int,
MeritScore int, PRIMARY KEY( Id));    // here paperid and review acts as foreign key which makes a relationship of review table with paper table and review table respectively.

Insert into review (Recommendation,Id,PaperId,ReadabilityScore,ReviewerId,RelevanceScore,OriginalityScore,MeritScore) values('Recommendationtest','1',(select Id from paper where filename ='april'),'92',(select EMAILAddr from reviewer where LastName='test'),'97','95','100');
Insert into review (Recommendation,Id,PaperId,ReadabilityScore,ReviewerId,RelevanceScore,OriginalityScore,MeritScore) values('Recommendationtest1','2',(select Id from paper where filename ='May'),'92',(select EMAILAddr from reviewer where LastName='test1'),'98','96','100');
Insert into review (Recommendation,Id,PaperId,ReadabilityScore,ReviewerId,RelevanceScore,OriginalityScore,MeritScore) values('Recommendationtest2','3',(select Id from paper where filename ='June'),'92',(select EMAILAddr from reviewer where LastName='test2'),'96','94','100');
Insert into review (Recommendation,Id,PaperId,ReadabilityScore,ReviewerId,RelevanceScore,OriginalityScore,MeritScore) values('Recommendationtest3','4',(select Id from paper where filename ='July'),'92',(select EMAILAddr from reviewer where LastName='test3'),'99','94','100');
Insert into review (Recommendation,Id,PaperId,ReadabilityScore,ReviewerId,RelevanceScore,OriginalityScore,MeritScore) values('Recommendationtest4','5',(select Id from paper where filename ='August'),'92',(select EMAILAddr from reviewer where LastName='test4'),'92','91','100');

create table TOPIC (Id int NOT NULL, TopicName varchar(255), PRIMARY KEY(Id));

insert into topic values ('1','TopicNameTest');
insert into topic values ('2','TopicNameTest2');
insert into topic values ('3','TopicNameTest3');
insert into topic values ('4','TopicNameTest4');
insert into topic values ('5','TopicNameTest5');
