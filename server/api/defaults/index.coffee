defaults =
    index: (req, res) ->
        res.render "index"

    partials: (req, res) ->
        res.render("partials/" + req.params.name)

    subPartials: (req, res) ->
        res.render("partials/" + req.params.directory + "/" + req.params.name)

module.exports = defaults

