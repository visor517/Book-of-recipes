BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
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
CREATE TABLE IF NOT EXISTS "recipes_recipecategory" (
	"alias"	varchar(16) NOT NULL,
	"name"	varchar(64) NOT NULL UNIQUE,
	"description"	text,
	PRIMARY KEY("alias")
);
CREATE TABLE IF NOT EXISTS "recipes_recipeimage" (
	"id"	integer NOT NULL,
	"image"	varchar(100) NOT NULL,
	"recipe_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("recipe_id") REFERENCES "recipes_recipe"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "recipes_recipe" (
	"id"	integer NOT NULL,
	"name"	varchar(256) NOT NULL,
	"description"	text,
	"category_id"	varchar(16) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("category_id") REFERENCES "recipes_recipecategory"("alias") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2022-02-18 15:39:06.309936');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2022-02-18 15:39:06.447675');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2022-02-18 15:39:06.575704');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2022-02-18 15:39:06.670561');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2022-02-18 15:39:06.784907');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2022-02-18 15:39:06.871706');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2022-02-18 15:39:06.957782');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2022-02-18 15:39:07.049001');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2022-02-18 15:39:07.142207');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2022-02-18 15:39:07.227853');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2022-02-18 15:39:07.298744');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2022-02-18 15:39:07.347084');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2022-02-18 15:39:07.410673');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2022-02-18 15:39:07.494029');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2022-02-18 15:39:07.576321');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2022-02-18 15:39:07.662750');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2022-02-18 15:39:07.795542');
INSERT INTO "django_migrations" VALUES (18,'recipes','0001_initial','2022-02-18 15:39:07.876378');
INSERT INTO "django_migrations" VALUES (19,'sessions','0001_initial','2022-02-18 15:39:08.008006');
INSERT INTO "django_admin_log" VALUES (1,'2022-02-18 16:37:27.076145','pasta','Макароны','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (2,'2022-02-18 16:41:58.271714','1','Салат Цезарь с курицей и сухариками | Салаты','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (3,'2022-02-18 16:48:00.092297','1','Image for Салат Цезарь с курицей и сухариками','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (4,'2022-02-18 16:55:48.990223','1','Image 1 for Салат Цезарь с курицей и сухариками','[{"changed": {"fields": ["Image"]}}]',9,1,2);
INSERT INTO "django_admin_log" VALUES (5,'2022-02-19 10:42:22.170281','2','Бургер с сёмгой, лимоном и укропом | Гамбургеры','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (6,'2022-02-19 10:42:57.997499','3','Бургер. Три Сыра | Гамбургеры','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (7,'2022-02-19 10:44:08.166516','4','Бургер по гавайски | Гамбургеры','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (8,'2022-02-19 10:44:48.144277','2','Image 2 for Бургер с сёмгой, лимоном и укропом','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (9,'2022-02-19 10:45:24.504399','3','Image 3 for Бургер. Три Сыра','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (10,'2022-02-19 10:45:35.307399','4','Image 4 for Бургер по гавайски','[{"added": {}}]',9,1,1);
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'recipes','recipe');
INSERT INTO "django_content_type" VALUES (8,'recipes','recipecategory');
INSERT INTO "django_content_type" VALUES (9,'recipes','recipeimage');
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
INSERT INTO "auth_permission" VALUES (25,7,'add_recipe','Can add recipe');
INSERT INTO "auth_permission" VALUES (26,7,'change_recipe','Can change recipe');
INSERT INTO "auth_permission" VALUES (27,7,'delete_recipe','Can delete recipe');
INSERT INTO "auth_permission" VALUES (28,7,'view_recipe','Can view recipe');
INSERT INTO "auth_permission" VALUES (29,8,'add_recipecategory','Can add recipe category');
INSERT INTO "auth_permission" VALUES (30,8,'change_recipecategory','Can change recipe category');
INSERT INTO "auth_permission" VALUES (31,8,'delete_recipecategory','Can delete recipe category');
INSERT INTO "auth_permission" VALUES (32,8,'view_recipecategory','Can view recipe category');
INSERT INTO "auth_permission" VALUES (33,9,'add_recipeimage','Can add recipe image');
INSERT INTO "auth_permission" VALUES (34,9,'change_recipeimage','Can change recipe image');
INSERT INTO "auth_permission" VALUES (35,9,'delete_recipeimage','Can delete recipe image');
INSERT INTO "auth_permission" VALUES (36,9,'view_recipeimage','Can view recipe image');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$260000$wbphsKqWDXAhUHrTeScWTj$QEp15+ZAvtCYX+b4HxUovIJxOeqsEr0XNc7GLH7mBwo=','2022-02-18 16:28:35.647315',1,'admin','','',1,1,'2022-02-18 16:27:46.229438','');
INSERT INTO "recipes_recipecategory" VALUES ('burgers','Гамбургеры','Булочки с мясом. Или без (');
INSERT INTO "recipes_recipecategory" VALUES ('salads','Салаты','Холодные блюда из кусочков овощей, зелени, различных других растений, грибов, с добавлением приправ.');
INSERT INTO "recipes_recipecategory" VALUES ('pasta','Макароны','Изделия различной формы из высушенного теста, замешанного из пшеничной муки и воды.');
INSERT INTO "recipes_recipeimage" VALUES (1,'recipes_images/0becbb6fc429cf8a351d747ac10e019d_800x642_444.jpg',1);
INSERT INTO "recipes_recipeimage" VALUES (2,'recipes_images/meal-1.jpg',2);
INSERT INTO "recipes_recipeimage" VALUES (3,'recipes_images/meal-2.jpg',3);
INSERT INTO "recipes_recipeimage" VALUES (4,'recipes_images/meal-3.jpg',4);
INSERT INTO "recipes_recipe" VALUES (1,'Салат Цезарь с курицей и сухариками','Салат «Церарь» имеет множество вариантов, некоторые кладут в него помидоры, некоторые — оливки и кусочки лимона, некоторые – креветки и другие морепродукты. Но обязательными ингредиентами этого салата являются курица и яйцо. Яркость блюду придают листья салата. Чтобы еще более разнообразить вкус и добавить цветов, я также кладу в салат кусочки помидоров. Очень важной является заправка салата «Цезарь», ее правильное приготовление, наверное, значит больше, чем состав самого салата. Заправка для салата «Цезарь» действительно уникальная и оригинальная, она состоит из свежего яйца, лимонного сока, чеснока, горчицы, оливкового масла или вустерского соуса. В наше время очень редко готовят заправку для салата «Цезарь» именно с яйцом, все чаще используют лишь лимонный сок, горчицу и оливковое масло. Именно такой я предлагаю вариант, как приготовить салат «Цезарь» с курицей и сухариками.','salads');
INSERT INTO "recipes_recipe" VALUES (2,'Бургер с сёмгой, лимоном и укропом','Это бургер с рыбной котлетой — фишбургер. Три четверти филе сёмги (без костей и кожи) пропустите через мясорубку, остальное нарежьте на небольшие кубики. Смешайте с яичными белками, горчицей, панировочными сухарями, цедрой лимона, солью, укропом и соусом Veracha. Если последнего нет под рукой, используйте любой другой острый томатный соус.

Сформуйте котлеты и обжарьте на гриле (около пяти минут с каждой стороны). Также котлеты можно обжарить на сковороде на оливковом масле.

Прогрейте булочки на гриле и выложите на них готовые котлеты. Сверху положите порезанный кольцами редис, рукколу и полейте соусом дзадзики.','burgers');
INSERT INTO "recipes_recipe" VALUES (3,'Бургер. Три Сыра','Указанного количества ингредиентов хватит на один бургер.

Сформовав и посолив котлету, обжарьте её на гриле. Когда она будет почти готова, положите сверху по ломтику моцареллы, чеддера и эмменталя: сыр должен расплавиться. Успейте убрать котлеты с огня, пока сыр не начал пузыриться и течь.

Соберите бургер: смажьте подсушенные на гриле булочки домашним майонезом, выложите листья салата романо, нарезанный кружками помидор, а затем котлету. В конце украсьте всё луком фри.

(Лук фри — это то же, что и картошка фри, только в данном случае во фритюре обжаривается репчатый лук.)','burgers');
INSERT INTO "recipes_recipe" VALUES (4,'Бургер по гавайски','Промойте, порежьте на тонкие пластинки, посолите, поперчите и обжарьте на сливочном масле грибы.

Сформуйте и обжарьте на гриле котлеты. Не забудьте перед этим посолить и поперчить их.

Ананас очистьте и нарежьте кольцами. Обжарьте его на гриле так, чтобы остались характерные полоски. Также слегка подсушите на гриле булочки.

Полейте булочки соусом терияки (о том, как его приготовить, читайте здесь), выложите на них котлеты, грибы и дольки ананаса. Вновь щедро полейте соусом и украсьте салатом романо.

Наша подборка подошла к концу. Но вы можете продолжить её в комментариях. Делитесь рецептами своих любимых бургеров.','burgers');
INSERT INTO "django_session" VALUES ('sam2w07ykk1zt9jigiy2dnclj3rwssif','.eJxVjEEOgjAQRe_StWmmLQzi0j1naKadGUFNSSisjHdXEha6_e-9_zKRtnWMW5UlTmwuxpnT75YoP6TsgO9UbrPNc1mXKdldsQetdphZntfD_TsYqY7fmqjxHhUFOmBWxkwgwRH4VqAnhJQUsE0hs2iDGlTUnbX3SLnLqOb9AQPCORE:1nL67X:OpZKCXhuJArg1btKaIEhTPhBZ9o_NFE-ypoQt-Dx6to','2022-03-04 16:28:35.708331');
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
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
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "recipes_recipeimage_recipe_id_5533e25b" ON "recipes_recipeimage" (
	"recipe_id"
);
CREATE INDEX IF NOT EXISTS "recipes_recipe_category_id_6d665355" ON "recipes_recipe" (
	"category_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
COMMIT;
