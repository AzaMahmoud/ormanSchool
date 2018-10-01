# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ormanSchools' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ormanSchools
pod 'Alamofire'
pod 'SwiftyJSON'
pod 'TextFieldEffects'
pod 'IQKeyboardManager'
pod 'SideMenu'
pod 'NVActivityIndicatorView'
pod 'RevealingSplashView'
pod 'Firebase/Core'
pod 'Firebase/Messaging'
pod 'Popover'


post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end

end
end
