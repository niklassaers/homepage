---
title: Named Calculation expressions
author: niklas
layout: post
permalink: /archives/2008/02/01/named-calculation-expressions/
categories:
  - Technology
  - Work
---
Just a quick note on Name Calculations in SSAS, they need to be written in whatever SQL dialect the underlying DB engine (probably MS-SQL) understands. I wanted to make a Sales Margin calculation, and to avoid a Divide by Zero where sale price was zero, my code for this was:  
`<br />
CASE<br />
WHEN Sale<>0 THEN (Sale-Cost)/Sale<br />
ELSE 0<br />
END<br />
`  
Never before have I needed four lines to do a simple IF. <img src='http://blog.saers.com/wp-includes/images/smilies/icon_wink.gif' alt=';-)' class='wp-smiley' />