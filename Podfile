platform :ios, '12.4'
use_frameworks!

target 'ManufactureApp' do

pod 'FanMenu'
pod 'BATabBarController'
pod 'RAMAnimatedTabBarController'
pod 'Firebase'
pod 'Firebase/Auth'
pod 'Firebase/Database'
pod 'SVProgressHUD'
pod 'ChameleonFramework'
 
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '5'
        end
    end
end
