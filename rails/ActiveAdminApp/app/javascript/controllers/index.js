// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"

// Import and register all controllers
import SchoolClassController from "./school_class_controller"
application.register("school-class", SchoolClassController)

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)
