---
author: sonia
comments: true
date: 2014-01-07
url: /2014/01/07/split-function-for-microsoft-mssql/
title: Split() function for Microsoft MSSQL
categories:
- Other-Tech
tags:
- MSSQL
---

Microsoft MSSQL doesn't have a split() function (like in [Ruby](http://ruby-doc.org/core-1.9.3/String.html#method-i-split), [Perl](http://perldoc.perl.org/functions/split.html)), so here's one I wrote.

<!--more-->

It's different from the other MSSQL split() functions out there on the intertubes in that it accepts a @pos parameter that specifies which split item to return - easier than trying to tangle with tables inside a calling function when you want the n'th split item.

[sourcecode lang="sql"]
CREATE FUNCTION [dbo].[split]
(
    @string varchar(MAX),
    @delimiter CHAR(1),
    @pos INT 
)
RETURNS varchar(255)
AS
BEGIN
    DECLARE @start INT, @end INT, @count INT 
    SELECT @start = 1, @end = CHARINDEX(@delimiter, @string), @count = 1 
    WHILE @start < LEN(@string) + 1 BEGIN
        IF @end = 0 
            SET @end = LEN(@string) + 1 

        IF @count = @pos
            RETURN SUBSTRING(@string, @start, @end - @start)

        SET @start = @end + 1 
        SET @end = CHARINDEX(@delimiter, @string, @start)
        SET @count = @count + 1 

    END 
    RETURN '' -- not found
END

select dbo.split('aa,bb,cc', ',', 0)
select dbo.split('aa,bb,cc', ',', 1)
select dbo.split('aa,bb,cc', ',', 2)
select dbo.split('aa,bb,cc', ',', 3)
select dbo.split('aa,bb,cc', ',', 4)

--------------

                   # 0: zero length string
(1 row(s) affected)
--------------
aa                 # 1
(1 row(s) affected)
--------------
bb                 # 2
(1 row(s) affected)
--------------
cc                 # 3
(1 row(s) affected)
--------------
                   # 4: zero length string
(1 row(s) affected)
[/sourcecode]

