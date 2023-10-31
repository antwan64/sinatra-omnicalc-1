require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 0.5

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
  rate = (params.fetch("user_apr").to_f)/100
  apr = params.fetch("user_apr").to_f

  @apr = '%.4f%%' % apr

  @user_years = params.fetch("user_years").to_i
  user_pv = params.fetch("user_pv").to_f
  @user_pv = user_pv.to_fs(:currency)
  n = (@user_years * 12).to_f
  r = rate/12
  numer = r * user_pv
  denom = 1 - ((1+r) ** -n) 

  m_payment = numer / denom

  @payment = m_payment.to_fs(:currency)


  erb(:payment_results)

end
