= Localization example with Padrino+I18N

app/views/demo/index.haml
%h1 Hey!
=t :hello, {:name => "Dario", :surname => "Cravero"}
=t "setup.something"
=(t "setup.ssomething")[0]
=t :something, :scope => [:setup]
=l Time.now

app/locale/en.yml
en:
  hello: "Hello, %{name} %{surname} you've won something."

app/locale/setup/en.yml
en:
  setup:
    something: SSSS
    ssomething: [A, B]

app/controllers/demo.rb
Test.controllers :demo do
  get :index do
    @category = "one"
    render "demo/index"
  end

  get :lang, :with => :l do
    I18n.locale = params[:l]
    redirect "/demo"
  end
end
