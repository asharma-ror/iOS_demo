class ListController < UITableViewController
  include MotionTable::PlainTable

  def init
    super
    self.title = "Settings"
    url = "http://vast-lowlands-3861.herokuapp.com/articles.json"
    data = get_data(url)
    json = json_data(data)        
    @plain_table_view_data = []
    json['result'].each do |data|
      @plain_table_view_data << { title: data['name'],
        cells: [
          { title: data['content'], action: :destroy_data},
        ] 
      }
    end
    @table = self.createTableViewFromData(@plain_table_view_data)
    @table.frame = [[10, 65], [self.view.frame.size.width, (self.view.frame.size.height) - 70 ]]
   @table
  end
  def destroy_data
    # You can pass any data structure into :arguments, it is just passed as an argument to your implementation
    # You have to handle it. Like so:
    @alert_box = UIAlertView.alloc.initWithTitle("Delete Post",
        message:"Are you sure you want to delete post?",
        delegate: nil,
        cancelButtonTitle: "Cancel",
        otherButtonTitles:nil)
    @alert_box.addButtonWithTitle("Ok")
    # Show it to the user

    @alert_box.show    


  end
  def get_data(url)
    error_ptr = Pointer.new(:object)
    data = NSData.alloc.initWithContentsOfURL(NSURL.URLWithString(url), options:NSDataReadingUncached, error:error_ptr) || []
    unless data
      raise error_ptr[0]
    end
    data
  end

  def json_data(data)
    error_ptr = Pointer.new(:object)
    json = NSJSONSerialization.JSONObjectWithData(data, options:0, error:error_ptr)
    unless json
      raise error_ptr[0]
    end
    json
  end

end