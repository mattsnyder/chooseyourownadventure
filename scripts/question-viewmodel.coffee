class App.ViewModels.Question
        constructor: (questionData) ->
                @content = questionData.content
                @author = questionData.author
                @votes = ko.observableArray(questionData.votes || [])
                @voteTally = ko.computed =>
                        @votes().length

        addVote: (voter, voteType) =>
                voteValue = if voteType == 'up' then 1 else -1
                @votes.push {value: voteValue, voter: voter }