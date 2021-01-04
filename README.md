# MySQL
This repository includes about my database experiences which are coded on MySQL Workbench.

Final Project:
This project is about The Meta Analysis data of SCIP flep(superficial circumflex iliac artery perforator) treatments made all over the world available until January 2018. You can reach to these datas which are like Countries, Article names etc., easily from this Project.

-To provide a brief users guide describing in sufficient detail what each View/Stored procedure does.
https://images2.imgbox.com/f9/e7/NN3BKRD1_o.png
I created this view, because we can see easily which gender is more than the other one for a FlapType. And it can help us to see the relation between gender and flap type.

https://images2.imgbox.com/f3/2c/nUXH6zhY_o.png
I created this procedure, because I want to get Author Name and Year of a Journal easily.

https://images2.imgbox.com/c3/b0/riGDT7yC_o.png
And this procedure is to get vessel type count which we want to get that by using vessel type and vessel diameter. So I can check amount of vessel type with this procedure.

https://images2.imgbox.com/98/9e/I4Equ63e_o.png
This procedure helps to get next more difficult operation time

-To submit a full relational table specification of your database in the SQL Database Definition Language (DDL) This specification includes both the data type of each attribute the not null constraint when appropriate and sample data values for each attribute represented as comments You should also specify the primary keys (e g primary key (ssn)) and referential constraints (e g foreign key (mgrssn) references employee(ssn)) Many groups included this specification in their project proposal. 

-- -----------------------------------------------------
-- Table `mydb`.`Journal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Journal` (
  `Id` INT NOT NULL,
  `Country` VARCHAR(10) NOT NULL,
  `Journal_name` VARCHAR(50) NOT NULL,
  `Language` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`Id`));

-- -----------------------------------------------------
-- Table `mydb`.`Article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Article` (
  `Id` INT NOT NULL,
  `Author` VARCHAR(45) NOT NULL,
  `Article_type` VARCHAR(45) NOT NULL,
  `Year` INT NOT NULL,
  `Journal_Id` INT NOT NULL,
  PRIMARY KEY (`Id`, `Journal_Id`),
  CONSTRAINT `fk_Article_Journal_Id`
    FOREIGN KEY (`Journal_Id`)
    REFERENCES `mydb`.`Journal` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `mydb`.`Patient_Parameters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient_Parameters` (
  `Id` INT NOT NULL,
  `PatientNumber` VARCHAR(10) NOT NULL,
  `MaleNumber` VARCHAR(10) NOT NULL,
  `FemaleNumber` VARCHAR(10) NOT NULL,
  `AgeAvg` VARCHAR(10) NOT NULL,
  `BodyMassAvg` VARCHAR(10) NOT NULL,
  `Article_Id` INT NOT NULL,
  `Article_Journal_Id` INT NOT NULL,
  PRIMARY KEY (`Id`, `Article_Id`, `Article_Journal_Id`),
  CONSTRAINT `fk_Patient_Parameters_Article_Id`
    FOREIGN KEY (`Article_Id`)
    REFERENCES `mydb`.`Article` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_Parameters_Article_Journal_Id`
    FOREIGN KEY (`Article_Journal_Id`)
    REFERENCES `mydb`.`Article` (`Journal_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `mydb`.`Flap_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Flap_info` (
  `Id` INT NOT NULL,
  `FlapType` VARCHAR(100) NOT NULL,
  `FlapNumber` VARCHAR(20) NOT NULL,
  `Free/Local` VARCHAR(35) NOT NULL,
  `Flap_Thicness` VARCHAR(45) NOT NULL,
  `Flap/Detect` VARCHAR(20) NOT NULL,
  `Flap_failure` VARCHAR(45) NOT NULL,
  `Article_Id` INT NOT NULL,
  `Article_Journal_Id` INT NOT NULL,
  PRIMARY KEY (`Id`, `Article_Id`, `Article_Journal_Id`),
  CONSTRAINT `fk_Flap_info_Article_Id`
    FOREIGN KEY (`Article_Id`)
    REFERENCES `mydb`.`Article` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flap_info_Article_Journal_Id`
    FOREIGN KEY (`Article_Journal_Id`)
    REFERENCES `mydb`.`Article` (`Journal_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `mydb`.`Times`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Times` (
  `Id` INT NOT NULL,
  `OperationTimeAvg` VARCHAR(10) NOT NULL,
  `Follow-Up_time` VARCHAR(10) NOT NULL,
  `StayLength` VARCHAR(10) NOT NULL,
  `Article_Id` INT NOT NULL,
  `Article_Journal_Id` INT NOT NULL,
  PRIMARY KEY (`Id`, `Article_Id`, `Article_Journal_Id`),
  CONSTRAINT `fk_Times_Article_Id`
    FOREIGN KEY (`Article_Id`)
    REFERENCES `mydb`.`Article` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Times_Article_Journal_Id`
    FOREIGN KEY (`Article_Journal_Id`)
    REFERENCES `mydb`.`Article` (`Journal_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Body_parameters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Body_parameters` (
  `Id` INT NOT NULL,
  `Bone_Dimension(cm)` VARCHAR(10) NOT NULL,
  `VesselType` VARCHAR(45) NOT NULL,
  `DeepBranch` VARCHAR(10) NOT NULL,
  `SuperficialBranch` VARCHAR(10) NOT NULL,
  `PedicleLength` VARCHAR(10) NOT NULL,
  `VesselDiameter` VARCHAR(10) NOT NULL,
  `Article_Id` INT NOT NULL,
  `Article_Journal_Id` INT NOT NULL,
  PRIMARY KEY (`Id`, `Article_Id`, `Article_Journal_Id`),
  CONSTRAINT `fk_Body_parameters_Article_Id`
    FOREIGN KEY (`Article_Id`)
    REFERENCES `mydb`.`Article` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Body_parameters_Article_Journal_Id`
    FOREIGN KEY (`Article_Journal_Id`)
    REFERENCES `mydb`.`Article` (`Journal_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `mydb`.`Operation_Parameters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Operation_Parameters` (
  `Id` INT NOT NULL,
  `Donorsite_closure` VARCHAR(200) NOT NULL,
  `PerforatorNumber` VARCHAR(10) NOT NULL,
  `AnostomasisType` VARCHAR(200) NOT NULL,
  `Article_Id` INT NOT NULL,
  `Article_Journal_Id` INT NOT NULL,
  PRIMARY KEY (`Id`, `Article_Id`, `Article_Journal_Id`),
  CONSTRAINT `fk_Operation_Parameters_Article_Id`
    FOREIGN KEY (`Article_Id`)
    REFERENCES `mydb`.`Article` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Operation_Parameters_Article_Journal_Id`
    FOREIGN KEY (`Article_Journal_Id`)
    REFERENCES `mydb`.`Article` (`Journal_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Preoperation_Parameters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Preoperation_Parameters` (
  `Id` INT NOT NULL,
  `PreoperationIdentification` VARCHAR(255) NOT NULL,
  `Indication` VARCHAR(45) BINARY NOT NULL,
  `RecipientArea` VARCHAR(200) NOT NULL,
  `Article_Id` INT NOT NULL,
  `Article_Journal_Id` INT NOT NULL,
  PRIMARY KEY (`Id`, `Article_Id`, `Article_Journal_Id`),
  CONSTRAINT `fk_Preoperation_Parameters_Article_Id`
    FOREIGN KEY (`Article_Id`)
    REFERENCES `mydb`.`Article` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Preoperation_Parameters_Article_Journal_Id`
    FOREIGN KEY (`Article_Journal_Id`)
    REFERENCES `mydb`.`Article` (`Journal_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Postoperation_Parameters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Postoperation_Parameters` (
  `Id` INT NOT NULL,
  `Complication` VARCHAR(10) NOT NULL,
  `Revisions` VARCHAR(10) NOT NULL,
  `Debulking` VARCHAR(10) NOT NULL,
  `Article_Id` INT NOT NULL,
  `Article_Journal_Id` INT NOT NULL,
  PRIMARY KEY (`Id`, `Article_Id`, `Article_Journal_Id`),
  CONSTRAINT `fk_Postoperation_Parameters_Article_Id`
    FOREIGN KEY (`Article_Id`)
    REFERENCES `mydb`.`Article` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Postoperation_Parameters_Article_Journal_Id`
    FOREIGN KEY (`Article_Journal_Id`)
    REFERENCES `mydb`.`Article` (`Journal_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `mydb`.`denormalized`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`denormalized` (
  `Country` VARCHAR(10) NULL,
  `Journal_name` VARCHAR(50) NULL,
  `Language` VARCHAR(12) NULL,
  `Author` VARCHAR(45) NULL,
  `Article_type` VARCHAR(45) NULL,
  `Year` INT NULL,
  `FlapType` VARCHAR(100) NULL,
  `FlapNumber` VARCHAR(20) NULL,
  `Free/Local` VARCHAR(35) NULL,
  `Flap_Thicness` VARCHAR(45) NULL,
  `Flap/Detect` VARCHAR(20) NULL,
  `Flap_failure` VARCHAR(45) NULL,
  `OperationTimeAvg` VARCHAR(10) NULL,
  `Follow-Up_time` VARCHAR(10) NULL,
  `StayLength` VARCHAR(10) NULL,
  `Donorsite_closure` VARCHAR(200) NULL,
  `PerforatorNumber` VARCHAR(10) NULL,
  `AnostomasisType` VARCHAR(200) NULL,
  `PatientNumber` VARCHAR(10) NULL,
  `MaleNumber` VARCHAR(10) NULL,
  `FemaleNumber` VARCHAR(10) NULL,
  `AgeAvg` VARCHAR(10) NULL,
  `BodyMassAvg` VARCHAR(10) NULL,
  `Bone_Dimension` VARCHAR(10) NULL,
  `VesselType` VARCHAR(45) NULL,
  `DeepBranch` VARCHAR(10) NULL,
  `SuperficialBranch` VARCHAR(10) NULL,
  `PedicleLength` VARCHAR(10) NULL,
  `VesselDiameter` VARCHAR(10) NULL,
  `PreoperationIdentification` VARCHAR(255) NULL,
  `Indication` VARCHAR(45) NULL,
  `RecipientArea` VARCHAR(200) NULL,
  `Complication` VARCHAR(10) NULL,
  `Revisions` VARCHAR(10) NULL,
  `Debulking` VARCHAR(10) NULL)
ENGINE = InnoDB;

USE `mydb` ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

