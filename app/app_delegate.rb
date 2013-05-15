class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @navigationController = UINavigationController.alloc.init
    @welcomeController = WelcomeController.alloc.init
    @navigationController.pushViewController(@welcomeController, animated:false)
    @window.rootViewController = @navigationController
    @window.makeKeyAndVisible

    return true
  end

end
