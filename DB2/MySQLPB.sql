

-- 회원정보
DROP TABLE IF EXISTS `PB`.`MMBR_INF` RESTRICT;

-- 회원정보
CREATE TABLE `PB`.`MMBR_INF` (
	`MMBR_NMBR`  INT          NOT NULL, -- 회원번호
	`MMBR_ID`    VARCHAR(16)  NOT NULL, -- 회원아이디
	`MMBR_EMAIL` VARCHAR(40)  NOT NULL, -- 회원이메일
	`MMBR_NM`    VARCHAR(50)  NOT NULL, -- 회원이름
	`MMBR_PHOTO` VARCHAR(120) NULL      -- 회원사진
);

-- 회원정보
ALTER TABLE `PB`.`MMBR_INF`
	ADD CONSTRAINT `PK_MMBR_INF` -- 회원정보 기본키
		PRIMARY KEY (
			`MMBR_NMBR` -- 회원번호
		);

ALTER TABLE `PB`.`MMBR_INF`
	MODIFY COLUMN `MMBR_NMBR` INT NOT NULL AUTO_INCREMENT;


-------------------------------------------------------------------------


-- 학교정보
DROP TABLE IF EXISTS `PB`.`UNIV_INF` RESTRICT;

-- 학교정보
CREATE TABLE  `PB`.`UNIV_INF` (
	`UNIV_NMBR` INT NOT NULL, -- 학교정보번호
	`MAJ`       INT NOT NULL, -- 전공명
	`GRD`       INT NOT NULL  -- 학년
);

-- 학교정보
ALTER TABLE `PB`.`UNIV_INF`
	ADD CONSTRAINT `PK_UNIV_INF` -- 학교정보 기본키
		PRIMARY KEY (
			`UNIV_NMBR` -- 학교정보번호
		);

ALTER TABLE `PB`.`UNIV_INF`
	MODIFY COLUMN `UNIV_NMBR` INT NOT NULL AUTO_INCREMENT;



-------------------------------------------------------------------------



-- 회사정보
DROP TABLE IF EXISTS `PB`.`COMP_INF` RESTRICT;

-- 회사정보
CREATE TABLE `PB`.`COMP_INF` (
	`COMP_NMBR` INT         NOT NULL, -- 회사정보번호
	`COMP_NM`   VARCHAR(50) NOT NULL  -- 회사이름
);

-- 회사정보
ALTER TABLE `PB`.`COMP_INF` 
	ADD CONSTRAINT `PK_COMP_INF` -- 회사정보 기본키
		PRIMARY KEY (
			`COMP_NMBR` -- 회사정보번호
		);

ALTER TABLE `PB`.`COMP_INF` 
	MODIFY COLUMN `COMP_NMBR` INT NOT NULL AUTO_INCREMENT;



-----------------------------------------------------------------------------



-- 친구정보 
DROP TABLE IF EXISTS `PB`.`FREN_INF`  RESTRICT;

-- 친구정보 
CREATE TABLE `PB`.`FREN_INF`  (
	`FREN_NMBR`     INT          NOT NULL, -- 친구번호
	`FREN_NM`       VARCHAR(50)  NOT NULL, -- 친구이름
	`FREN_PHN_NMBR` VARCHAR(30)  NOT NULL, -- 친구전화번호
	`FREN_EMAIL`    VARCHAR(40)  NULL,     -- 친구이메일
	`FREN_ADDR`     VARCHAR(255) NULL,     -- 친구주소
	`FREN_PHOTO`    VARCHAR(120) NULL,     -- 친구사진
	`MMBR_NMBR`     INT          NOT NULL, -- 회원번호
	`id`            INT          NULL,     -- 학교정보번호
	`id2`           INT          NULL      -- 회사정보번호
);

-- 친구정보 
ALTER TABLE `PB`.`FREN_INF`  
	ADD CONSTRAINT `PK_FREN_INF` -- 친구정보  기본키
		PRIMARY KEY (
			`FREN_NMBR` -- 친구번호
		);

ALTER TABLE `PB`.`FREN_INF`  
	MODIFY COLUMN `FREN_NMBR` INT NOT NULL AUTO_INCREMENT;

-- 친구정보 
ALTER TABLE `PB`.`FREN_INF`
	ADD CONSTRAINT `FK_MMBR_INF_TO_FREN_INF` -- 회원정보 -> 친구정보 
		FOREIGN KEY (
			`MMBR_NMBR` -- 회원번호
		)
		REFERENCES `PB`.`MMBR_INF` ( -- 회원정보
			`MMBR_NMBR` -- 회원번호
		);

-- 친구정보 
ALTER TABLE `PB`.`FREN_INF`
	ADD CONSTRAINT `FK_UNIV_INF_TO_FREN_INF` -- 학교정보 -> 친구정보 
		FOREIGN KEY (
			`id` -- 학교정보번호
		)
		REFERENCES `PB`.`UNIV_INF` ( -- 학교정보
			`UNIV_NMBR` -- 학교정보번호
		);

-- 친구정보 
ALTER TABLE `PB`.`FREN_INF`
	ADD CONSTRAINT `FK_COMP_INF_TO_FREN_INF` -- 회사정보 -> 친구정보 
		FOREIGN KEY (
			`id2` -- 회사정보번호
		)
		REFERENCES `PB`.`COMP_INF` ( -- 회사정보
			`COMP_NMBR` -- 회사정보번호
		);