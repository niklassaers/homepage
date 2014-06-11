---
title: Alertview steps
author: niklas
layout: post
permalink: /archives/2012/04/28/alertview-steps/
categories:
  - Calabash
  - iOS
---
Today I needed to work with an alertview, so here are two steps for pressing them:

`Given /^I press alert button (\d+)$/ do |index|<br />
  touch("view:'UIAlertButton'")[index]<br />
end</p>
<p>Given /^I press alert button named "([^"]*)"$/ do |text|<br />
  touch("view:'UIAlertButton' label text:'#{text}'")<br />
end<br />
`