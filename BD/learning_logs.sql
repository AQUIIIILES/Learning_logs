BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "learning_logs_entry" (
	"id"	integer NOT NULL,
	"text"	text NOT NULL,
	"date_added"	datetime NOT NULL,
	"topic_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("topic_id") REFERENCES "learning_logs_topic"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "learning_logs_topic" (
	"id"	integer NOT NULL,
	"text"	varchar(200) NOT NULL,
	"date_added"	datetime NOT NULL,
	"owner_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("owner_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_topic','Can add topic');
INSERT INTO "auth_permission" VALUES (26,7,'change_topic','Can change topic');
INSERT INTO "auth_permission" VALUES (27,7,'delete_topic','Can delete topic');
INSERT INTO "auth_permission" VALUES (28,7,'view_topic','Can view topic');
INSERT INTO "auth_permission" VALUES (29,8,'add_entry','Can add entry');
INSERT INTO "auth_permission" VALUES (30,8,'change_entry','Can change entry');
INSERT INTO "auth_permission" VALUES (31,8,'delete_entry','Can delete entry');
INSERT INTO "auth_permission" VALUES (32,8,'view_entry','Can view entry');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$870000$6IxWCl7JMGLiHS890Pn43D$mR2epsztCaZcaHR1wAJb0oMgkQU2ICGU3cV3T3pUd04=','2025-01-28 17:38:34.767230',1,'admin','','carlos.rafael.ufms@gmail.com',1,1,'2024-10-25 14:43:52.408819','');
INSERT INTO "auth_user" VALUES (4,'pbkdf2_sha256$870000$0hZ7XEl5ygIGG11L8RBNJM$bmnHDfE8Z2WjcPSCRrpFdNJoRNkfaOUv9Gw1NB43kl8=','2025-01-28 17:50:27.620944',0,'CARLOS','','',0,1,'2025-01-23 19:12:59.946547','');
INSERT INTO "auth_user" VALUES (5,'pbkdf2_sha256$870000$CpZZnfVkbJTaajQT4insMV$Pw7Qzhf4Rbxvzsu5d4+rRG8HER8jq7auUK1YgrxekLg=','2025-01-24 18:47:24.523153',0,'Rafael','','',0,1,'2025-01-24 13:45:52.601901','');
INSERT INTO "auth_user" VALUES (6,'pbkdf2_sha256$870000$IMLqHDM22NCUcV4gPoZH2k$DiO2YHWClLsX0bDd7w5zJwx1e0K+MMKO95I7OB467fA=','2025-01-28 17:38:15.990133',0,'LOPES','','',0,1,'2025-01-28 17:38:15.133491','');
INSERT INTO "django_admin_log" VALUES (1,'1','Topic object (1)',1,'[{"added": {}}]',7,1,'2024-10-25 14:48:16.796530');
INSERT INTO "django_admin_log" VALUES (2,'1','Topic object (1)',2,'[]',7,1,'2024-10-25 14:48:49.254750');
INSERT INTO "django_admin_log" VALUES (3,'1','Topic object (1)',2,'[]',7,1,'2024-10-25 14:49:28.108337');
INSERT INTO "django_admin_log" VALUES (4,'1','Topic object (1)',3,'',7,1,'2024-10-25 14:49:54.545881');
INSERT INTO "django_admin_log" VALUES (5,'2','Topic object (2)',1,'[{"added": {}}]',7,1,'2024-10-25 14:50:08.203547');
INSERT INTO "django_admin_log" VALUES (6,'3','Xadrez',1,'[{"added": {}}]',7,1,'2024-10-25 14:59:48.700450');
INSERT INTO "django_admin_log" VALUES (7,'2','Xadrez',3,'',7,1,'2024-10-25 15:00:01.692616');
INSERT INTO "django_admin_log" VALUES (8,'4','Programação',1,'[{"added": {}}]',7,1,'2024-10-25 18:41:19.343406');
INSERT INTO "django_admin_log" VALUES (9,'1','Abertura gambito da rainha é com o peão da rainha....',1,'[{"added": {}}]',8,1,'2024-10-25 18:51:04.675047');
INSERT INTO "django_admin_log" VALUES (10,'2','Este é o curso de Django....',1,'[{"added": {}}]',8,1,'2024-10-25 18:52:29.037071');
INSERT INTO "django_admin_log" VALUES (11,'5','Curso de Python',1,'[{"added": {}}]',7,1,'2024-10-29 17:31:38.946061');
INSERT INTO "django_admin_log" VALUES (12,'2','Carlos',3,'',4,1,'2025-01-23 19:12:24.277649');
INSERT INTO "django_admin_log" VALUES (13,'3','Carlos1',3,'',4,1,'2025-01-23 19:12:24.277649');
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'learning_logs','topic');
INSERT INTO "django_content_type" VALUES (8,'learning_logs','entry');
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2024-10-24 12:20:10.835632');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2024-10-24 12:20:10.860638');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2024-10-24 12:20:10.881643');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2024-10-24 12:20:10.898647');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2024-10-24 12:20:10.908141');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2024-10-24 12:20:10.930812');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2024-10-24 12:20:10.947110');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2024-10-24 12:20:10.961004');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2024-10-24 12:20:10.972995');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2024-10-24 12:20:10.989854');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2024-10-24 12:20:10.995856');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2024-10-24 12:20:11.007164');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2024-10-24 12:20:11.023431');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2024-10-24 12:20:11.038626');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2024-10-24 12:20:11.053809');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2024-10-24 12:20:11.066280');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2024-10-24 12:20:11.081848');
INSERT INTO "django_migrations" VALUES (18,'sessions','0001_initial','2024-10-24 12:20:11.096289');
INSERT INTO "django_migrations" VALUES (19,'learning_logs','0001_initial','2024-10-24 20:35:54.366672');
INSERT INTO "django_migrations" VALUES (20,'learning_logs','0002_entry','2024-10-25 18:49:26.671218');
INSERT INTO "django_migrations" VALUES (21,'learning_logs','0003_topic_owner','2025-01-24 13:40:53.333643');
INSERT INTO "django_session" VALUES ('639jp894nwy1cv477gaktpx1trk4qj14','.eJxVjDsOwjAQBe_iGllxvP5R0nMGa9e7JgGUSHFSIe4OkVJA-2bmvVTGbR3y1mTJI6uzMur0uxGWh0w74DtOt1mXeVqXkfSu6IM2fZ1ZnpfD_TsYsA3fWjz4GNA66KyPidg7DpWhQLVCaIRc5L4H1xkkKb0PFRNZSKbakADV-wPdYzfc:1t4LXt:qA9WiKvDVosKXYpcMlwLgtac4nyIADdGbvSnK1jcgR4','2024-11-08 14:44:09.045346');
INSERT INTO "django_session" VALUES ('nxgdnt2bf6c5hcvwwtuvq8nss6p2o5mb','.eJxVjDsOwjAQBe_iGllxvP5R0nMGa9e7JgGUSHFSIe4OkVJA-2bmvVTGbR3y1mTJI6uzMur0uxGWh0w74DtOt1mXeVqXkfSu6IM2fZ1ZnpfD_TsYsA3fWjz4GNA66KyPidg7DpWhQLVCaIRc5L4H1xkkKb0PFRNZSKbakADV-wPdYzfc:1t5q3j:79KiVhPajI1jb4ZJk00EAK4v43HorM_DHIH_ws-8ta4','2024-11-12 17:31:11.432388');
INSERT INTO "django_session" VALUES ('wp8ugm1x4kws9aiwcbxbj809ruftzfvm','.eJxVjDsOwjAQBe_iGllxvP5R0nMGa9e7JgGUSHFSIe4OkVJA-2bmvVTGbR3y1mTJI6uzMur0uxGWh0w74DtOt1mXeVqXkfSu6IM2fZ1ZnpfD_TsYsA3fWjz4GNA66KyPidg7DpWhQLVCaIRc5L4H1xkkKb0PFRNZSKbakADV-wPdYzfc:1taJF7:v8iCDBqFYG_cfN9JMO-m4pUrnPu6uUby7CiA9eeUrKs','2025-02-04 18:44:53.937910');
INSERT INTO "django_session" VALUES ('w0jrucme0c73ao9tjwpsog5hznb8vu2p','e30:1tb2RM:yFOycff0_4I--qzRsPfX1yFtuR3DLtPbsjJe4rjDLyY','2025-02-06 19:00:32.451007');
INSERT INTO "learning_logs_entry" VALUES (1,'Abertura gambito da rainha é com o peão da rainha.','2024-10-25 18:51:04.673047',3);
INSERT INTO "learning_logs_entry" VALUES (2,'Este é o curso de Django.','2024-10-25 18:52:29.035070',4);
INSERT INTO "learning_logs_entry" VALUES (3,'A aula de Django de hoje foi excelente!','2024-10-31 20:06:02.044574',4);
INSERT INTO "learning_logs_entry" VALUES (4,'Xeque pastor é com o bispo.','2025-01-17 14:13:35.648982',3);
INSERT INTO "learning_logs_entry" VALUES (5,'Mate do Pastor é efetuado pelas brancas durante a abertura, que segue a ideia de atacar o peão que se encontra na casa f7 e que é defendido apenas pelo rei. Estes são os lances principais do mate do pastor.','2025-01-17 15:12:44.141427',3);
INSERT INTO "learning_logs_entry" VALUES (6,'Fiz o curso de Flask em meados de 2024','2025-01-24 14:24:28.636902',8);
INSERT INTO "learning_logs_entry" VALUES (7,'Retomei em 2025','2025-01-24 14:25:51.422392',5);
INSERT INTO "learning_logs_entry" VALUES (8,'Avançar nos cursos em 2025','2025-01-24 14:29:24.598010',9);
INSERT INTO "learning_logs_topic" VALUES (3,'Xadrez','2024-10-25 14:59:48.699450',4);
INSERT INTO "learning_logs_topic" VALUES (4,'Programação','2024-10-25 18:41:19.342407',4);
INSERT INTO "learning_logs_topic" VALUES (5,'Curso de Python','2024-10-29 17:31:38.944060',4);
INSERT INTO "learning_logs_topic" VALUES (6,'Matemática','2024-10-31 18:41:36.798358',4);
INSERT INTO "learning_logs_topic" VALUES (7,'Inglês','2024-10-31 18:42:20.894094',4);
INSERT INTO "learning_logs_topic" VALUES (8,'Flask','2025-01-24 14:23:40.356825',5);
INSERT INTO "learning_logs_topic" VALUES (9,'IA','2025-01-24 14:28:59.589121',4);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "learning_logs_entry_topic_id_83697a9a" ON "learning_logs_entry" (
	"topic_id"
);
CREATE INDEX IF NOT EXISTS "learning_logs_topic_owner_id_67ecce32" ON "learning_logs_topic" (
	"owner_id"
);
COMMIT;
