platform :ios, '11.0'

target 'ScopeAgent-Reference' do
  use_frameworks!

  pod 'ScopeAgent' # For adding logs and HTTP Instrumentation
  pod 'Alamofire', '~> 4.7'   # To show integration with Alamofire
  pod 'opentracing'   # To manually add traces to app

  #pod 'ScopeAgentClient' #We could include here if don't want HTTP instrumentation but we want logging integration

  target 'ScopeAgent-ReferenceTests' do
    inherit! :search_paths

    #pod 'ScopeAgent' #We could include here if don't want HTTP instrumentation
  end

end
