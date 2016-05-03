class HomeController < ApplicationController
  def index
    
    @posts = Post.all

  end

  def write
#    post = Post.new
#    post.title = params[:title]
#    post.content = params[:content]    
#    post.save

#   Post.create(title: params[:title], content: params[:content])

    @number = params[:content]
    
    @long = @number.size
    @hio = @number.split.size

    post = Post.new(title: params[:title], content: params[:content], post_long: @long, post_hio: @hio)
    
    if post.save
      redirect_to "/home/index"
    else
      render :text => post.errors.messages[:title].first
    end
    
  end

  def reply_write

    reply = Reply.new
    reply.content = params[:comment]
    reply.post_id = params[:id_of_post]
    reply.save
    
    redirect_to "/home/index"
    
  end
  
  def reply_destroy
    @n_reply= Reply.find(params[:id])
    @n.destroy
    redirect_to '/home/index'
      
  end

  def destroy
    @n_post = Post.find(params[:id])
    @n_post.destroy
    redirect_to '/home/index'

  end
  
  def update_view
    @n_post = Post.find(params[:id])
  end
  
  def update_act
    @n_post = Post.find(params[:id])
    @n_post.title = params[:head]
    @n_post.content = params[:body]
    @n_post.save
    
    redirect_to '/home/index'
  end    
  
  def reply_update_view
    @n_reply = Reply.find(params[:id])
  end
  
  def reply_update_act
    @n_reply = Reply.find(params[:id])
    @n_reply.content = params[:body]
    @n_reply.save
    
    redirect_to '/home/index'
  end  
  

end
