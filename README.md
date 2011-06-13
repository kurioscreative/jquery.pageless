PageLess - endless page (with Rails 3.0 Example)
=======================

Description
-----------

Pageless is a jQuery plugin.
As you scroll down you see more results coming back at you automatically.
It provides an automatic pagination in an accessible way : if javascript is disabled your standard pagination is supposed to work.

Parameters
----------

* `currentPage`: current page (params[:page])
* `distance`: distance to the end of page in px when ajax query is fired
* `loader`: selector of the loader div (ajax activity indicator)
* `loaderHtml`: html code of the div if loader not used
* `loaderImage`: image inside the loader
* `loaderMsg`: displayed ajax message
* `pagination`: selector of the paginator divs. (if javascript is disabled paginator is required)
* `params`: paramaters for the ajax query, you can pass auth_token here
* `totalPages`: total number of pages
* `url`: URL used to request more data
* `scrape`: A function to modify the incoming data. (Doesn't do anything by default)
* `complete`: A function to call when a new page has been loaded (optional)
* `end`: A function to call when the last page has been loaded (optional)

Requirements
------------

* [jQuery](http://download.jquery.com)

Demo
----

In the `example` directory you'll find a Rails app that just runs. It demonstrates the basic usage of pageless scrolling.

    $ rails server
    
Then just navigate to http://localhost:3000 and enjoy!

Installation
------------
1. Copy 'jquery.pageless.min.js' into your /public/javascripts directory.
2. Make sure that you are have jquery included:
    = javascript_include_tag 'https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js' 
3. Include the pageless javascript in the head of your application layout.
    = javascript_include_tag 'jquery.pageless.min.js'
4. Add the following to helpers/application_helper.rb
    
    `def pageless(total_pages, url=nil, container=nil)
      opts = {
        :totalPages => total_pages,
        :url        => url,
        :loaderMsg  => 'Loading more results'
      }
      container && opts[:container] ||= container
      javascript_tag("$('#results').pageless(#{opts.to_json});")
    end`
5. If you haven't added the will_paginate helper to the view you want to paginate, add it now. Also, add the pageless helper you just created.
  
  `<%= pageless(@articles.total_pages, articles_path) %>`
6. Ensure that there is a a DOM object with the an id of __results__ (or whatever you defined in your pageless helper), such as a div or table that the AJAXed results will be loaded in.
7. In your ArticlesController, append this to your index action below the instance variable:
  
    `if request.xhr?
      render :partial => @articles`

8. Restart your application. You now have pageless scrolling. 
Usage
-----

    $('#results').pageless({ totalPages: 10
                           , url: '/articles/'
                           , loaderMsg: 'Loading more results'
                           });

Thanks to
---------

* http://codemonky.com/post/34940898
* http://www.unspace.ca/discover/pageless/
* http://famspam.com/facebox

Contributors
------------

* [Jean-Sébastien Ney](https://github.com/jney)
* [Alexander Lang](https://github.com/langalex)
* [Lukas Rieder](https://github.com/Overbryd)