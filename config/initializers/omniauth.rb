Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '814629565728-vufnipordi2bjaujd0c2ht89olc2ki3v.apps.googleusercontent.com', '9dPeWPz8dg_Rc5BLxbZir7wJ',
    {
      :name => "google",
      # :scope => "email, profile, plus.me, http://gdata.youtube.com",
      :prompt => "select_account",
      :image_aspect_ratio => "square",
      :image_size => 50
    }
end
