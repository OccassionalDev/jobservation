require './config/environment'

use Rack::MethodOverride
use InterviewController
run ApplicationController