get '/auctions/:id' do
    @active_auction = Auction.find(params[:id])
    p @active_auction
    erb :'/auctions/show_active'
end

post '/auctions/:id' do
  bid = Bid.create(auction_id: params[:id], amount: params[:amount])
  erb :'/auctions/show_bidded'
end
