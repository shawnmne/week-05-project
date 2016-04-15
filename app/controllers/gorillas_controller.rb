###gorillas
get '/gorillas' do 
  @gorillas = Gorilla.all
  erb :"gorillas/index"
end

#New
get '/gorillas/new' do 
  @gorilla = Gorilla.new
  @preserves = Preserve.all 
  erb :"gorillas/new"
end



# Create
post '/gorillas' do
  @gorilla = Gorilla.new(params)

  if @gorilla.save
    redirect to('/gorillas')
  else
    erb :"gorillas/new"
  end
end

# Show
get '/gorillas/:id' do
  @gorilla = Gorilla.find_by_id(params['id'])
  erb :"gorillas/show"
end


# Edit
 
 get '/gorillas/:id/edit' do
   @gorilla = Gorilla.find_by_id(params['id'])
   @preserves = Preserve.all
   erb :"gorillas/edit"
 end
 
 patch '/gorillas/:id' do
   @gorilla = Gorilla.find_by_id(params['id'])
   @preserve = Preserve.find_by_id(params['preserve_id'])
   @gorilla.anger_level = @gorilla.anger_level + 1
   if @gorilla.update_attributes(name: params['name'], 
                                age: params['age'],
                                anger_level: @gorilla.anger_level,
                                preserve: @preserve)
     redirect to("/gorillas/#{@gorilla.id}")
   else
     erb :"gorillas/edit"
   end
 	end 

  # Delete
  delete "/gorillas/:id" do
   @gorilla = Gorilla.find_by_id(params['id'])
   @gorilla.destroy
 
   redirect to('/gorillas')
  end

get '/gorillas/:id/wranglers' do
   @gorilla = Gorilla.find_by_id(params['id'])
   @wranglers = Wrangler.all
  erb :"gorillas/wranglers"
end
 
 # Assigning a wrangler
 post '/gorillas/:id/wranglers/assign' do
   @gorilla = Gorilla.find_by_id(params['id'])
   @wrangler = Wrangler.find_by_id(params['wrangler_id'])
   @gorilla.anger_level = @gorilla.anger_level - 1
   @gorilla.update_attributes(anger_level: @gorilla.anger_level)
 
  @gorilla.wranglers << @wrangler
   redirect to("/gorillas/#{@gorilla.id}/wranglers")
 end
 
 # Removing a wrangler
 post '/gorillas/:id/wranglers/remove' do
   @gorilla = Gorilla.find_by_id(params['id'])
   @wrangler = Wrangler.find_by_id(params['wrangler_id'])
 
   @gorilla.wranglers.delete(@wrangler)
   redirect to("/gorillas/#{@gorilla.id}/wranglers")
 end