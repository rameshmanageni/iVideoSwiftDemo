# Uncomment this line to define a global platform for your project
platform :ios, '9.0'

# Comment this line if you're not using Swift and don't want to use dynamic frameworks
use_frameworks!

target 'iVideoSwiftDemo' do
    pod 'Alamofire', '~> 4.0'
    pod 'MBProgressHUD', '~> 1.0.0'
    pod 'SwiftyJSON'
    pod 'Kingfisher', '~> 3.0'
end

  target 'iVideoSwiftDemoTests' do
    inherit! :search_paths
	pod 'Alamofire', '~> 4.0'
	pod 'MBProgressHUD', '~> 1.0.0'
	pod 'SwiftyJSON'
    pod 'Kingfisher', '~> 3.0'
end

  target 'iVideoSwiftDemoUITests' do
    inherit! :search_paths
    # Pods for testing
  end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end

