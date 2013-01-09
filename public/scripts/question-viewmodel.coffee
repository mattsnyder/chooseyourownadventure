class App.ViewModels.Question
        constructor: (questionData) ->
                @content = questionData.content
                @author = questionData.author
                @votes = ko.observableArray(questionData.votes || [])
                @voteTally = ko.computed =>
                        @votes().reduce @addVoteToTally, 0
                @userVotedUp = ko.computed =>
                        @userVoted 1
                @userVotedDown = ko.computed =>
                        @userVoted -1

        getExistingVote: (voterName) =>
                _(@votes()).find (vote) ->
                        vote.voter == voterName

        userVoted: (voteValue) =>
          userVote = @getExistingVote overflowViewModel.userName()
          userVoted = (userVote and userVote.value == voteValue)
          userVoted

        removeExistingVote: (existingVote) =>
                @votes.remove (vote) ->
                        vote.voter == existingVote.voter

        addVote: (voter,voteType) =>
                voteValue = if voteType == 'up' then 1 else -1
                existingVote = @getExistingVote voter
                 
                if existingVote
                        if existingVote.value != voteValue
                                @removeExistingVote existingVote
                else
                        @votes.push { value: voteValue, voter: voter }

        addVoteToTally: (tally, vote) ->
            tally + vote.value