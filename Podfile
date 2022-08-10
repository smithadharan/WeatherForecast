# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'WeatherForecast' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for WeatherForecast
     pod 'MBProgressHUD', '~> 1.2.0’
  pod 'RxSwift', '~> 5.1.2'
  pod 'Alamofire', '~> 5.2'

  target 'WeatherForecastTests' do
    inherit! :search_paths
  
  end

  target 'WeatherForecastUITests' do
    # Pods for testing
  end


end

post_install do |installer|
 # add these lines:
 installer.pods_project.build_configurations.each do |config|
  config.build_settings["EXCLUDED_ARCHS[sdk=*]"] = "armv7"
  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = $iOSVersion
 end
  
 installer.pods_project.targets.each do |target|
   
  # add these lines:
  target.build_configurations.each do |config|
   if Gem::Version.new($iOSVersion) > Gem::Version.new(config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'])
    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = $iOSVersion
   end
  end
   
 end
end