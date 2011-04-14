Localization.controllers :localize do
    get :index, :map => "/" do
      render "localize/index"
    end

    get :lang, :map => "/lang/:lang" do
      I18n.locale = params[:lang]
      redirect "/"
    end
end
