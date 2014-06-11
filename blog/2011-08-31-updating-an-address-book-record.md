---
title: Updating an Address Book record
author: niklas
layout: post
permalink: /archives/2011/08/31/updating-an-address-book-record/
categories:
  - iOS
---
When updating an Address Book record in Cocoa, I read that I had modify the record using ABRecordSetValue(). But it wouldn&#8217;t change. Even if I called ABAddressBookSave() afterwards, it just wouldn&#8217;t change. It turns out I had to call ABAddressBookAddRecord() also. There is no ABAddressBookUpdateRecord(), but it turns out that the ABAddressBookAddRecord function does the same. I expected that it would give me a duplicate record, but it does not, it updates the existing record. Glad to have that sorted out, I hope this helps you as well.