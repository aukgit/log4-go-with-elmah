/*
 Navicat Premium Data Transfer

 Source Server         : log4goDb
 Source Server Type    : SQLite
 Source Server Version : 3030001
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3030001
 File Encoding         : 65001

 Date: 21/07/2020 17:02:59
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for AuthLogs
-- ----------------------------
DROP TABLE IF EXISTS "AuthLogs";
CREATE TABLE "AuthLogs" (
  "AuthId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "UserName" TEXT,
  "UserRoles" TEXT,
  "LoginTimestamp" TIMESTAMP
);

-- ----------------------------
-- Table structure for all-logs
-- ----------------------------
DROP TABLE IF EXISTS "all-logs";
CREATE TABLE "all-logs" (
  "LoggingId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "Title" TEXT,
  "VariableName" TEXT,
  "VariableValue" TEXT,
  "Stacks" TEXT DEFAULT NULL,
  "JsonError" TEXT DEFAULT NULL,
  "Timestamp" TIMESTAMP,
  "IsError" INTEGER(1) NOT NULL DEFAULT 0,
  "IsDebug" INTEGER(1) NOT NULL DEFAULT 0,
  "IsWarning" INTEGER(1) NOT NULL DEFAULT 0,
  "IsTrace" INTEGER(1) NOT NULL DEFAULT 0,
  "IsInfo" INTEGER(1) NOT NULL DEFAULT 0,
  "IsFatal" INTEGER(1) NOT NULL DEFAULT 0,
  "IsFileIOError" INTEGER(1) NOT NULL DEFAULT 0,
  "IsGuestUser" INTEGER(1) NOT NULL DEFAULT 0,
  "IsStep" INTEGER(1) NOT NULL DEFAULT 0,
  "SystemMode" TEXT,
  "FileName" TEXT,
  "PackageName" TEXT,
  "LineNumber" INTEGER,
  "FilePath" TEXT DEFAULT NULL,
  "UserId" TEXT DEFAULT NULL,
  "UserRole" TEXT DEFAULT NULL,
  "BrowserSession" TEXT,
  "FunctionName" TEXT DEFAULT NULL,
  "EntitiesJson" TEXT,
  "EntityName" TEXT
);

-- ----------------------------
-- Table structure for sqlite_sequence
-- ----------------------------
DROP TABLE IF EXISTS "sqlite_sequence";
CREATE TABLE "sqlite_sequence" (
  "name" ,
  "seq" 
);

-- ----------------------------
-- Records of sqlite_sequence
-- ----------------------------
INSERT INTO "sqlite_sequence" VALUES ('all-logs', 0);

-- ----------------------------
-- View structure for DebugLogsView
-- ----------------------------
DROP VIEW IF EXISTS "DebugLogsView";
CREATE VIEW "DebugLogsView" AS SELECT
	"all-logs".*
FROM
	"all-logs"
WHERE
	"all-logs".IsDebug = 1;

-- ----------------------------
-- View structure for DevelopmentSystemLogsView
-- ----------------------------
DROP VIEW IF EXISTS "DevelopmentSystemLogsView";
CREATE VIEW "DevelopmentSystemLogsView" AS SELECT
	"all-logs".*
FROM
	"all-logs"
WHERE
	"all-logs".SystemMode = 'Development';

-- ----------------------------
-- View structure for ErrorLogsView
-- ----------------------------
DROP VIEW IF EXISTS "ErrorLogsView";
CREATE VIEW "ErrorLogsView" AS SELECT
	"all-logs".*
FROM
	"all-logs"
WHERE
	"all-logs".IsError = 1;

-- ----------------------------
-- View structure for ProductiontSystemLogsView
-- ----------------------------
DROP VIEW IF EXISTS "ProductiontSystemLogsView";
CREATE VIEW "ProductiontSystemLogsView" AS SELECT
	"all-logs".*
FROM
	"all-logs"
WHERE
	"all-logs".SystemMode = 'Production';

-- ----------------------------
-- View structure for TraceLogsView
-- ----------------------------
DROP VIEW IF EXISTS "TraceLogsView";
CREATE VIEW "TraceLogsView" AS SELECT
	"all-logs".*
FROM
	"all-logs"
WHERE
	"all-logs".IsTrace = 1;

-- ----------------------------
-- View structure for WarningLogsView
-- ----------------------------
DROP VIEW IF EXISTS "WarningLogsView";
CREATE VIEW "WarningLogsView" AS SELECT
	"all-logs".*
FROM
	"all-logs"
WHERE
	"all-logs".IsWarning = 1;

-- ----------------------------
-- Auto increment value for all-logs
-- ----------------------------

PRAGMA foreign_keys = true;
