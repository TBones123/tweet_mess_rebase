create table message (
  id bigint not null auto_increment,
  filename varchar(255),
  tag varchar(255),
  text varchar(2048) not null,
  user_id bigint,
  primary key (id)
) engine=MyISAM;

create table user_role (
  user_id bigint not null,
  roles varchar(255)
) engine=MyISAM;

create table usr (
  id bigint not null auto_increment,
  activation_code varchar(255),
  active bit not null,
  email varchar(255),
  password varchar(255) not null,
  username varchar(255) not null,
  primary key (id)
) engine=MyISAM;

alter table message
        add constraint message_user_fk
        foreign key (user_id) references usr (id);


alter table user_role
    add constraint user_role_user_fk
    foreign key (user_id) references usr (id);


create table user_subscriptions (
    subscriber_id bigint not null references usr,
    channel_id bigint not null references usr,
    primary key (channel_id, subscriber_id))
      engine=MyISAM;

create table message_likes (
    user_id bigint not null references usr,
    message_id bigint not null references message,
    primary key (user_id, message_id)
    engine=MyISAM;
)


--create extension if not exists pgcrypto;
--
--update usr set password = crypt(password, gen_salt('bf', 8));