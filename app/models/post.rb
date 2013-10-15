class Post < ActiveRecord::Base
  belongs_to :phase
  belongs_to :project
  belongs_to :user
  default_scope order('created_at DESC')
  before_save :set_defaults
  
mount_uploader :attachment, ImageUploader
  private

    def set_defaults
      if self.title == "" then self.title = "Post #{rand(255)}" end
      if self.message == "" then self.message = "(no message)" end
      self.user_id = User.first.id + rand(0..1)
      # @attachment ||= "https://s3.amazonaws.com/mks_learn_app/mks-startupcrawl-card-front.png"
    end

end
