<%@ Page Title="" Language="C#" MasterPageFile="~/Master_event.Master" AutoEventWireup="true" CodeBehind="fe_event.aspx.cs" Inherits="StaffHao_SQLserver.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

	<script type="text/javascript" src="Scripts/jquery-1.4.4.min.js"></script>
	<script src="Scripts/jquery.easing.1.3.js" type="text/javascript"></script>
	<script src="Scripts/jquery.booklet.1.1.0.min.js" type="text/javascript"></script>

	<link href="Scripts/jquery.booklet.1.1.0.css" type="text/css" rel="stylesheet" media="screen" />
	<link rel="stylesheet" href="CSS/event.css" type="text/css" media="screen"/>

	<script src="Scripts/cufon-yui.js" type="text/javascript"></script>
	<script src="Scripts/ChunkFive_400.font.js" type="text/javascript"></script>
	<script src="Scripts/Note_this_400.font.js" type="text/javascript"></script>
	<script type="text/javascript">
	    Cufon.replace('h1,p,.b-counter');
	    Cufon.replace('.book_wrapper a', { hover: true });
	    Cufon.replace('.title', { textShadow: '1px 1px #C59471', fontFamily: 'ChunkFive' });
	    Cufon.replace('.reference a', { textShadow: '1px 1px #C59471', fontFamily: 'ChunkFive' });
	    Cufon.replace('.loading', { textShadow: '1px 1px #000', fontFamily: 'ChunkFive' });
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="bp_c_right">
        <div class="book_wrapper">
			<a id="next_page_button"></a>
			<a id="prev_page_button"></a>
			<div id="loading" class="loading">Loading pages...</div>
			<div id="mybook" style="display:none;">
				<div class="b-load">
					<div>
						<img src="Pictures/images/1.jpg" alt=""/>
						<h1>Slider Gallery</h1>
						<p>This tutorial is about creating a creative gallery with a
							slider for the thumbnails. The idea is to have an expanding
							thumbnails area which opens once an album is chosen.
							The thumbnails will scroll to the end and move back to
							the first image. The user can scroll through the thumbnails
							by using the slider controls. When a thumbnail is clicked,
							it moves to the center and the full image preview opens.</p>
						<a href="http://tympanus.net/codrops/2010/10/07/slider-gallery/" target="_blank" class="article">Article</a>
						<a href="http://tympanus.net/Tutorials/SliderGallery/" target="_blank" class="demo">Demo</a>
					</div>
					<div>
						<img src="Pictures/images/2.jpg" alt="" />
						<h1>Animated Portfolio Gallery</h1>
						<p>Today we will create an animated portfolio gallery with jQuery.
							The gallery will contain a scroller for thumbnails and a
							content area where we will display details about the portfolio
							item. The image can be enlarged by clicking on it, making
							it appear as an overlay.</p>
						<a href="http://tympanus.net/codrops/2010/11/14/animated-portfolio-gallery/" target="_blank" class="article">Article</a>
						<a href="http://tympanus.net/Tutorials/AnimatedPortfolioGallery/" target="_blank" class="demo">Demo</a>
					</div>
					<div>
						<img src="Pictures/images/3.jpg" alt="" />
						<h1>Annotation Overlay Effect</h1>
						<p>Today we will create a simple overlay effect to display annotations in e.g. portfolio
							items of a web designers portfolio. We got the idea from the wonderful
							portfolio of www.rareview.com where Flash is used to create the
							effect. We will use jQuery.</p>
						<a href="http://tympanus.net/codrops/2010/10/12/annotation-overlay-effect/" target="_blank" class="article">Article</a>
						<a href="http://tympanus.net/Tutorials/AnnotationOverlayEffect/" target="_blank" class="demo">Demo</a>
					</div>					
				</div>
			</div>
		</div>                	      
	</div>


        <!--javascript start-->
        <script type="text/javascript">
            $(function () {
                var $mybook = $('#mybook');
                var $bttn_next = $('#next_page_button');
                var $bttn_prev = $('#prev_page_button');
                var $loading = $('#loading');
                var $mybook_images = $mybook.find('img');
                var cnt_images = $mybook_images.length;
                var loaded = 0;
                //preload all the images in the book,
                //and then call the booklet plugin

                $mybook_images.each(function () {
                    var $img = $(this);
                    var source = $img.attr('src');
                    $('<img/>').load(function () {
                        ++loaded;
                        if (loaded == cnt_images) {
                            $loading.hide();
                            $bttn_next.show();
                            $bttn_prev.show();
                            $mybook.show().booklet({
                                name: null,                            // name of the booklet to display in the document title bar
                                width: 800,                             // container width
                                height: 500,                             // container height
                                speed: 600,                             // speed of the transition between pages
                                direction: 'LTR',                           // direction of the overall content organization, default LTR, left to right, can be RTL for languages which read right to left
                                startingPage: 0,                               // index of the first page to be displayed
                                easing: 'easeInOutQuad',                 // easing method for complete transition
                                easeIn: 'easeInQuad',                    // easing method for first half of transition
                                easeOut: 'easeOutQuad',                   // easing method for second half of transition

                                closed: true,                           // start with the book "closed", will add empty pages to beginning and end of book
                                closedFrontTitle: null,                            // used with "closed", "menu" and "pageSelector", determines title of blank starting page
                                closedFrontChapter: null,                            // used with "closed", "menu" and "chapterSelector", determines chapter name of blank starting page
                                closedBackTitle: null,                            // used with "closed", "menu" and "pageSelector", determines chapter name of blank ending page
                                closedBackChapter: null,                            // used with "closed", "menu" and "chapterSelector", determines chapter name of blank ending page
                                covers: false,                           // used with  "closed", makes first and last pages into covers, without page numbers (if enabled)

                                pagePadding: 10,                              // padding for each page wrapper
                                pageNumbers: true,                            // display page numbers on each page

                                hovers: false,                            // enables preview pageturn hover animation, shows a small preview of previous or next page on hover
                                overlays: false,                            // enables navigation using a page sized overlay, when enabled links inside the content will not be clickable
                                tabs: false,                           // adds tabs along the top of the pages
                                tabWidth: 60,                              // set the width of the tabs
                                tabHeight: 20,                              // set the height of the tabs
                                arrows: false,                           // adds arrows overlayed over the book edges
                                cursor: 'pointer',                       // cursor css setting for side bar areas

                                hash: false,                           // enables navigation using a hash string, ex: #/page/1 for page 1, will affect all booklets with 'hash' enabled
                                keyboard: true,                            // enables navigation with arrow keys (left: previous, right: next)
                                next: $bttn_next,          			// selector for element to use as click trigger for next page
                                prev: $bttn_prev,          			// selector for element to use as click trigger for previous page

                                menu: null,                            // selector for element to use as the menu area, required for 'pageSelector'
                                pageSelector: false,                           // enables navigation with a dropdown menu of pages, requires 'menu'
                                chapterSelector: false,                           // enables navigation with a dropdown menu of chapters, determined by the "rel" attribute, requires 'menu'

                                shadows: true,                            // display shadows on page animations
                                shadowTopFwdWidth: 166,                             // shadow width for top forward anim
                                shadowTopBackWidth: 166,                             // shadow width for top back anim
                                shadowBtmWidth: 50,                              // shadow width for bottom shadow

                                before: function () { },                    // callback invoked before each page turn animation
                                after: function () { }                     // callback invoked after each page turn animation
                            });
                            Cufon.refresh();
                        }
                    }).attr('src', source);
                });

            });
        </script>
        <!--javascript end-->
</asp:Content>
