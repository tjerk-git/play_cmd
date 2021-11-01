import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"

const application = Application.start()

application.warnings    = true
application.debug       = false
window.Stimulus         = application

const context = require.context("controllers", true, /_controller\.js$/)

application.load(definitionsFromContext(context))
