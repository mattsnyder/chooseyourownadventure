$ ->
        App.socket = io.connect()
        window.overflowViewModel = new App.ViewModels.Overflow()
        ko.applyBindings overflowViewModel
