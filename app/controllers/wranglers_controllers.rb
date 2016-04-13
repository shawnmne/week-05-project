###wranglers
get '/wranglers' do 
  @wranglers = Wrangler.all
  erb :"wranglers/index"
end

#New
get '/wranglers/new' do 
  @wrangler = Wrangler.new
  @preserves = Preserve.all 
  erb :"wranglers/new"
end



# Create
post '/wranglers' do
  @wrangler = Wrangler.new(params)

  if @wrangler.save
    redirect to('/wranglers')
  else
    erb :"wranglers/new"
  end
end

# Show
get '/wranglers/:id' do
  @wrangler = Wrangler.find_by_id(params['id']) 
  erb :"wranglers/show"
end


# Edit
 
 get '/wranglers/:id/edit' do
   @wrangler = Wrangler.find_by_id(params['id'])
   @preserves = Preserve.all
   erb :"wranglers/edit"
 end
 
 patch '/wranglers/:id' do
   @wrangler = Wrangler.find_by_id(params['id'])
   @preserve = Preserve.find_by_id(params['preserve_id'])
   if @wrangler.update_attributes(name: params['name'], 
                                age: params['age'],
                                preserve: @preserve)
     redirect to("/wranglers/#{@wrangler.id}")
   else
     erb :"wranglers/edit"
   end
 	end 

  # Delete
  delete "/wranglers/:id" do
   @wrangler = Wrangler.find_by_id(params['id'])
   @wrangler.destroy
 
   redirect to('/wranglers')
  end