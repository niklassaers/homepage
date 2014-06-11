---
title: My reusable Calabash steps
author: niklas
layout: post
permalink: /archives/2012/03/24/my-reusable-calabash-steps/
categories:
  - Calabash
---
As promised, here are my reusable Calabash steps. Now, some of these are probably more inspirational than reusable (or ignorable, if you like <img src='http://blog.saers.com/wp-includes/images/smilies/icon_wink.gif' alt=';-)' class='wp-smiley' /> ), but this is ALL the steps I use SO FAR apart from the standard steps. Like I said before, there are so many great steps already defined, so check them out. Anyway, here they are, all 134 lines:

`Given /^I press the "([^\"]*)" tableviewcell button$/ do |cell|<br />
  touch("tableViewCell button marked:'" + cell + "'")<br />
end</p>
<p>Given /^I press the "([^"]*)" label$/ do |label|<br />
  touch("view label text:'#{label}'")<br />
end</p>
<p>Then /^I enter "([^\"]*)" in the "([^\"]*)" (?:text|input) field$/ do |text_to_type, field_name|<br />
  set_text("textField placeholder:'#{field_name}'", text_to_type)<br />
  sleep(STEP_PAUSE)<br />
end</p>
<p>Given /^I press the "([^"]*)" segment$/ do |label|<br />
	touch("segmentedControl segment marked:'#{label}'")<br />
end</p>
<p>Given /^I see the text "([^"]*)" to the right of the text "([^"]*)"$/ do |right, left|<br />
  leftRect = query("label {text LIKE '#{left}*'} parent view:'PdfThumbnailView'", :frame)[0]<br />
  screenshot_and_raise "Text \"#{left}\" could not be found" if(leftRect == nil)<br />
  leftX = Integer(leftRect[/{(.*), (.*)}, {(.*), (.*)}/,1].split("{")[1])<br />
  leftY = Integer(leftRect[/{(.*), (.*)}, {(.*), (.*)}/,2])</p>
<p>  rightRect = query("label {text LIKE '#{right}*'} parent view:'PdfThumbnailView'", :frame)[0]<br />
  screenshot_and_raise "Text \"#{right}\" could not be found" if(rightRect == nil)<br />
  rightX = Integer(rightRect[/{(.*), (.*)}, {(.*), (.*)}/,1].split("{")[1])<br />
  rightY = Integer(rightRect[/{(.*), (.*)}, {(.*), (.*)}/,2])</p>
<p>  screenshot_and_raise "The following texts should be on the same horizontal line: \"#{left}\" \"#{right}\"" if(leftY != rightY)<br />
  screenshot_and_raise "The text \"#{right}\" is not to the right of the text \"#{left}\"" if(leftX >= rightX)<br />
end</p>
<p>Given /^I see the text "([^"]*)" beneath the text "([^"]*)"$/ do |bottom, top|<br />
  bottomRect = query("label {text LIKE '#{bottom}*'} parent view:'PdfThumbnailView'", :frame)[0]<br />
  screenshot_and_raise "Text \"#{bottom}\" could not be found" if(bottomRect == nil)<br />
  bottomX = Integer(bottomRect[/{(.*), (.*)}, {(.*), (.*)}/,1].split("{")[1])<br />
  bottomY = Integer(bottomRect[/{(.*), (.*)}, {(.*), (.*)}/,2])</p>
<p>  topRect = query("label {text LIKE '#{top}*'} parent view:'PdfThumbnailView'", :frame)[0]<br />
  screenshot_and_raise "Text \"#{top}\" could not be found" if(topRect == nil)<br />
  topX = Integer(topRect[/{(.*), (.*)}, {(.*), (.*)}/,1].split("{")[1])<br />
  topY = Integer(topRect[/{(.*), (.*)}, {(.*), (.*)}/,2])</p>
<p>  screenshot_and_raise "The following texts should be on the same vertical line: \"#{top}\" \"#{bottom}\"" if(topX != bottomX)<br />
  screenshot_and_raise "The text \"#{bottom}\" is not beneath the text \"#{top}\"" if(topY >= bottomY)<br />
end</p>
<p>Given /^I don't see the "([^"]*)" button$/ do |expected_mark|<br />
  res = query "button", :accessibilityLabel<br />
  index = res.find_index {|s| s == expected_mark}<br />
  screenshot_and_raise "Index should be nil (was: #{index})" if (index != nil)<br />
end</p>
<p>Given /^I scroll to "([^"]*)"$/ do |searchText|<br />
  res = query "TableView index:1 TableViewCell label", :text<br />
  row = res.find_index {|s| s == searchText}<br />
  scroll_to_row :tableView, row<br />
  sleep(STEP_PAUSE)<br />
end</p>
<p>Given /^given I import "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/ do |datasource, maindir, subdir, file|<br />
  touch("tableViewCell label text:'All files'")<br />
  sleep(STEP_PAUSE)<br />
  touch("tableViewCell label text:'#{datasource}'")<br />
  macro %Q|I wait until I don't see "Loading..."|<br />
  touch("tableViewCell label text:'#{maindir}'")<br />
  macro %Q|I wait until I don't see "Loading..."|<br />
  touch("tableViewCell label text:'#{subdir}'")<br />
  macro %Q|I wait until I don't see "Loading..."|<br />
  touch("tableViewCell label text:'#{file}'")<br />
  sleep(STEP_PAUSE)<br />
  touch("tableViewCell label text:'All files'")<br />
  sleep(STEP_PAUSE)<br />
end</p>
<p>Given /^given I import "([^"]*)", "([^"]*)", "([^"]*)"$/ do |datasource, maindir, file|<br />
  touch("tableViewCell label text:'All files'")<br />
  sleep(STEP_PAUSE)<br />
  touch("tableViewCell label text:'#{datasource}'")<br />
  macro %Q|I wait until I don't see "Loading..."|<br />
  touch("tableViewCell label text:'#{maindir}'")<br />
  macro %Q|I wait until I don't see "Loading..."|<br />
  touch("tableViewCell label text:'#{file}'")<br />
  sleep(STEP_PAUSE)<br />
  touch("tableViewCell label text:'All files'")<br />
  sleep(STEP_PAUSE)<br />
end</p>
<p>Given /^I remove all my documents$/ do<br />
  docs = query("view:'PdfThumbnailView'")<br />
  docs.each do |pdfView|<br />
    touch("button marked:'EditCards'")<br />
  sleep(STEP_PAUSE)<br />
    touch("view:'PdfThumbnailView' index:0 button marked:'card function delete'")<br />
  sleep(STEP_PAUSE)<br />
    touch("button marked:'Delete file'")<br />
  sleep(STEP_PAUSE)<br />
    touch("button marked:'EditCards'")<br />
  sleep(STEP_PAUSE)<br />
  end<br />
end</p>
<p>Given /^I remove all my folders$/ do<br />
  if(query("label marked:'My folders'").count > 0)<br />
      titleRect = query("label marked:'My folders' parent view", :frame)[0]<br />
      titleX = Integer(titleRect[/{(.*), (.*)}, {(.*), (.*)}/,1].split("{")[1])<br />
      titleY = Integer(titleRect[/{(.*), (.*)}, {(.*), (.*)}/,2])</p>
<p>      count = query("tableViewCell").count<br />
      i = 0<br />
      while i < count do<br />
        cellRect = query("view:'FolderTableViewCell' index:#{i} view", :frame)[0]<br />
        cellX = Integer(cellRect[/{(.*), (.*)}, {(.*), (.*)}/,1].split("{")[1])<br />
        cellY = Integer(cellRect[/{(.*), (.*)}, {(.*), (.*)}/,2])<br />
        if(cellX == titleX &#038;&#038; cellY > titleY)<br />
           touch("view:'FolderTableViewCell' index:#{i} view")<br />
           sleep(STEP_PAUSE)<br />
           touch("view:'FolderTableViewCell' index:#{i} button")<br />
           sleep(STEP_PAUSE)<br />
           touch("segmentedControl segment marked:'Delete folder'")<br />
           sleep(STEP_PAUSE)</p>
<p>		   break<br />
        end<br />
        i = i + 1<br />
      end<br />
  end</p>
<p>  macro %Q|I remove all my folders| if(query("label marked:'My folders'").count > 0)<br />
end</p>
<p>Given /^I playback recording "([^"]*)" at label "([^"]*)"$/ do |movie, label|<br />
  playback movie, {:query => "label text:'#{label}'"}<br />
end`