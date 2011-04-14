# Localization example with Padrino+I18N

app/views/demo/index.haml
  %h1 Hey!
  =t :hello, {:name => "Dario", :surname => "Cravero"}
  =t "setup.something"
  =(t "setup.ssomething")[0]
  =t :something, :scope => [:setup]

If you have activerecord support (not here) you can also translate dates! :)

  =l Time.now

app/locale/en.yml
  en:
    hello: "Hello, %{name} %{surname} you've won something."

app/locale/setup/en.yml
  en:
    setup:
      something: SSSS
      ssomething: [A, B]

app/controllers/localize.rb

    Localization.controllers :localize do
      get :index, :map => "/" do
        render "localize/index"
      end

      get :lang, :map => "/lang/:lang" do
        I18n.locale = params[:lang]
        redirect "/"
      end
    end
