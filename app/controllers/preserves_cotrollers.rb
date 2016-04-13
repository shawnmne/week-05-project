###preserves
get '/preserves' do 
  @preserves = Preserve.all
  erb :"preserves/index"
end

#New
get '/preserves/new' do 
  @preserve = Preserve.new
  @preserves = Preserve.all 
  erb :"preserves/new"
end



# Create
post '/preserves' do
  @preserve = Preserve.new(params)

  if @preserve.save
    redirect to('/preserves')
  else
    erb :"preserves/new"
  end
end

# Show
get '/preserves/:id' do
  @preserve = Preserve.find_by_id(params['id']) 
  erb :"preserves/show"
end


#show all gorillas at preserve
  get '/preserves/:id/gorillas' do 
    @preserve = Preserve.find_by_id(params['id']) 
    @gorillas = Gorilla.all
    erb :"preserves/show_gorillas"
  end

#show all wranglers at preserve
  get '/preserves/:id/wranglers' do 
    @preserve = Preserve.find_by_id(params['id']) 
    @wranglers = Wrangler.all
    erb :"preserves/show_wranglers"
  end


# Edit
 
 get '/preserves/:id/edit' do
   @preserve = Preserve.find_by_id(params['id'])
   @preserves = Preserve.all
   erb :"preserves/edit"
 end
 
 patch '/preserves/:id' do
   @preserve = Preserve.find_by_id(params['id'])
   if @preserve.update_attributes(name: params['name'], 
                                location: params['location'])
     redirect to("/preserves/#{@preserve.id}")
   else
     erb :"preserves/edit"
   end
 	end 


  # Delete
  delete "/preserves/:id" do
   @preserve = Preserve.find_by_id(params['id'])
   @new_preserve = Preserve.find_by_id(params['new_preserve_id'])
 
   redirect to("/preserves/#{@preserve.id}/edit") if @new_preserve.nil?
    binding.pry
   @preserve.reassign_all_gorillas_and_wranglers(@new_preserve)
   @preserve.destroy
 
   redirect to('/preserves')
 end