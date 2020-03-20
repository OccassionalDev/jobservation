require './config/environment'

use Rack::MethodOverride
use JobApplicationController
use InterviewController
run ApplicationController