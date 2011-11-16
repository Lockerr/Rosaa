$("#content").html("<%= escape_javascript (render :partial => 'show', :page => params[:page])  %>");
$('.b-post__comments-link').html("<span><%= escape_javascript (link_to 'Назад к идеям', root_path,:class => 'show_comments') %></span>");
make_bindings();
markup();

