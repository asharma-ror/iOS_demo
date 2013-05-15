# file app/controllers/PostController.rb
class PostController < Formotion::FormController
  API_LOGIN_ENDPOINT = "http://vast-lowlands-3861.herokuapp.com/articles.json"

  def init
    form = Formotion::Form.new({
      sections: [{
        rows: [{
          key: :name,
          placeholder: "title",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
        
          key: :content,
          placeholder: "content",
          type: :string
   
        }],
      }, {
        rows: [{
          title: "Add",
          type: :submit,
        }]
      }]
    })
    form.on_submit do
      self.add
    end
    super.initWithForm(form)
  end

  def viewDidLoad
    super

    self.title = "Add Post"
  end

  def add
    headers = { 'Content-Type' => 'application/json' }
    data = BW::JSON.generate({ article: {
                                 name: form.render[:name],
                                 content: form.render[:content]
                                } })

    #SVProgressHUD.showWithStatus("Adding…", maskType:SVProgressHUDMaskTypeGradient)
    BW::HTTP.post(API_LOGIN_ENDPOINT, { headers: headers, payload: data } ) do |response|
      @welcomeController = WelcomeController.alloc.init
      self.navigationController.dismissModalViewControllerAnimated(true)
      self.navigationController.pushViewController(@welcomeController, animated:false)
    end
  end
end