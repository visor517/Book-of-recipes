BEGIN TRANSACTION;
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
INSERT INTO "recipes_recipecategory" VALUES ('burgers','Гамбургеры','Булочки с мясом. Или без (');
INSERT INTO "recipes_recipecategory" VALUES ('salads','Салаты','Холодные блюда из кусочков овощей, зелени, различных других растений, грибов, с добавлением приправ.');
INSERT INTO "recipes_recipecategory" VALUES ('pasta','Макароны','Изделия различной формы из высушенного теста, замешанного из пшеничной муки и воды.');
INSERT INTO "recipes_recipeimage" VALUES (1,'recipes_images/0becbb6fc429cf8a351d747ac10e019d_800x642_444.jpg',1);
INSERT INTO "recipes_recipe" VALUES (1,'Салат Цезарь с курицей и сухариками','Салат «Церарь» имеет множество вариантов, некоторые кладут в него помидоры, некоторые — оливки и кусочки лимона, некоторые – креветки и другие морепродукты. Но обязательными ингредиентами этого салата являются курица и яйцо. Яркость блюду придают листья салата. Чтобы еще более разнообразить вкус и добавить цветов, я также кладу в салат кусочки помидоров. Очень важной является заправка салата «Цезарь», ее правильное приготовление, наверное, значит больше, чем состав самого салата. Заправка для салата «Цезарь» действительно уникальная и оригинальная, она состоит из свежего яйца, лимонного сока, чеснока, горчицы, оливкового масла или вустерского соуса. В наше время очень редко готовят заправку для салата «Цезарь» именно с яйцом, все чаще используют лишь лимонный сок, горчицу и оливковое масло. Именно такой я предлагаю вариант, как приготовить салат «Цезарь» с курицей и сухариками.','salads');
CREATE INDEX IF NOT EXISTS "recipes_recipeimage_recipe_id_5533e25b" ON "recipes_recipeimage" (
	"recipe_id"
);
CREATE INDEX IF NOT EXISTS "recipes_recipe_category_id_6d665355" ON "recipes_recipe" (
	"category_id"
);
COMMIT;
