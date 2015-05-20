---
author: sonia
comments: true
date: 2014-01-06 06:34:22+00:00
slug: mysql-substring_index-function-on-microsoft-mssql
title: MySQL SUBSTRING_INDEX function on Microsoft MSSQL
wordpress_id: 1945
categories:
- Other-Tech
tags:
- MSSQL
- MySQL
---

I'm porting some code from MySQL to Microsoft MSSQL, and unfortunately MSSQL doesn't have a [SUBSTRING_INDEX](http://dev.mysql.com/doc/refman/5.1/en/string-functions.html#function_substring-index) function. Here's a version I _quickly _implemented, called "my_substring_index".

Limitations:



	
  * only accepts strings up to 255 chars long

	
  * only works with varchars - we speak ASCII here...



[sourcecode lang="sql"]
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE FUNCTION [dbo].[my_substring_index]
(@str VARCHAR (255), @delim VARCHAR (1), @count INT)
RETURNS VARCHAR (255)
AS
BEGIN
    DECLARE @result AS VARCHAR (255), @posn AS INT, @loop AS INT, 
			@found AS INT, @reversed AS INT;
    SET @loop = 0;
    SET @posn = -1;
    SET @found = 0;
    SET @reversed = 0;
    IF @count < 0
        BEGIN
            SET @reversed = 1;
            SET @count = @count * -1;
            SET @str = REVERSE(@str);
        END
    WHILE @loop < @count
        BEGIN
            SET @posn = charindex(@delim, @str, @posn + 1);
            IF @posn > 0
                SET @found = 1;
            ELSE
                IF @found = 1 AND @reversed = 0
                    RETURN @str; -- ie mimic mysql behaviour
                ELSE
                    IF @found = 1 AND @reversed = 1
                        RETURN REVERSE(@str); -- ie mimic mysql behaviour
            SET @loop = @loop + 1;
        END
    IF @posn >= 0 AND @reversed = 0
        RETURN SUBSTRING(@str, 0, @posn);
    ELSE
        IF @posn >= 0 AND @reversed = 1
            RETURN REVERSE(SUBSTRING(@str, 0, @posn));
    RETURN '';
END

SELECT dbo.my_substring_index('www.mysql.com', '.', -1)
--------------------------------------------------------
com
(1 row(s) affected)
[/sourcecode]



