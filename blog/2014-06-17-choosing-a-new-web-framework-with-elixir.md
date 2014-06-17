---
title: Choosing a new web framework with Elixir
author: niklas
layout: post
permalink: /archives/2014/06/17/choosing-a-new-web-framework-with-elixir/
categories:
  Discussion
tags:
  Letter
---
My first "real" Elixir project was to build my own homepage with my blog and portfolio. I wrote it using [Dynamo][1]. Not the best of choices, since [it now recommends I look other places][0]. The options I've found so far are:


| Project   | Commits | Last                           | Watchers | Stars | Forks | Contributors | Elixir version |
|-----------|---------|--------------------------------|----------|-------|-------|--------------|----------------|
| Charlotte | 71      | Sun Mar 2 07:51:01 2014 -0700  | 4        | 5     | 0     | 1            | pre 0.13       |
| Phoenix   | 328     | Mon Jun 16 19:20:17 2014 -0400 | 46       | 274   | 37    | 23           | 0.14           |
| Plug      | 157     | Mon Jun 16 11:50:37 2014 +0200 | 27       | 98    | 25    | 14           | 0.14           |
| Sugar     | 161     | Wed May 28 23:53:53 2014 -0400 | 10       | 75    | 4     | 2            | pre 0.13       |
| Weber     | 603     | Fri Jun 13 08:11:04 2014 -0400 | 36       | 263   | 41    | 24           | 0.14           |

The four of them depend on Plug, and thus on Cowboy. When I started my work, 0.13 had just come out. A week ago, 0.14 was released, so it's great Plug, Phoenix and Weber are all updated already. At least as long as all of your other dependencies are at least up to 0.13, anyway, if not they'll probably be broken now.

So, since I'm getting Plug anyway, do I want it the Phoenix way or Weber way? By reading their README.md, I don't really have a preference. They seem to be very similar. Both have one main maintainer, two "leutnants" and many with a commit or two. Both have one-digit open issues and 3-digit closed issues.

When it came down to "mix test", Phoenix had significantly more tests, and they gave no warnings, where I had 25 warnings when running Webers tests. So with lots of probably insignificant data points, this was the one that tipped the scale to let me try out Phoenix first.

However, my run with Phoenix was short. I had expected to be able to reuse my .eex template files from my Dynamo project, but there was just no documentation or examples to support this. Not even an itty-bitty template file in the generated scaffold. I could see from the dependencies that there is support, but it looked like I would have to do quite a bit of work on that on my own.

So I tried out Weber. Generate the scaffold and launch. Fine, there's HTML on launch and it seems to be taken from a view file. The HTML includes a link to the Weber site, which is 404. Now that is reassuring...



[0]: https://github.com/dynamo/dynamo/commit/3c28f27603a480d2755a89aba3a91e88df3469ce#diff-04c6e90faac2675aa89e2176d2eec7d8L8 "Dynamo Github link saying it's on maintenance only mode"

[1]: https://github.com/dynamo/dynamo