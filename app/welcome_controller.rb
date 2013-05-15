class WelcomeController < UIViewController

  def self.controller
    @controller ||= WelcomeController.alloc.initWithNibName(nil, bundle:nil)
  end

  def viewDidLoad
    super
    self.title = "Articles"
    self.title = "Article"
    self.view.backgroundColor = UIColor.whiteColor
    @postButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @postButton.frame = [[0, 50], [self.view.frame.size.width, 100]]
    @postButton.setTitle("Add Post", forState:UIControlStateNormal)
    @postButton.setTitle("Loading", forState:UIControlStateDisabled)
    @postButton.sizeToFit
    @postButton.center = CGPointMake(self.view.frame.size.width / 2, 30)
    @postButton.addTarget(self, action:'post', forControlEvents:UIControlEventTouchUpInside)
    self.view.addSubview @postButton
    self.view.addSubview ListController.alloc.init
  end

  def post
    @postController = PostController.alloc.init
    self.navigationController.pushViewController(@postController, animated:true)
  end
  def refresh
  end
end