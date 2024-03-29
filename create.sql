create database fetch_rewards;
use fetch_rewards;

SET innodb_strict_mode = 0;
SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE IF NOT EXISTS `brands` (
  `ID` VARCHAR(30) NOT NULL PRIMARY KEY,
  `BARCODE` VARCHAR(40),
  `BRAND_CODE` VARCHAR(1024),
  `CPG_ID` VARCHAR(1024),
  `CATEGORY` VARCHAR(1024),
  `CATEGORY_CODE` VARCHAR(1024),
  `NAME` VARCHAR(1024),
  `ROMANCE_TEXT` VARCHAR(1024),
  `RELATED_BRAND_IDS` VARCHAR(1024)
);

CREATE TABLE IF NOT EXISTS `users` (
  `CREATED_DATE` VARCHAR(1024),
  `BIRTH_DATE` VARCHAR(1024),
  `GENDER` VARCHAR(1024),
  `LAST_REWARDS_LOGIN` VARCHAR(1024),
  `STATE` VARCHAR(1024),
  `SIGN_UP_PLATFORM` VARCHAR(1024),
  `SIGN_UP_SOURCE` VARCHAR(1024),
  `ID` VARCHAR(24) NOT NULL PRIMARY KEY
);


CREATE TABLE IF NOT EXISTS `receipts` (
  `ID` VARCHAR(36) NOT NULL PRIMARY KEY,
  `STORE_NAME` VARCHAR(86),
  `PURCHASE_DATE` VARCHAR(20),
  `PURCHASE_TIME` VARCHAR(11),
  `DATE_SCANNED` VARCHAR(24),
  `TOTAL_SPENT` VARCHAR(25),
  `REWARDS_RECEIPT_STATUS` VARCHAR(1024),
  `USER_ID` VARCHAR(24),
  `USER_VIEWED` VARCHAR(1024),
  `PURCHASED_ITEM_COUNT` VARCHAR(20),
  `CREATE_DATE` VARCHAR(24),
  `PENDING_DATE` VARCHAR(24),
  `MODIFY_DATE` VARCHAR(24),
  `FLAGGED_DATE` VARCHAR(24),
  `PROCESSED_DATE` VARCHAR(24),
  `FINISHED_DATE` VARCHAR(24),
  `REJECTED_DATE` VARCHAR(24),
  `NEEDS_FETCH_REVIEW` VARCHAR(4),
  `DIGITAL_RECEIPT` VARCHAR(10),
  `DELETED` VARCHAR(10),
  `NON_POINT_EARNING_RECEIPT` VARCHAR(10),
   FOREIGN KEY (USER_ID) REFERENCES users (ID)
);


CREATE TABLE IF NOT EXISTS `receipt_items` (
  `REWARDS_RECEIPT_ID` VARCHAR(36),
  `ITEM_INDEX` VARCHAR(20),
  `REWARDS_RECEIPT_ITEM_ID` VARCHAR(32) NOT NULL PRIMARY KEY,
  `DESCRIPTION` VARCHAR(400),
  `BARCODE` VARCHAR(40),
  `BRAND_CODE` VARCHAR(150),
  `QUANTITY_PURCHASED` VARCHAR(20),
  `TOTAL_FINAL_PRICE` VARCHAR(20),
  `POINTS_EARNED` VARCHAR(30),
  `REWARDS_GROUP` VARCHAR(70),
  `ORIGINAL_RECEIPT_ITEM_TEXT` VARCHAR(410),
  `MODIFY_DATE` VARCHAR(24),
  FOREIGN KEY (REWARDS_RECEIPT_ID) REFERENCES receipts (ID)
);

