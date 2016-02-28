/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2015/12/14 17:28:16                          */
/*==============================================================*/

drop table if exists tb_resources_role;

drop table if exists tb_resource;

drop table if exists tb_resource_button;

drop table if exists tb_role_user;

drop table if exists tb_role;

drop table if exists tb_user_info;

drop table if exists tb_user;

/*==============================================================*/
/* Table: tb_resource                                           */
/*==============================================================*/
create table tb_resource
(
   s_id                 int not null auto_increment comment '资源id',
   a_id                 int comment '权限id',
   s_parent_id          int not null comment '资源父id',
   s_name               varchar(100) not null comment '资源名称',
   s_source_key         varchar(100) not null comment '资源唯一标识',
   s_type               int not null comment '资源类型',
   s_source_url         varchar(500) comment '资源url',
   s_level              int comment '层级',
   s_icon               varchar(100) comment '图标',
   s_is_hide            int comment '是否隐藏',
   s_description        varchar(100) comment '描述',
   r_create_time        datetime comment '创建时间',
   r_update_time        timestamp ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   primary key (s_id)
);

alter table tb_resource comment '资源表';

/*==============================================================*/
/* Table: tb_resource_button                                    */
/*==============================================================*/
create table tb_resource_button
(
   a_id                 int not null auto_increment comment '权限id',
   a_name               varchar(100) not null comment '权限名称',
   a_element            varchar(500) not null comment '权限元素',
   a_description        varchar(500) comment '权限描述',
   s_delete_status      int comment '逻辑删除状态',
   a_create_time        datetime comment '创建时间',
   primary key (a_id)
);

alter table tb_resource_button comment '权限表';

/*==============================================================*/
/* Table: tb_resources_role                                     */
/*==============================================================*/
create table tb_resources_role
(
   id                   int not null auto_increment,
   s_id                 int comment '资源id',
   r_id                 int comment '角色id',
   t_create_time        datetime comment '创建时间',
   primary key (id)
);

alter table tb_resources_role comment '角色权限映射表';

/*==============================================================*/
/* Table: tb_role                                               */
/*==============================================================*/
create table tb_role
(
   r_id                 int not null auto_increment comment '角色id',
   r_name               varchar(50) not null comment '角色名称',
   r_key                varchar(50) not null comment '角色key',
   r_status             int comment '角色状态',
   r_description        varchar(100) comment '角色描述',
   r_create_time        datetime comment '创建时间',
   r_update_time        timestamp ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   primary key (r_id)
);

alter table tb_role comment '角色表';

/*==============================================================*/
/* Table: tb_role_user                                          */
/*==============================================================*/
create table tb_role_user
(
   id                   int not null auto_increment,
   r_id                 int comment '角色id',
   u_id                 int comment '用户id',
   t_create_time        datetime comment '创建时间',
   primary key (id)
);

alter table tb_role_user comment '用户角色映射表';

/*==============================================================*/
/* Table: tb_user                                               */
/*==============================================================*/
create table tb_user
(
   u_id                 int not null auto_increment comment '用户id',
   u_name               varchar(100) not null comment '真实姓名',
   u_account_name       varchar(100) not null comment '账户名称',
   u_password           varchar(100) not null comment '用户密码',
   u_delete_status      int comment '逻辑删除状态',
   u_locked             int comment '是否锁定',
   u_description        varchar(200) comment '用户描述',
   u_credentials_salt   varchar(500) not null comment '加密盐',
   u_creater_name       varchar(100) not null comment '创建者',
   u_create_time        datetime comment '创建时间',
   u_update_time        timestamp ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
   primary key (u_id),
   UNIQUE INDEX u_account_name_unique (u_account_name) USING BTREE
);

alter table tb_user comment '用户账户表';

/*==============================================================*/
/* Table: tb_user_extend_info                                   */
/*==============================================================*/
create table tb_user_info
(
   u_id                 int not null comment '用户id',
   u_sex                int comment '性别',
   u_birthday           datetime comment '出生日期',
   u_telephone          varchar(20) comment '电话',
   u_email              varchar(50) comment '邮箱',
   u_address            varchar(200) comment '住址',
   u_create_time        datetime comment '创建时间',
   primary key (u_id)
);

alter table tb_user_info comment '用户信息表';

alter table tb_resource add constraint FK_r_authority_resource foreign key (a_id)
      references tb_resource_button (a_id) on delete cascade on update restrict;

alter table tb_resources_role add constraint FK_r_resource_role foreign key (s_id)
      references tb_resource (s_id) on delete cascade on update restrict;

alter table tb_resources_role add constraint FK_r_role_resource foreign key (r_id)
      references tb_role (r_id) on delete cascade on update restrict;

alter table tb_role_user add constraint FK_r_role_user foreign key (r_id)
      references tb_role (r_id) on delete cascade on update restrict;

alter table tb_role_user add constraint FK_r_user_role foreign key (u_id)
      references tb_user (u_id) on delete cascade on update restrict;

alter table tb_user_info add constraint FK_r_user_info foreign key (u_id)
      references tb_user (u_id) on delete cascade on update restrict;

