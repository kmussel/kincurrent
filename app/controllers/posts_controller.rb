
module Kincurrent 
		class PostsController < BaseController

			namespace %r{/streams\/(.*)\/posts} do 
        # namespace '/posts' do

          get '/?' do 
            puts "INSIDE THIS GET #{params}"
            
            stream_id = params["captures"][0]
            results = StreamEventRepository.get_stream_events(stream_id, {startrid: params[:startrid]})
            roar results
          end
        
  				get '/:streamID/?' do
  				  puts "THE stream ID = #{params[:streamID]}"
  					stream = Stream.get!(kin_id: params[:streamID])
  					if stream
  						stream.props.to_json
  					else
  						status 404
  						json ({error: "Stream with id: #{params[:streamID]} not found"})
  					end
  				end #/get /:userid

          # post '/?' do
          #   streamname  = params[:name]
          # 
          #   stream = Stream.get_or_create(:name => streamname)
          #   if stream.save!
          #     stream.to_json :exclude => [:email, :password, :password_digest, :password_salt]
          #   else
          #     status 400
          #     json stream.errors.to_hash
          #   end
          # end #/post /
          # 
          # post '/:streamID/subscribe/?' do 
          #   error 500 unless current_user
          # 
          #             stream = Stream.get!(kin_id: params[:streamID])
          #             status 404 and return unless stream
          # 
          #   if (Publisher.bind_queue("user.#{current_user.global_id}", stream.global_id))
          #               json({status:"success"})
          #   else
          #     status 400
          #     json {message:"Could Not Subscribe you at this time"}
          #   end
          # end #/put apikey

        # end #/namespace '/posts'
  		end

	end
end