$(document).ready(function() {
	$(".js-post").mouseenter(function() {
		$this = $(this);
		if (!$this.hasClass("b-post_state_active")) {
			$this.addClass("b-post_state_hover");
			$this.next().next().addClass("b-post_state_hovernext");
		}
	});
	$(".js-post").mouseleave(function() {
		$this = $(this);
		$this.removeClass("b-post_state_hover");
		$this.next().next().removeClass("b-post_state_hovernext");
	});
	$(".js-post-header__link").click(function() {
		$post = $(this).parent().parent().parent();
		toggleComments($post);
	});
	$(".js-comment__hidecomment").click(function() {
		$post = $(this).parent().parent().parent().prev();
		$post.next().next().addClass("b-post_state_hovernext");
		toggleComments($post);
	});
	$(".js-post__comment-link").click(function() {
		$post = $(this).parent().parent().parent().parent();
		toggleComments($post);
	});
	
	function toggleComments($post) {
		$post.next().next().toggleClass("b-post_state_hovernext");
		$post.toggleClass("b-post_state_active").find(".b-post__author").slideToggle(200);
		$post.find(".b-post__comment-link").toggleClass("displayNone");
		$post.find(".b-bigblockcorner-container").slideToggle(50);
		$post.next().slideToggle(200);
	}
	
	$(".js-registration-button, .js-regform__close").click(function() {
		$(".js-regform").slideToggle(200);
	});
	$(".js-newpost-button, .js-newpost__close").click(function() {
		$(".js-newpost-form").slideToggle(200);
	});

    $(".b-")
});