create database project;use project;
create table users(user_id int primary key,name varchar(50),email varchar(100) unique,password varchar(255),phone bigint,created_at datetime,status varchar(20));
create table admins(admin_id int primary key,admin_name varchar(100),email varchar(100) unique,password varchar(255),role varchar(50),created_at datetime,status varchar(20));
create table chatbots(chatbot_id int primary key,admin_id int,chatbot_name varchar(100),description text,language varchar(50),created_at datetime,status varchar(20),foreign key(admin_id) references admins(admin_id));
create table conversations(conversations_id int primary key,user_id int,chatbot_id int,started_at datetime,ended_at datetime,status varchar(20),foreign key(user_id) references users(user_id));
alter table conversations add constraint foreign key(chatbot_id) references chatbots(chatbot_id);
create table messages(message_id int primary key,conversation_id int,sender_type varchar(20),message_text text,sent_at datetime,message_status varchar(20),foreign key(conversation_id) references conversations(conversations_id));
create table knowledge_base(knowledge_id int primary key,chatbot_id int,category_id int,question text,answer text,keywords varchar(100),created_at datetime,foreign key(chatbot_id) references chatbots(chatbot_id));
create table categories(category_id int primary key,category_name varchar(100),description text,created_at datetime,status varchar(200));
alter table knowledge_base add constraint foreign key(category_id) references categories(category_id);
create table intents(intent_id int primary key,chatbot_id int,intent_name varchar(100),description text,keywords varchar(100),created_at datetime,status varchar(200),foreign key(chatbot_id) references chatbots(chatbot_id));
create table responses(response_id int primary key,intent_id int,response_text text,response_type varchar(50),priority int,created_at datetime,status varchar(50));
alter table responses add constraint foreign key(intent_id) references intents(intent_id);
create table feedback(feedback_id int primary key,user_id int,message_id int,rating int,comments text,created_at datetime,foreign key(user_id) references users(user_id),foreign key(message_id) references messages(message_id));
create table chatbot_settings(setting_id int primary key,chatbot_id int,setting_name varchar(100),setting_value varchar(500),updated_at datetime,foreign key(chatbot_id) references chatbots(chatbot_id));
create table login_history(login_id int primary key,user_id int,login_time datetime,logout_time datetime,ip_address varchar(45),login_status varchar(200),foreign key(user_id) references users(user_id));
INSERT INTO users(user_id, name, email, password, phone, created_at, status)
VALUES
(1, 'Yeswanth', 'yeswanth@gmail.com', 'pass123', '9876543210', '2026-08-01 09:00:00', 'Active'),
(2, 'Rahul', 'rahul@gmail.com', 'rahul123', '9876543211', '2026-08-01 09:30:00', 'Active'),
(3, 'Priya', 'priya@gmail.com', 'priya123', '9876543212', '2026-08-02 10:00:00', 'Active'),
(4, 'Anil', 'anil@gmail.com', 'anil123', '9876543213', '2026-08-02 10:30:00', 'Inactive'),
(5, 'Sneha', 'sneha@gmail.com', 'sneha123', '9876543214', '2026-08-03 09:00:00', 'Active'), (6, 'Kiran', 'kiran@gmail.com', 'kiran123', '9876543215', '2026-08-03 11:00:00', 'Active'),
(7, 'Arjun', 'arjun@gmail.com', 'arjun123', '9876543216', '2026-08-04 12:00:00', 'Active'),
(8, 'Neha', 'neha@gmail.com', 'neha123', '9876543217', '2026-08-04 13:00:00', 'Active'),
(9, 'Vijay', 'vijay@gmail.com', 'vijay123', '9876543218', '2026-08-05 14:00:00', 'Inactive'),
(10, 'Divya', 'divya@gmail.com', 'divya123', '9876543219', '2026-08-05 15:00:00', 'Active');
INSERT INTO admins(admin_id, admin_name, email, password, role, created_at, status)
VALUES
(1, 'Admin One', 'admin1@gmail.com', 'admin123', 'Super Admin', '2026-07-20 09:00:00', 'Active'),
(2, 'Admin Two', 'admin2@gmail.com', 'admin234', 'Manager', '2026-07-21 09:00:00', 'Active'),
(3, 'Admin Three', 'admin3@gmail.com', 'admin345', 'Developer', '2026-07-22 09:00:00', 'Active'),
(4, 'Admin Four', 'admin4@gmail.com', 'admin456', 'Manager', '2026-07-23 09:00:00', 'Active'),
(5, 'Admin Five', 'admin5@gmail.com', 'admin567', 'Developer', '2026-07-24 09:00:00', 'Active'),
(6, 'Admin Six', 'admin6@gmail.com', 'admin678', 'Support', '2026-07-25 09:00:00', 'Active'),
(7, 'Admin Seven', 'admin7@gmail.com', 'admin789', 'Support', '2026-07-26 09:00:00', 'Inactive'),
(8, 'Admin Eight', 'admin8@gmail.com', 'admin890', 'Developer', '2026-07-27 09:00:00', 'Active'),
(9, 'Admin Nine', 'admin9@gmail.com', 'admin901', 'Manager', '2026-07-28 09:00:00', 'Active'),
(10, 'Admin Ten', 'admir mail.com', 'admin012', 'Support', '2026-07-29 09:00:00', 'Active');
INSERT INTO chatbots(chatbot_id, admin_id, chatbot_name, description, language, created_at, status)
VALUES
(1, 1, 'General Knowledge Bot', 'Answers general knowledge questions', 'English', '2026-08-01 09:00:00', 'Active'),
(2, 2, 'Customer Support Bot', 'Provides customer support', 'English', '2026-08-01 10:00:00', 'Active'),
(3, 3, 'Education Bot', 'Provides educational information', 'English', '2026-08-02 09:00:00', 'Active'),
(4, 4, 'Travel Bot', 'Provides travel information', 'English', '2026-08-02 10:00:00', 'Active'),
(5, 5, 'Health Bot', 'Provides general health information', 'English', '2026-08-03 09:00:00', 'Active'),
(6, 6, 'Shopping Bot', 'Helps users with shopping queries', 'English', '2026-08-03 10:00:00', 'Active'),
(7, 7, 'Banking Bot', 'Provides banking assistance', 'English', '2026-08-04 09:00:00', 'Inactive'),
(8, 8, 'Sports Bot', 'Provides sports information', 'English', '2026-08-04 10:00:00', 'Active'),
(9, 9, 'Technology Bot', 'Answers technology questions', 'English', '2026-08-05 09:00:00', 'Active'),
(10, 10, 'Food Bot', 'Provides food-related information', 'English','2026-08-05 10:00:00','Active');
INSERT INTO conversations(conversations_id, user_id, chatbot_id, started_at, ended_at, status)
VALUES
(1, 1, 1, '2026-08-10 09:00:00', '2026-08-10 09:15:00', 'Completed'),
(2, 2, 2, '2026-08-10 10:00:00', '2026-08-10 10:20:00', 'Completed'),
(3, 3, 3, '2026-08-10 11:00:00', '2026-08-10 11:15:00', 'Completed'),
(4, 4, 4, '2026-08-10 12:00:00', '2026-08-10 12:30:00', 'Completed'),
(5, 5, 5, '2026-08-11 09:00:00', '2026-08-11 09:20:00', 'Completed'),
(6, 6, 6, '2026-08-11 10:00:00', '2026-08-11 10:25:00', 'Completed'),
(7, 7, 7, '2026-08-11 11:00:00', '2026-08-11 11:10:00', 'Completed'),
(8, 8, 8, '2026-08-12 09:00:00', '2026-08-12 09:20:00', 'Completed'),
(9, 9, 9, '2026-08-12 10:00:00', '2026-08-12 10:30:00', 'Completed'),
(10, 10, 10, '2026-08-12 11:00:00', '2026-08-12 11:20:00', 'Completed');
INSERT INTO messages(message_id, conversation_id, sender_type, message_text, sent_at, message_status)
VALUES
(1, 1, 'User', 'What is Artificial Intelligence?', '2026-08-10 09:02:00', 'Delivered'),
(2, 2, 'User', 'How can I contact support?', '2026-08-10 10:02:00', 'Delivered'),
(3, 3, 'User', 'What is Machine Learning?', '2026-08-10 11:02:00', 'Delivered'),
(4, 4, 'User', 'What are the best tourist places in India?', '2026-08-10 12:02:00', 'Delivered'),
(5, 5, 'User', 'What is a healthy diet?', '2026-08-11 09:02:00', 'Delivered'),
(6, 6, 'User', 'How can I track my order?', '2026-08-11 10:02:00', 'Delivered'),
(7, 7, 'User', 'How can I check my bank balance?', '2026-08-11 11:02:00', 'Delivered'),
(8, 8, 'User', 'Who won the cricket match?', '2026-08-12 09:02:00', 'Delivered'),
(9, 9, 'User', 'What is Python?', '2026-08-12 10:02:00', 'Delivered'),
(10, 10, 'User', 'What is a healthy breakfast?', '2026-08-12 11:02:00', 'Delivered');
INSERT INTO categories(category_id, category_name, description, created_at, status)
VALUES
(1, 'Technology', 'Technology and computer knowledge', '2026-07-20 09:00:00', 'Active'),
(2, 'History', 'Historical events and civilizations', '2026-07-20 09:10:00', 'Active'),
(3, 'Geography', 'Countries and geographical information', '2026-07-20 09:20:00', 'Active'),
(4, 'Education', 'Educational and academic information', '2026-07-20 09:30:00', 'Active'),
(5, 'Science', 'Scientific information', '2026-07-20 09:40:00', 'Active'),
(6, 'Sports', 'Sports and games information', '2026-07-20 09:50:00', 'Active'),
(7, 'Health', 'General health information', '2026-07-20 10:00:00', 'Active'),
(8, 'Travel', 'Travel and tourism information', '2026-07-20 10:10:00', 'Active'),
(9, 'Food', 'Food and nutrition information', '2026-07-20 10:20:00', 'Active'),
(10, 'Entertainment', 'Movies and entertainment information', '2026-07-20 10:30:00', 'Active');
INSERT INTO knowledge_base(knowledge_id, chatbot_id, category_id, question, answer, keywords, created_at)
VALUES
(1, 1, 1, 'What is Artificial Intelligence?', 'Al is the simulation of human intelligence by machines.', 'Al, artificial intelligence, machine', '2026-08-01 09:00:00'),
(2, 1, 1, 'What is Machine Learning?', 'Machine Learning allows computers to learn from data.', 'ML, machine learning, data', '2026-08-01 09:10:00'),
(3, 1, 2, 'What is history?', 'History is the study of past events.', 'history, past, events', '2026-08-01 09:20:00'),
(4, 1, 3, 'What is geography?', 'Geography is the study of Earth and its places.', 'geography, earth, places', '2026-08-01 09:30:00'),
(5, 3, 4, 'What is education?', 'Education is the process of gaining knowledge and skills.', 'education, learning, knowledge', '2026-08-01 09:40:00'),
(6, 5, 5, 'What is science?', 'Science is the systematic study of the natural world.', 'science, nature, study', '2026-08-01 09:50:00'),
(7, 8, 6, 'What is cricket?', 'Cricket is a bat-and-ball team sport.', 'cricket, sport, bat', '2026-08-01 10:00:00'),
(8, 5, 7, 'What is a healthy diet?', 'A healthy diet contains a balanced variety of nutrients.', 'health, diet, nutrition', '2026-08-01 10:10:00'),
(9, 4, 8, 'What is tourism?', 'Tourism involves travelling to places for leisure or other purposes.', 'travel, tourism, places', '2026-08-01 10:20:00'),
(10, 10, 9, 'What is a healthy breakfast?', 'A healthy breakfast can inside fruits,whole grains and protein.', 'food, fruits, beakfast, healthy', '2026-08-01 10:30:00'); 
INSERT INTO intents(intent_id, chatbot_id, intent_name, description, keywords, created_at, status) 
VALUES
(1, 1, 'Greeting', 'Identifies greeting messages', 'hello, hi, hey', '2026-08-01 09:00:00', 'Active'),
(2, 1, 'Definition', 'Identifies definition questions', 'what is, define, meaning', '2026-08-01 09:10:00', 'Active'),
(3, 1, 'Explanation', 'Identifies explanation questions', 'explain, describe, tell', '2026-08-01 09:20:00', 'Active'),
(4, 2, 'Support', 'Identifies customer support requests', 'help, support, problem', '2026-08-01 09:30:00', 'Active'),
(5, 3, 'Education', 'Identifies education questions', 'study, education, exam', '2026-08-01 09:40:00', 'Active'),
(6, 4, 'Travel', 'Identifies travel questions', 'travel, trip, tourism', '2026-08-01 09:50:00', 'Active'),
(7, 5, 'Health', 'Identifies general health questions', 'health, diet, fitness', '2026-08-01 10:00:00', 'Active'),
(8, 8, 'Sports', 'Identifies sports questions', 'sports, cricket, football', '2026-08-01 10:10:00', 'Active'),
(9, 9, 'Technology', 'Identifies technology questions', 'technology, computer, python', '2026-08-01 10:20:00', 'Active'),
(10, 10, 'Food', 'Identifies food questions', 'food, breakfast, nutrition', '2026-08-01 10:30:00', 'Active');
INSERT INTO responses(response_id, intent_id, response_text, response_type, priority, created_at, status)
VALUES
(1, 1, 'Hello! How can I help you?', 'Text', 1, '2026-08-01 09:00:00', 'Active'),
(2, 2, 'Sure, I can provide a definition.', 'Text', 1, '2026-08-01 09:10:00', 'Active'),
(3, 3, 'Sure! I will explain it simply.', 'Text', 1, '2026-08-01 09:20:00', 'Active'),
(4, 4, 'Please describe your problem and I will help you.', 'Text', 1, '2026-08-01 09:30:00', 'Active'),
(5, 5, 'I can help you with your educational question.', 'Text', 1, '2026-08-01 09:40:00', 'Active'),
(6, 6, 'I can provide information about travel and tourism.', 'Text', 1, '2026-08-01 09:50:00', 'Active'),
(7, 7, 'I can provide general health information.', 'Text', 1, '2026-08-01 10:00:00', 'Active'),
(8, 8, 'I can provide information about sports.', 'Text', 1, '2026-08-01 10:10:00', 'Active'),
(9, 9, 'I can help you with technology-related questions.', 'Text', 1, '2026-08-01 10:20:00', 'Active'),
(10, 10, 'I can help you with food and nutrition questions.', 'Text', 1, '2026-08-01 10:30:00', 'Active');
INSERT INTO feedback(feedback_id, user_id, message_id, rating, comments, created_at)
values
(1, 1, 1, 5, 'Very useful answer.', '2026-08-10 09:20:00'),
(2, 2, 2, 4, 'Good support.', '2026-08-10 10:25:00'),
(3, 3, 3, 5, 'Very helpful explanation.', '2026-08-10 11:20:00'),
(4, 4, 4, 4, 'Good travel information.', '2026-08-10 12:35:00'),
(5, 5, 5, 5, 'Helpful health information.', '2026-08-11 09:25:00'),
(6, 6, 6, 4, 'Good response.', '2026-08-11 10:30:00'),
(7, 7, 7, 3, 'Answer was okay.', '2026-08-11 11:15:00'),
(8, 8, 8, 5, 'Excellent answer.', '2026-08-12 09:25:00'),
(9, 9, 9, 5, 'Very useful technology answer.', '2026-08-12 10:35:00'),
(10, 10, 10, 4, 'Good information.', '2026-08-12 11:25:00');
INSERT INTO chatbot_settings (setting_id, chatbot_id, setting_name, setting_value, updated_at)
VALUES
(1, 1, 'response_mode', 'Detailed', '2026-08-10 09:00:00'),
(2, 1, 'language', 'English', '2026-08-10 09:05:00'),
(3, 2, 'response_mode', 'Short', '2026-08-10 09:10:00'),
(4, 3, 'language', 'English', '2026-08-10 09:15:00'),
(5, 4, 'response_mode', 'Detailed', '2026-08-10 09:20:00'),
(6, 5, 'language', 'English', '2026-08-10 09:25:00'),
(7, 6, 'response_mode', 'Short', '2026-08-10 09:30:00'),
(8, 7, 'language', 'English', '2026-08-10 09:35:00'),
(9, 8, 'response_mode', 'Detailed', '2026-08-10 09:40:00'),
(10, 9, 'language', 'English', '2026-08-10 09:45:00');
INSERT INTO login_history(login_id, user_id, login_time, logout_time, ip_address, login_status)
VALUES
(1, 1, '2026-08-10 08:50:00', '2026-08-10 09:30:00', '192.168.1.10', 'Success'),
(2, 2, '2026-08-10 09:50:00', '2026-08-10 10:30:00', '192.168.1.11', 'Success'),
(3, 3, '2026-08-10 10:50:00', '2026-08-10 11:30:00', '192.168.1.12', 'Success'),
(4, 4, '2026-08-10 11:50:00', '2026-08-10 12:40:00', '192.168.1.13', 'Success'),
(5, 5, '2026-08-11 08:50:00', '2026-08-11 09:30:00', '192.168.1.14', 'Success'),
(6, 6, '2026-08-11 09:50:00', '2026-08-11 10:40:00', '192.168.1.15', 'Success'),
(7, 7, '2026-08-11 10:50:00', '2026-08-11 11:30:00', '192.168.1.16', 'Failed'),
(8, 8, '2026-08-12 08:50:00', '2026-08-12 09:40:00', '192.168.1.17', 'Success'),
(9, 9, '2026-08-12 09:50:00', '2026-08-12 10:40:00', '192.168.1.18', 'Success'),
(10, 10, '2026-08-12 10:50:00', '2026-08-12 11:30:00', '192.168.1.19', 'Success');
show tables;
select * from users;
select * from admins;
select * from categories;
select * from chatbots;
select * from conversations;
select * from messages;
select * from knowledge_base;
select * from intents;
select * from responses;
select * from feedback;
select * from chatbot_settings;
select * from login_history;
