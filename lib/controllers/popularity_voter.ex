defmodule PopularityVoter do

	# better would be to count votes by day, and then compute score by today * 1 + yesterday * 0.99 + the day before * 0.98 etc
	# but for that, I'd probably need to be able to write state to disc every so often ;-)

	def startup do
		state = []
		# read from disc
		
		the_loop(state)
	end
	
	def synchronize(state) do
		# write to disc
	end

	def the_loop(state) do
		
		receive do
			{ :vote, conn } ->
				IO.puts "get path"
				index = Enum.find_index(state, fn(x) -> x.link == conn.path end)
				IO.puts "index found"
				
				if index == nil do
					IO.puts "path " <> conn.path
					IO.puts "method " <> conn.method
					newVote = %VoteCount{ method: conn.method, link: conn.path, votes: 1, title: "" }
					IO.puts "vote created"
					IO.puts "method: " <> conn.method <> ", link: " <> conn.path <> ", votes: 1"
					state = Enum.concat(state, [newVote])
				else
					IO.puts "old vote"
					oldVote = Enum.at(state, index)
					IO.puts "got vote"
					IO.puts "method: " <> conn.method <> ", link: " <> conn.path <> ", votes: ??"
					newVote = %{oldVote | votes: (oldVote.votes + 1) }
					IO.puts "made new vote"
					state = List.replace_at(state, index, newVote)
					IO.puts "Updated list"
				end
				
				IO.puts "now sync"
				#PopularityVoter.synchronize(state)
				IO.puts "then loop"

			{ :top5, sender } ->
				votes = Enum.sort state, &(&1.votes > &2.votes)
				{ votes, _ } = Enum.split(votes, 5)
				send sender, votes
		end

		the_loop(state)
	end
	

end