  


<!DOCTYPE html>
<html>
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# githubog: http://ogp.me/ns/fb/githubog#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>jekyll-plugins/generate_categories.rb at master · recurser/jekyll-plugins</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="apple-touch-icon-114.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="apple-touch-icon-114.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="apple-touch-icon-144.png" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="apple-touch-icon-144.png" />
    <link rel="logo" type="image/svg" href="http://github-media-downloads.s3.amazonaws.com/github-logo.svg" />
    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">

    
    
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />

    <meta content="authenticity_token" name="csrf-param" />
<meta content="XGZDvtatLwYp9pIXmPD83oBR0OzUpQq/g7DObql7bbc=" name="csrf-token" />

    <link href="https://a248.e.akamai.net/assets.github.com/assets/github-407693f9f73c33bc72d72bf9656fbf5ae05597d3.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="https://a248.e.akamai.net/assets.github.com/assets/github2-56ff2781ae95d3a31c723b6774df51dd407ef091.css" media="screen" rel="stylesheet" type="text/css" />
    


        <script src="https://a248.e.akamai.net/assets.github.com/assets/frameworks-d61440caec5d2210a2242b084cdb2bc6597e00b7.js" type="text/javascript"></script>
      <script src="https://a248.e.akamai.net/assets.github.com/assets/github-10bb27aa711348c17932dd3a2997237f40846e40.js" type="text/javascript"></script>
      

        <link rel='permalink' href='/recurser/jekyll-plugins/blob/2ce22ae621fb6fe30d038d60dd71d8047c541155/generate_categories.rb'>
    <meta property="og:title" content="jekyll-plugins"/>
    <meta property="og:type" content="githubog:gitrepository"/>
    <meta property="og:url" content="https://github.com/recurser/jekyll-plugins"/>
    <meta property="og:image" content="https://secure.gravatar.com/avatar/c5088be83b69164db3efd149e74f12c3?s=420&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"/>
    <meta property="og:site_name" content="GitHub"/>
    <meta property="og:description" content="jekyll-plugins - A collection of Jekyll plugins and generators that I've written for recursive-design.com"/>
    <meta property="twitter:card" content="summary"/>
    <meta property="twitter:site" content="@GitHub">
    <meta property="twitter:title" content="recurser/jekyll-plugins"/>

    <meta name="description" content="jekyll-plugins - A collection of Jekyll plugins and generators that I've written for recursive-design.com" />

  <link href="https://github.com/recurser/jekyll-plugins/commits/master.atom" rel="alternate" title="Recent Commits to jekyll-plugins:master" type="application/atom+xml" />

  </head>


  <body class="logged_in page-blob macintosh vis-public env-production  ">
    <div id="wrapper">

      

      

      

      


        <div class="header header-logged-in true">
          <div class="container clearfix">

            <a class="header-logo-blacktocat" href="https://github.com/">
  <span class="mega-icon mega-icon-blacktocat"></span>
</a>

            <div class="divider-vertical"></div>

              <a href="/notifications" class="notification-indicator tooltipped downwards" title="You have no unread notifications">
    <span class="mail-status all-read"></span>
  </a>
  <div class="divider-vertical"></div>


              <div class="topsearch command-bar-activated ">
  <form accept-charset="UTF-8" action="/search" class="command_bar_form" id="top_search_form" method="get">
  <a href="/search/advanced" class="advanced-search-icon tooltipped downwards command-bar-search" id="advanced_search" title="Advanced search"><span class="mini-icon mini-icon-advanced-search "></span></a>

  <input type="text" name="q" id="command-bar" placeholder="Search or type a command" tabindex="1" data-username="pragtich" autocapitalize="off">

  <span class="mini-icon help tooltipped downwards" title="Show command bar help">
    <span class="mini-icon mini-icon-help"></span>
  </span>

  <input type="hidden" name="ref" value="commandbar">

  <div class="divider-vertical"></div>
</form>
  <ul class="top-nav">
      <li class="explore"><a href="https://github.com/explore">Explore</a></li>
      <li><a href="https://gist.github.com">Gist</a></li>
      <li><a href="/blog">Blog</a></li>
    <li><a href="http://help.github.com">Help</a></li>
  </ul>
</div>


            

  
    <ul id="user-links">
      <li>
        <a href="https://github.com/pragtich" class="name">
          <img height="20" src="https://secure.gravatar.com/avatar/c3014c3623b299048fae8936aeaa03c9?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /> pragtich
        </a>
      </li>
      <li>
        <a href="/new" id="new_repo" class="tooltipped downwards" title="Create a new repo">
          <span class="mini-icon mini-icon-create"></span>
        </a>
      </li>
      <li>
        <a href="/settings/profile" id="account_settings"
          class="tooltipped downwards"
          title="Account settings ">
          <span class="mini-icon mini-icon-account-settings"></span>
        </a>
      </li>
      <li>
          <a href="/logout" data-method="post" id="logout" class="tooltipped downwards" title="Sign out">
            <span class="mini-icon mini-icon-logout"></span>
          </a>
      </li>
    </ul>



            
          </div>
        </div>


      

      


            <div class="site hfeed" itemscope itemtype="http://schema.org/WebPage">
      <div class="hentry">
        
        <div class="pagehead repohead instapaper_ignore readability-menu">
          <div class="container">
            <div class="title-actions-bar">
              


<ul class="pagehead-actions">


    <li class="subscription">
      <form accept-charset="UTF-8" action="/notifications/subscribe" data-autosubmit="true" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="authenticity_token" type="hidden" value="XGZDvtatLwYp9pIXmPD83oBR0OzUpQq/g7DObql7bbc=" /></div>  <input id="repository_id" name="repository_id" type="hidden" value="1766977" />

    <div class="select-menu js-menu-container js-select-menu">
      <span class="minibutton select-menu-button js-menu-target">
        <span class="js-select-button">
          <span class="mini-icon mini-icon-watching"></span>
          Watch
        </span>
      </span>

      <div class="select-menu-modal-holder js-menu-content">
        <div class="select-menu-modal">
          <div class="select-menu-header">
            <span class="select-menu-title">Notification status</span>
            <span class="mini-icon mini-icon-remove-close js-menu-close"></span>
          </div> <!-- /.select-menu-header -->

          <div class="select-menu-list js-navigation-container js-select-menu-pane">

            <div class="select-menu-item js-navigation-item js-navigation-target selected">
              <span class="select-menu-checkmark mini-icon mini-icon-confirm"></span>
              <div class="select-menu-item-text">
                <input checked="checked" id="do_included" name="do" type="radio" value="included" />
                <h4>Not watching</h4>
                <span class="description">You only receive notifications for discussions in which you participate or are @mentioned.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="mini-icon mini-icon-watching"></span>
                  Watch
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

            <div class="select-menu-item js-navigation-item js-navigation-target ">
              <span class="select-menu-checkmark mini-icon mini-icon-confirm"></span>
              <div class="select-menu-item-text">
                <input id="do_subscribed" name="do" type="radio" value="subscribed" />
                <h4>Watching</h4>
                <span class="description">You receive notifications for all discussions in this repository.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="mini-icon mini-icon-unwatch"></span>
                  Unwatch
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

            <div class="select-menu-item js-navigation-item js-navigation-target ">
              <span class="select-menu-checkmark mini-icon mini-icon-confirm"></span>
              <div class="select-menu-item-text">
                <input id="do_ignore" name="do" type="radio" value="ignore" />
                <h4>Ignoring</h4>
                <span class="description">You do not receive any notifications for discussions in this repository.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="mini-icon mini-icon-mute"></span>
                  Stop ignoring
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

          </div> <!-- /.select-menu-list -->

        </div> <!-- /.select-menu-modal -->
      </div> <!-- /.select-menu-modal-holder -->
    </div> <!-- /.select-menu -->

</form>
    </li>

    <li class="js-toggler-container js-social-container starring-container ">
      <a href="/recurser/jekyll-plugins/unstar" class="minibutton js-toggler-target star-button starred upwards" title="Unstar this repo" data-remote="true" data-method="post" rel="nofollow">
        <span class="mini-icon mini-icon-remove-star"></span>
        <span class="text">Unstar</span>
      </a>
      <a href="/recurser/jekyll-plugins/star" class="minibutton js-toggler-target star-button unstarred upwards" title="Star this repo" data-remote="true" data-method="post" rel="nofollow">
        <span class="mini-icon mini-icon-star"></span>
        <span class="text">Star</span>
      </a>
      <a class="social-count js-social-count" href="/recurser/jekyll-plugins/stargazers">62</a>
    </li>

        <li>
          <a href="/recurser/jekyll-plugins/fork" class="minibutton js-toggler-target fork-button lighter upwards" title="Fork this repo" rel="nofollow" data-method="post">
            <span class="mini-icon mini-icon-branch-create"></span>
            <span class="text">Fork</span>
          </a>
          <a href="/recurser/jekyll-plugins/network" class="social-count">12</a>
        </li>


</ul>

              <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
                <span class="repo-label"><span>public</span></span>
                <span class="mega-icon mega-icon-public-repo"></span>
                <span class="author vcard">
                  <a href="/recurser" class="url fn" itemprop="url" rel="author">
                  <span itemprop="title">recurser</span>
                  </a></span> /
                <strong><a href="/recurser/jekyll-plugins" class="js-current-repository">jekyll-plugins</a></strong>
              </h1>
            </div>

            

  <ul class="tabs">
    <li><a href="/recurser/jekyll-plugins" class="selected" highlight="repo_sourcerepo_downloadsrepo_commitsrepo_tagsrepo_branches">Code</a></li>
    <li><a href="/recurser/jekyll-plugins/network" highlight="repo_network">Network</a></li>
    <li><a href="/recurser/jekyll-plugins/pulls" highlight="repo_pulls">Pull Requests <span class='counter'>2</span></a></li>

      <li><a href="/recurser/jekyll-plugins/issues" highlight="repo_issues">Issues <span class='counter'>7</span></a></li>

      <li><a href="/recurser/jekyll-plugins/wiki" highlight="repo_wiki">Wiki</a></li>


    <li><a href="/recurser/jekyll-plugins/graphs" highlight="repo_graphsrepo_contributors">Graphs</a></li>


  </ul>
  
<div class="tabnav">

  <span class="tabnav-right">
    <ul class="tabnav-tabs">
          <li><a href="/recurser/jekyll-plugins/tags" class="tabnav-tab" highlight="repo_tags">Tags <span class="counter ">6</span></a></li>
    </ul>
    
  </span>

  <div class="tabnav-widget scope">


    <div class="select-menu js-menu-container js-select-menu js-branch-menu">
      <a class="minibutton select-menu-button js-menu-target" data-hotkey="w" data-ref="master">
        <span class="mini-icon mini-icon-branch"></span>
        <i>branch:</i>
        <span class="js-select-button">master</span>
      </a>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container js-select-menu-pane">

        <div class="select-menu-modal js-select-menu-pane">
          <div class="select-menu-header">
            <span class="select-menu-title">Switch branches/tags</span>
            <span class="mini-icon mini-icon-remove-close js-menu-close"></span>
          </div> <!-- /.select-menu-header -->

          <div class="select-menu-filters">
            <div class="select-menu-text-filter">
              <input type="text" id="commitish-filter-field" class="js-select-menu-text-filter js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
            </div> <!-- /.select-menu-text-filter -->
            <div class="select-menu-tabs">
              <ul>
                <li class="select-menu-tab">
                  <a href="#" data-filter="branches" class="js-select-menu-tab selected">Branches</a>
                </li>
                <li class="select-menu-tab">
                  <a href="#" data-filter="tags" class="js-select-menu-tab">Tags</a>
                </li>
              </ul>
            </div><!-- /.select-menu-tabs -->
          </div><!-- /.select-menu-filters -->

          <div class="select-menu-list js-filter-tab js-filter-branches css-truncate" data-filterable-for="commitish-filter-field" data-filterable-type="substring">



              <div class="select-menu-item js-navigation-item js-navigation-target ">
                <span class="select-menu-checkmark mini-icon mini-icon-confirm"></span>
                <a href="/recurser/jekyll-plugins/blob/develop/generate_categories.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="develop" rel="nofollow" title="develop">develop</a>
              </div> <!-- /.select-menu-item -->

              <div class="select-menu-item js-navigation-item js-navigation-target selected">
                <span class="select-menu-checkmark mini-icon mini-icon-confirm"></span>
                <a href="/recurser/jekyll-plugins/blob/master/generate_categories.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="master" rel="nofollow" title="master">master</a>
              </div> <!-- /.select-menu-item -->

              <div class="select-menu-no-results js-not-filterable">Nothing to show</div>
          </div> <!-- /.select-menu-list -->


          <div class="select-menu-list js-filter-tab js-filter-tags css-truncate" data-filterable-for="commitish-filter-field" data-filterable-type="substring" style="display:none;">

              <div class="select-menu-item js-navigation-item js-navigation-target ">
                <span class="select-menu-checkmark mini-icon mini-icon-confirm"></span>
                    <a href="/recurser/jekyll-plugins/blob/v0.2.5/generate_categories.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.2.5" rel="nofollow" title="v0.2.5">v0.2.5</a>

              </div> <!-- /.select-menu-item -->
              <div class="select-menu-item js-navigation-item js-navigation-target ">
                <span class="select-menu-checkmark mini-icon mini-icon-confirm"></span>
                    <a href="/recurser/jekyll-plugins/blob/v0.2.4/generate_categories.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.2.4" rel="nofollow" title="v0.2.4">v0.2.4</a>

              </div> <!-- /.select-menu-item -->
              <div class="select-menu-item js-navigation-item js-navigation-target ">
                <span class="select-menu-checkmark mini-icon mini-icon-confirm"></span>
                    <a href="/recurser/jekyll-plugins/blob/v0.2.3/generate_categories.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.2.3" rel="nofollow" title="v0.2.3">v0.2.3</a>

              </div> <!-- /.select-menu-item -->
              <div class="select-menu-item js-navigation-item js-navigation-target ">
                <span class="select-menu-checkmark mini-icon mini-icon-confirm"></span>
                    <a href="/recurser/jekyll-plugins/blob/v0.2.2/generate_categories.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.2.2" rel="nofollow" title="v0.2.2">v0.2.2</a>

              </div> <!-- /.select-menu-item -->
              <div class="select-menu-item js-navigation-item js-navigation-target ">
                <span class="select-menu-checkmark mini-icon mini-icon-confirm"></span>
                    <a href="/recurser/jekyll-plugins/blob/v0.2.1/generate_categories.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.2.1" rel="nofollow" title="v0.2.1">v0.2.1</a>

              </div> <!-- /.select-menu-item -->
              <div class="select-menu-item js-navigation-item js-navigation-target ">
                <span class="select-menu-checkmark mini-icon mini-icon-confirm"></span>
                    <a href="/recurser/jekyll-plugins/blob/v0.2.0/generate_categories.rb" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v0.2.0" rel="nofollow" title="v0.2.0">v0.2.0</a>

              </div> <!-- /.select-menu-item -->

            <div class="select-menu-no-results js-not-filterable">Nothing to show</div>

          </div> <!-- /.select-menu-list -->

        </div> <!-- /.select-menu-modal -->
      </div> <!-- /.select-menu-modal-holder -->
    </div> <!-- /.select-menu -->

  </div> <!-- /.scope -->

  <ul class="tabnav-tabs">
    <li><a href="/recurser/jekyll-plugins" class="selected tabnav-tab" highlight="repo_source">Files</a></li>
    <li><a href="/recurser/jekyll-plugins/commits/master" class="tabnav-tab" highlight="repo_commits">Commits</a></li>
    <li><a href="/recurser/jekyll-plugins/branches" class="tabnav-tab" highlight="repo_branches" rel="nofollow">Branches <span class="counter ">2</span></a></li>
  </ul>

</div>

  
  
  


            
          </div>
        </div><!-- /.repohead -->

        <div id="js-repo-pjax-container" class="container context-loader-container" data-pjax-container>
          


<!-- blob contrib key: blob_contributors:v21:f2793d011898cb22a698b0eb38a59aca -->
<!-- blob contrib frag key: views10/v8/blob_contributors:v21:f2793d011898cb22a698b0eb38a59aca -->


<div id="slider">
    <div class="frame-meta">

      <p title="This is a placeholder element" class="js-history-link-replace hidden"></p>

        <div class="breadcrumb">
          <span class='bold'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/recurser/jekyll-plugins" class="js-slide-to" data-direction="back" itemscope="url"><span itemprop="title">jekyll-plugins</span></a></span></span> / <strong class="final-path">generate_categories.rb</strong> <span class="js-zeroclipboard zeroclipboard-button" data-clipboard-text="generate_categories.rb" data-copied-hint="copied!" title="copy to clipboard"><span class="mini-icon mini-icon-clipboard"></span></span>
        </div>

      <a href="/recurser/jekyll-plugins/find/master" class="js-slide-to" data-hotkey="t" style="display:none">Show File Finder</a>


        
  <div class="commit file-history-tease">
    <img class="main-avatar" height="24" src="https://secure.gravatar.com/avatar/c5088be83b69164db3efd149e74f12c3?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
    <span class="author"><a href="/recurser" rel="author">recurser</a></span>
    <time class="js-relative-date" datetime="2012-10-15T04:38:29-07:00" title="2012-10-15 04:38:29">October 15, 2012</time>
    <div class="commit-title">
        <a href="/recurser/jekyll-plugins/commit/bb28a8e9dc696985a3104ff2a6e4397dc79b27e7" class="message">Fix version number confusion after hotfixes.</a>
    </div>

    <div class="participation">
      <p class="quickstat"><a href="#blob_contributors_box" rel="facebox"><strong>1</strong> contributor</a></p>
      
    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2>Users on GitHub who have contributed to this file</h2>
      <ul class="facebox-user-list">
        <li>
          <img height="24" src="https://secure.gravatar.com/avatar/c5088be83b69164db3efd149e74f12c3?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/recurser">recurser</a>
        </li>
      </ul>
    </div>
  </div>


    </div><!-- ./.frame-meta -->

    <div class="frames">
      <div class="frame" data-permalink-url="/recurser/jekyll-plugins/blob/2ce22ae621fb6fe30d038d60dd71d8047c541155/generate_categories.rb" data-title="jekyll-plugins/generate_categories.rb at master · recurser/jekyll-plugins · GitHub" data-type="blob">

        <div id="files" class="bubble">
          <div class="file">
            <div class="meta">
              <div class="info">
                <span class="icon"><b class="mini-icon mini-icon-text-file"></b></span>
                <span class="mode" title="File Mode">file</span>
                  <span>240 lines (208 sloc)</span>
                <span>8.987 kb</span>
              </div>
              <div class="actions">
                <div class="button-group">
                        <a class="minibutton tooltipped leftwards"
                           title="Clicking this button will automatically fork this project so you can edit the file"
                           href="/recurser/jekyll-plugins/edit/master/generate_categories.rb"
                           data-method="post" rel="nofollow">Edit</a>
                  <a href="/recurser/jekyll-plugins/raw/master/generate_categories.rb" class="button minibutton " id="raw-url">Raw</a>
                    <a href="/recurser/jekyll-plugins/blame/master/generate_categories.rb" class="button minibutton ">Blame</a>
                  <a href="/recurser/jekyll-plugins/commits/master/generate_categories.rb" class="button minibutton " rel="nofollow">History</a>
                </div><!-- /.button-group -->
              </div><!-- /.actions -->

            </div>
                <div class="data type-ruby js-blob-data">
      <table cellpadding="0" cellspacing="0" class="lines">
        <tr>
          <td>
            <pre class="line_numbers"><span id="L1" rel="#L1">1</span>
<span id="L2" rel="#L2">2</span>
<span id="L3" rel="#L3">3</span>
<span id="L4" rel="#L4">4</span>
<span id="L5" rel="#L5">5</span>
<span id="L6" rel="#L6">6</span>
<span id="L7" rel="#L7">7</span>
<span id="L8" rel="#L8">8</span>
<span id="L9" rel="#L9">9</span>
<span id="L10" rel="#L10">10</span>
<span id="L11" rel="#L11">11</span>
<span id="L12" rel="#L12">12</span>
<span id="L13" rel="#L13">13</span>
<span id="L14" rel="#L14">14</span>
<span id="L15" rel="#L15">15</span>
<span id="L16" rel="#L16">16</span>
<span id="L17" rel="#L17">17</span>
<span id="L18" rel="#L18">18</span>
<span id="L19" rel="#L19">19</span>
<span id="L20" rel="#L20">20</span>
<span id="L21" rel="#L21">21</span>
<span id="L22" rel="#L22">22</span>
<span id="L23" rel="#L23">23</span>
<span id="L24" rel="#L24">24</span>
<span id="L25" rel="#L25">25</span>
<span id="L26" rel="#L26">26</span>
<span id="L27" rel="#L27">27</span>
<span id="L28" rel="#L28">28</span>
<span id="L29" rel="#L29">29</span>
<span id="L30" rel="#L30">30</span>
<span id="L31" rel="#L31">31</span>
<span id="L32" rel="#L32">32</span>
<span id="L33" rel="#L33">33</span>
<span id="L34" rel="#L34">34</span>
<span id="L35" rel="#L35">35</span>
<span id="L36" rel="#L36">36</span>
<span id="L37" rel="#L37">37</span>
<span id="L38" rel="#L38">38</span>
<span id="L39" rel="#L39">39</span>
<span id="L40" rel="#L40">40</span>
<span id="L41" rel="#L41">41</span>
<span id="L42" rel="#L42">42</span>
<span id="L43" rel="#L43">43</span>
<span id="L44" rel="#L44">44</span>
<span id="L45" rel="#L45">45</span>
<span id="L46" rel="#L46">46</span>
<span id="L47" rel="#L47">47</span>
<span id="L48" rel="#L48">48</span>
<span id="L49" rel="#L49">49</span>
<span id="L50" rel="#L50">50</span>
<span id="L51" rel="#L51">51</span>
<span id="L52" rel="#L52">52</span>
<span id="L53" rel="#L53">53</span>
<span id="L54" rel="#L54">54</span>
<span id="L55" rel="#L55">55</span>
<span id="L56" rel="#L56">56</span>
<span id="L57" rel="#L57">57</span>
<span id="L58" rel="#L58">58</span>
<span id="L59" rel="#L59">59</span>
<span id="L60" rel="#L60">60</span>
<span id="L61" rel="#L61">61</span>
<span id="L62" rel="#L62">62</span>
<span id="L63" rel="#L63">63</span>
<span id="L64" rel="#L64">64</span>
<span id="L65" rel="#L65">65</span>
<span id="L66" rel="#L66">66</span>
<span id="L67" rel="#L67">67</span>
<span id="L68" rel="#L68">68</span>
<span id="L69" rel="#L69">69</span>
<span id="L70" rel="#L70">70</span>
<span id="L71" rel="#L71">71</span>
<span id="L72" rel="#L72">72</span>
<span id="L73" rel="#L73">73</span>
<span id="L74" rel="#L74">74</span>
<span id="L75" rel="#L75">75</span>
<span id="L76" rel="#L76">76</span>
<span id="L77" rel="#L77">77</span>
<span id="L78" rel="#L78">78</span>
<span id="L79" rel="#L79">79</span>
<span id="L80" rel="#L80">80</span>
<span id="L81" rel="#L81">81</span>
<span id="L82" rel="#L82">82</span>
<span id="L83" rel="#L83">83</span>
<span id="L84" rel="#L84">84</span>
<span id="L85" rel="#L85">85</span>
<span id="L86" rel="#L86">86</span>
<span id="L87" rel="#L87">87</span>
<span id="L88" rel="#L88">88</span>
<span id="L89" rel="#L89">89</span>
<span id="L90" rel="#L90">90</span>
<span id="L91" rel="#L91">91</span>
<span id="L92" rel="#L92">92</span>
<span id="L93" rel="#L93">93</span>
<span id="L94" rel="#L94">94</span>
<span id="L95" rel="#L95">95</span>
<span id="L96" rel="#L96">96</span>
<span id="L97" rel="#L97">97</span>
<span id="L98" rel="#L98">98</span>
<span id="L99" rel="#L99">99</span>
<span id="L100" rel="#L100">100</span>
<span id="L101" rel="#L101">101</span>
<span id="L102" rel="#L102">102</span>
<span id="L103" rel="#L103">103</span>
<span id="L104" rel="#L104">104</span>
<span id="L105" rel="#L105">105</span>
<span id="L106" rel="#L106">106</span>
<span id="L107" rel="#L107">107</span>
<span id="L108" rel="#L108">108</span>
<span id="L109" rel="#L109">109</span>
<span id="L110" rel="#L110">110</span>
<span id="L111" rel="#L111">111</span>
<span id="L112" rel="#L112">112</span>
<span id="L113" rel="#L113">113</span>
<span id="L114" rel="#L114">114</span>
<span id="L115" rel="#L115">115</span>
<span id="L116" rel="#L116">116</span>
<span id="L117" rel="#L117">117</span>
<span id="L118" rel="#L118">118</span>
<span id="L119" rel="#L119">119</span>
<span id="L120" rel="#L120">120</span>
<span id="L121" rel="#L121">121</span>
<span id="L122" rel="#L122">122</span>
<span id="L123" rel="#L123">123</span>
<span id="L124" rel="#L124">124</span>
<span id="L125" rel="#L125">125</span>
<span id="L126" rel="#L126">126</span>
<span id="L127" rel="#L127">127</span>
<span id="L128" rel="#L128">128</span>
<span id="L129" rel="#L129">129</span>
<span id="L130" rel="#L130">130</span>
<span id="L131" rel="#L131">131</span>
<span id="L132" rel="#L132">132</span>
<span id="L133" rel="#L133">133</span>
<span id="L134" rel="#L134">134</span>
<span id="L135" rel="#L135">135</span>
<span id="L136" rel="#L136">136</span>
<span id="L137" rel="#L137">137</span>
<span id="L138" rel="#L138">138</span>
<span id="L139" rel="#L139">139</span>
<span id="L140" rel="#L140">140</span>
<span id="L141" rel="#L141">141</span>
<span id="L142" rel="#L142">142</span>
<span id="L143" rel="#L143">143</span>
<span id="L144" rel="#L144">144</span>
<span id="L145" rel="#L145">145</span>
<span id="L146" rel="#L146">146</span>
<span id="L147" rel="#L147">147</span>
<span id="L148" rel="#L148">148</span>
<span id="L149" rel="#L149">149</span>
<span id="L150" rel="#L150">150</span>
<span id="L151" rel="#L151">151</span>
<span id="L152" rel="#L152">152</span>
<span id="L153" rel="#L153">153</span>
<span id="L154" rel="#L154">154</span>
<span id="L155" rel="#L155">155</span>
<span id="L156" rel="#L156">156</span>
<span id="L157" rel="#L157">157</span>
<span id="L158" rel="#L158">158</span>
<span id="L159" rel="#L159">159</span>
<span id="L160" rel="#L160">160</span>
<span id="L161" rel="#L161">161</span>
<span id="L162" rel="#L162">162</span>
<span id="L163" rel="#L163">163</span>
<span id="L164" rel="#L164">164</span>
<span id="L165" rel="#L165">165</span>
<span id="L166" rel="#L166">166</span>
<span id="L167" rel="#L167">167</span>
<span id="L168" rel="#L168">168</span>
<span id="L169" rel="#L169">169</span>
<span id="L170" rel="#L170">170</span>
<span id="L171" rel="#L171">171</span>
<span id="L172" rel="#L172">172</span>
<span id="L173" rel="#L173">173</span>
<span id="L174" rel="#L174">174</span>
<span id="L175" rel="#L175">175</span>
<span id="L176" rel="#L176">176</span>
<span id="L177" rel="#L177">177</span>
<span id="L178" rel="#L178">178</span>
<span id="L179" rel="#L179">179</span>
<span id="L180" rel="#L180">180</span>
<span id="L181" rel="#L181">181</span>
<span id="L182" rel="#L182">182</span>
<span id="L183" rel="#L183">183</span>
<span id="L184" rel="#L184">184</span>
<span id="L185" rel="#L185">185</span>
<span id="L186" rel="#L186">186</span>
<span id="L187" rel="#L187">187</span>
<span id="L188" rel="#L188">188</span>
<span id="L189" rel="#L189">189</span>
<span id="L190" rel="#L190">190</span>
<span id="L191" rel="#L191">191</span>
<span id="L192" rel="#L192">192</span>
<span id="L193" rel="#L193">193</span>
<span id="L194" rel="#L194">194</span>
<span id="L195" rel="#L195">195</span>
<span id="L196" rel="#L196">196</span>
<span id="L197" rel="#L197">197</span>
<span id="L198" rel="#L198">198</span>
<span id="L199" rel="#L199">199</span>
<span id="L200" rel="#L200">200</span>
<span id="L201" rel="#L201">201</span>
<span id="L202" rel="#L202">202</span>
<span id="L203" rel="#L203">203</span>
<span id="L204" rel="#L204">204</span>
<span id="L205" rel="#L205">205</span>
<span id="L206" rel="#L206">206</span>
<span id="L207" rel="#L207">207</span>
<span id="L208" rel="#L208">208</span>
<span id="L209" rel="#L209">209</span>
<span id="L210" rel="#L210">210</span>
<span id="L211" rel="#L211">211</span>
<span id="L212" rel="#L212">212</span>
<span id="L213" rel="#L213">213</span>
<span id="L214" rel="#L214">214</span>
<span id="L215" rel="#L215">215</span>
<span id="L216" rel="#L216">216</span>
<span id="L217" rel="#L217">217</span>
<span id="L218" rel="#L218">218</span>
<span id="L219" rel="#L219">219</span>
<span id="L220" rel="#L220">220</span>
<span id="L221" rel="#L221">221</span>
<span id="L222" rel="#L222">222</span>
<span id="L223" rel="#L223">223</span>
<span id="L224" rel="#L224">224</span>
<span id="L225" rel="#L225">225</span>
<span id="L226" rel="#L226">226</span>
<span id="L227" rel="#L227">227</span>
<span id="L228" rel="#L228">228</span>
<span id="L229" rel="#L229">229</span>
<span id="L230" rel="#L230">230</span>
<span id="L231" rel="#L231">231</span>
<span id="L232" rel="#L232">232</span>
<span id="L233" rel="#L233">233</span>
<span id="L234" rel="#L234">234</span>
<span id="L235" rel="#L235">235</span>
<span id="L236" rel="#L236">236</span>
<span id="L237" rel="#L237">237</span>
<span id="L238" rel="#L238">238</span>
<span id="L239" rel="#L239">239</span>
<span id="L240" rel="#L240">240</span>
</pre>
          </td>
          <td width="100%">
                  <div class="highlight"><pre><div class='line' id='LC1'><span class="c1"># encoding: utf-8</span></div><div class='line' id='LC2'><span class="c1">#</span></div><div class='line' id='LC3'><span class="c1"># Jekyll category page generator.</span></div><div class='line' id='LC4'><span class="c1"># http://recursive-design.com/projects/jekyll-plugins/</span></div><div class='line' id='LC5'><span class="c1">#</span></div><div class='line' id='LC6'><span class="c1"># Version: 0.2.4 (201210160037)</span></div><div class='line' id='LC7'><span class="c1">#</span></div><div class='line' id='LC8'><span class="c1"># Copyright (c) 2010 Dave Perrett, http://recursive-design.com/</span></div><div class='line' id='LC9'><span class="c1"># Licensed under the MIT license (http://www.opensource.org/licenses/mit-license.php)</span></div><div class='line' id='LC10'><span class="c1">#</span></div><div class='line' id='LC11'><span class="c1"># A generator that creates category pages for jekyll sites.</span></div><div class='line' id='LC12'><span class="c1">#</span></div><div class='line' id='LC13'><span class="c1"># To use it, simply drop this script into the _plugins directory of your Jekyll site. You should</span></div><div class='line' id='LC14'><span class="c1"># also create a file called &#39;category_index.html&#39; in the _layouts directory of your jekyll site</span></div><div class='line' id='LC15'><span class="c1"># with the following contents (note: you should remove the leading &#39;# &#39; characters):</span></div><div class='line' id='LC16'><span class="c1">#</span></div><div class='line' id='LC17'><span class="c1"># ================================== COPY BELOW THIS LINE ==================================</span></div><div class='line' id='LC18'><span class="c1"># ---</span></div><div class='line' id='LC19'><span class="c1"># layout: default</span></div><div class='line' id='LC20'><span class="c1"># ---</span></div><div class='line' id='LC21'><span class="c1">#</span></div><div class='line' id='LC22'><span class="c1"># &lt;h1 class=&quot;category&quot;&gt;{{ page.title }}&lt;/h1&gt;</span></div><div class='line' id='LC23'><span class="c1"># &lt;ul class=&quot;posts&quot;&gt;</span></div><div class='line' id='LC24'><span class="c1"># {% for post in site.categories[page.category] %}</span></div><div class='line' id='LC25'><span class="c1">#     &lt;div&gt;{{ post.date | date_to_html_string }}&lt;/div&gt;</span></div><div class='line' id='LC26'><span class="c1">#     &lt;h2&gt;&lt;a href=&quot;{{ post.url }}&quot;&gt;{{ post.title }}&lt;/a&gt;&lt;/h2&gt;</span></div><div class='line' id='LC27'><span class="c1">#     &lt;div class=&quot;categories&quot;&gt;Filed under {{ post.categories | category_links }}&lt;/div&gt;</span></div><div class='line' id='LC28'><span class="c1"># {% endfor %}</span></div><div class='line' id='LC29'><span class="c1"># &lt;/ul&gt;</span></div><div class='line' id='LC30'><span class="c1"># ================================== COPY ABOVE THIS LINE ==================================</span></div><div class='line' id='LC31'><span class="c1">#</span></div><div class='line' id='LC32'><span class="c1"># You can alter the _layout_ setting if you wish to use an alternate layout, and obviously you</span></div><div class='line' id='LC33'><span class="c1"># can change the HTML above as you see fit.</span></div><div class='line' id='LC34'><span class="c1">#</span></div><div class='line' id='LC35'><span class="c1"># When you compile your jekyll site, this plugin will loop through the list of categories in your</span></div><div class='line' id='LC36'><span class="c1"># site, and use the layout above to generate a page for each one with a list of links to the</span></div><div class='line' id='LC37'><span class="c1"># individual posts.</span></div><div class='line' id='LC38'><span class="c1">#</span></div><div class='line' id='LC39'><span class="c1"># You can also (optionally) generate an atom.xml feed for each category. To do this, copy</span></div><div class='line' id='LC40'><span class="c1"># the category_feed.xml file to the _includes/custom directory of your own project</span></div><div class='line' id='LC41'><span class="c1"># (https://github.com/recurser/jekyll-plugins/blob/master/_includes/custom/category_feed.xml).</span></div><div class='line' id='LC42'><span class="c1"># You&#39;ll also need to copy the octopress_filters.rb file into the _plugins directory of your</span></div><div class='line' id='LC43'><span class="c1"># project as the category_feed.xml requires a couple of extra filters</span></div><div class='line' id='LC44'><span class="c1"># (https://github.com/recurser/jekyll-plugins/blob/master/_plugins/octopress_filters.rb).</span></div><div class='line' id='LC45'><span class="c1">#</span></div><div class='line' id='LC46'><span class="c1"># Included filters :</span></div><div class='line' id='LC47'><span class="c1"># - category_links:      Outputs the list of categories as comma-separated &lt;a&gt; links.</span></div><div class='line' id='LC48'><span class="c1"># - date_to_html_string: Outputs the post.date as formatted html, with hooks for CSS styling.</span></div><div class='line' id='LC49'><span class="c1">#</span></div><div class='line' id='LC50'><span class="c1"># Available _config.yml settings :</span></div><div class='line' id='LC51'><span class="c1"># - category_dir:          The subfolder to build category pages in (default is &#39;categories&#39;).</span></div><div class='line' id='LC52'><span class="c1"># - category_title_prefix: The string used before the category name in the page title (default is</span></div><div class='line' id='LC53'><span class="c1">#                          &#39;Category: &#39;).</span></div><div class='line' id='LC54'><span class="k">module</span> <span class="nn">Jekyll</span></div><div class='line' id='LC55'><br/></div><div class='line' id='LC56'>&nbsp;&nbsp;<span class="c1"># The CategoryIndex class creates a single category page for the specified category.</span></div><div class='line' id='LC57'>&nbsp;&nbsp;<span class="k">class</span> <span class="nc">CategoryPage</span> <span class="o">&lt;</span> <span class="no">Page</span></div><div class='line' id='LC58'><br/></div><div class='line' id='LC59'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Initializes a new CategoryIndex.</span></div><div class='line' id='LC60'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#</span></div><div class='line' id='LC61'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#  +template_path+ is the path to the layout template to use.</span></div><div class='line' id='LC62'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#  +site+          is the Jekyll Site instance.</span></div><div class='line' id='LC63'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#  +base+          is the String path to the &lt;source&gt;.</span></div><div class='line' id='LC64'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#  +category_dir+  is the String path between &lt;source&gt; and the category folder.</span></div><div class='line' id='LC65'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#  +category+      is the category currently being processed.</span></div><div class='line' id='LC66'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">initialize</span><span class="p">(</span><span class="n">template_path</span><span class="p">,</span> <span class="nb">name</span><span class="p">,</span> <span class="n">site</span><span class="p">,</span> <span class="n">base</span><span class="p">,</span> <span class="n">category_dir</span><span class="p">,</span> <span class="n">category</span><span class="p">)</span></div><div class='line' id='LC67'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@site</span>  <span class="o">=</span> <span class="n">site</span></div><div class='line' id='LC68'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@base</span>  <span class="o">=</span> <span class="n">base</span></div><div class='line' id='LC69'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@dir</span>   <span class="o">=</span> <span class="n">category_dir</span></div><div class='line' id='LC70'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@name</span>  <span class="o">=</span> <span class="nb">name</span></div><div class='line' id='LC71'><br/></div><div class='line' id='LC72'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">self</span><span class="o">.</span><span class="n">process</span><span class="p">(</span><span class="nb">name</span><span class="p">)</span></div><div class='line' id='LC73'><br/></div><div class='line' id='LC74'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="no">File</span><span class="o">.</span><span class="n">exist?</span><span class="p">(</span><span class="n">template_path</span><span class="p">)</span></div><div class='line' id='LC75'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@perform_render</span> <span class="o">=</span> <span class="kp">true</span></div><div class='line' id='LC76'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">template_dir</span>    <span class="o">=</span> <span class="no">File</span><span class="o">.</span><span class="n">dirname</span><span class="p">(</span><span class="n">template_path</span><span class="p">)</span></div><div class='line' id='LC77'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">template</span>        <span class="o">=</span> <span class="no">File</span><span class="o">.</span><span class="n">basename</span><span class="p">(</span><span class="n">template_path</span><span class="p">)</span></div><div class='line' id='LC78'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Read the YAML data from the layout page.</span></div><div class='line' id='LC79'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">self</span><span class="o">.</span><span class="n">read_yaml</span><span class="p">(</span><span class="n">template_dir</span><span class="p">,</span> <span class="n">template</span><span class="p">)</span></div><div class='line' id='LC80'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">self</span><span class="o">.</span><span class="n">data</span><span class="o">[</span><span class="s1">&#39;category&#39;</span><span class="o">]</span>    <span class="o">=</span> <span class="n">category</span></div><div class='line' id='LC81'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Set the title for this page.</span></div><div class='line' id='LC82'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">title_prefix</span>             <span class="o">=</span> <span class="n">site</span><span class="o">.</span><span class="n">config</span><span class="o">[</span><span class="s1">&#39;category_title_prefix&#39;</span><span class="o">]</span> <span class="o">||</span> <span class="s1">&#39;Category: &#39;</span></div><div class='line' id='LC83'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">self</span><span class="o">.</span><span class="n">data</span><span class="o">[</span><span class="s1">&#39;title&#39;</span><span class="o">]</span>       <span class="o">=</span> <span class="s2">&quot;</span><span class="si">#{</span><span class="n">title_prefix</span><span class="si">}#{</span><span class="n">category</span><span class="si">}</span><span class="s2">&quot;</span></div><div class='line' id='LC84'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Set the meta-description for this page.</span></div><div class='line' id='LC85'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">meta_description_prefix</span>  <span class="o">=</span> <span class="n">site</span><span class="o">.</span><span class="n">config</span><span class="o">[</span><span class="s1">&#39;category_meta_description_prefix&#39;</span><span class="o">]</span> <span class="o">||</span> <span class="s1">&#39;Category: &#39;</span></div><div class='line' id='LC86'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">self</span><span class="o">.</span><span class="n">data</span><span class="o">[</span><span class="s1">&#39;description&#39;</span><span class="o">]</span> <span class="o">=</span> <span class="s2">&quot;</span><span class="si">#{</span><span class="n">meta_description_prefix</span><span class="si">}#{</span><span class="n">category</span><span class="si">}</span><span class="s2">&quot;</span></div><div class='line' id='LC87'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span></div><div class='line' id='LC88'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@perform_render</span> <span class="o">=</span> <span class="kp">false</span></div><div class='line' id='LC89'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC90'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC91'><br/></div><div class='line' id='LC92'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">render?</span></div><div class='line' id='LC93'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@perform_render</span></div><div class='line' id='LC94'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC95'><br/></div><div class='line' id='LC96'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC97'><br/></div><div class='line' id='LC98'>&nbsp;&nbsp;<span class="c1"># The CategoryIndex class creates a single category page for the specified category.</span></div><div class='line' id='LC99'>&nbsp;&nbsp;<span class="k">class</span> <span class="nc">CategoryIndex</span> <span class="o">&lt;</span> <span class="no">CategoryPage</span></div><div class='line' id='LC100'><br/></div><div class='line' id='LC101'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Initializes a new CategoryIndex.</span></div><div class='line' id='LC102'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#</span></div><div class='line' id='LC103'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#  +site+         is the Jekyll Site instance.</span></div><div class='line' id='LC104'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#  +base+         is the String path to the &lt;source&gt;.</span></div><div class='line' id='LC105'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#  +category_dir+ is the String path between &lt;source&gt; and the category folder.</span></div><div class='line' id='LC106'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#  +category+     is the category currently being processed.</span></div><div class='line' id='LC107'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">initialize</span><span class="p">(</span><span class="n">site</span><span class="p">,</span> <span class="n">base</span><span class="p">,</span> <span class="n">category_dir</span><span class="p">,</span> <span class="n">category</span><span class="p">)</span></div><div class='line' id='LC108'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">template_path</span> <span class="o">=</span> <span class="no">File</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">base</span><span class="p">,</span> <span class="s1">&#39;_layouts&#39;</span><span class="p">,</span> <span class="s1">&#39;category_index.html&#39;</span><span class="p">)</span></div><div class='line' id='LC109'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">super</span><span class="p">(</span><span class="n">template_path</span><span class="p">,</span> <span class="s1">&#39;index.html&#39;</span><span class="p">,</span> <span class="n">site</span><span class="p">,</span> <span class="n">base</span><span class="p">,</span> <span class="n">category_dir</span><span class="p">,</span> <span class="n">category</span><span class="p">)</span></div><div class='line' id='LC110'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC111'><br/></div><div class='line' id='LC112'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC113'><br/></div><div class='line' id='LC114'>&nbsp;&nbsp;<span class="c1"># The CategoryFeed class creates an Atom feed for the specified category.</span></div><div class='line' id='LC115'>&nbsp;&nbsp;<span class="k">class</span> <span class="nc">CategoryFeed</span> <span class="o">&lt;</span> <span class="no">CategoryPage</span></div><div class='line' id='LC116'><br/></div><div class='line' id='LC117'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Initializes a new CategoryFeed.</span></div><div class='line' id='LC118'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#</span></div><div class='line' id='LC119'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#  +site+         is the Jekyll Site instance.</span></div><div class='line' id='LC120'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#  +base+         is the String path to the &lt;source&gt;.</span></div><div class='line' id='LC121'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#  +category_dir+ is the String path between &lt;source&gt; and the category folder.</span></div><div class='line' id='LC122'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#  +category+     is the category currently being processed.</span></div><div class='line' id='LC123'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">initialize</span><span class="p">(</span><span class="n">site</span><span class="p">,</span> <span class="n">base</span><span class="p">,</span> <span class="n">category_dir</span><span class="p">,</span> <span class="n">category</span><span class="p">)</span></div><div class='line' id='LC124'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">template_path</span> <span class="o">=</span> <span class="no">File</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">base</span><span class="p">,</span> <span class="s1">&#39;_includes&#39;</span><span class="p">,</span> <span class="s1">&#39;custom&#39;</span><span class="p">,</span> <span class="s1">&#39;category_feed.xml&#39;</span><span class="p">)</span></div><div class='line' id='LC125'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">super</span><span class="p">(</span><span class="n">template_path</span><span class="p">,</span> <span class="s1">&#39;atom.xml&#39;</span><span class="p">,</span> <span class="n">site</span><span class="p">,</span> <span class="n">base</span><span class="p">,</span> <span class="n">category_dir</span><span class="p">,</span> <span class="n">category</span><span class="p">)</span></div><div class='line' id='LC126'><br/></div><div class='line' id='LC127'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Set the correct feed URL.</span></div><div class='line' id='LC128'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">self</span><span class="o">.</span><span class="n">data</span><span class="o">[</span><span class="s1">&#39;feed_url&#39;</span><span class="o">]</span> <span class="o">=</span> <span class="s2">&quot;</span><span class="si">#{</span><span class="n">category_dir</span><span class="si">}</span><span class="s2">/</span><span class="si">#{</span><span class="nb">name</span><span class="si">}</span><span class="s2">&quot;</span> <span class="k">if</span> <span class="n">render?</span></div><div class='line' id='LC129'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC130'><br/></div><div class='line' id='LC131'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC132'><br/></div><div class='line' id='LC133'>&nbsp;&nbsp;<span class="c1"># The Site class is a built-in Jekyll class with access to global site config information.</span></div><div class='line' id='LC134'>&nbsp;&nbsp;<span class="k">class</span> <span class="nc">Site</span></div><div class='line' id='LC135'><br/></div><div class='line' id='LC136'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Creates an instance of CategoryIndex for each category page, renders it, and</span></div><div class='line' id='LC137'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># writes the output to a file.</span></div><div class='line' id='LC138'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#</span></div><div class='line' id='LC139'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#  +category+ is the category currently being processed.</span></div><div class='line' id='LC140'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">write_category_index</span><span class="p">(</span><span class="n">category</span><span class="p">)</span></div><div class='line' id='LC141'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">target_dir</span> <span class="o">=</span> <span class="no">GenerateCategories</span><span class="o">.</span><span class="n">category_dir</span><span class="p">(</span><span class="nb">self</span><span class="o">.</span><span class="n">config</span><span class="o">[</span><span class="s1">&#39;category_dir&#39;</span><span class="o">]</span><span class="p">,</span> <span class="n">category</span><span class="p">)</span></div><div class='line' id='LC142'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">index</span>      <span class="o">=</span> <span class="no">CategoryIndex</span><span class="o">.</span><span class="n">new</span><span class="p">(</span><span class="nb">self</span><span class="p">,</span> <span class="nb">self</span><span class="o">.</span><span class="n">source</span><span class="p">,</span> <span class="n">target_dir</span><span class="p">,</span> <span class="n">category</span><span class="p">)</span></div><div class='line' id='LC143'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="n">index</span><span class="o">.</span><span class="n">render?</span></div><div class='line' id='LC144'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">index</span><span class="o">.</span><span class="n">render</span><span class="p">(</span><span class="nb">self</span><span class="o">.</span><span class="n">layouts</span><span class="p">,</span> <span class="n">site_payload</span><span class="p">)</span></div><div class='line' id='LC145'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">index</span><span class="o">.</span><span class="n">write</span><span class="p">(</span><span class="nb">self</span><span class="o">.</span><span class="n">dest</span><span class="p">)</span></div><div class='line' id='LC146'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Record the fact that this pages has been added, otherwise Site::cleanup will remove it.</span></div><div class='line' id='LC147'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">self</span><span class="o">.</span><span class="n">pages</span> <span class="o">&lt;&lt;</span> <span class="n">index</span></div><div class='line' id='LC148'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC149'><br/></div><div class='line' id='LC150'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Create an Atom-feed for each index.</span></div><div class='line' id='LC151'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">feed</span> <span class="o">=</span> <span class="no">CategoryFeed</span><span class="o">.</span><span class="n">new</span><span class="p">(</span><span class="nb">self</span><span class="p">,</span> <span class="nb">self</span><span class="o">.</span><span class="n">source</span><span class="p">,</span> <span class="n">target_dir</span><span class="p">,</span> <span class="n">category</span><span class="p">)</span></div><div class='line' id='LC152'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="n">feed</span><span class="o">.</span><span class="n">render?</span></div><div class='line' id='LC153'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">feed</span><span class="o">.</span><span class="n">render</span><span class="p">(</span><span class="nb">self</span><span class="o">.</span><span class="n">layouts</span><span class="p">,</span> <span class="n">site_payload</span><span class="p">)</span></div><div class='line' id='LC154'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">feed</span><span class="o">.</span><span class="n">write</span><span class="p">(</span><span class="nb">self</span><span class="o">.</span><span class="n">dest</span><span class="p">)</span></div><div class='line' id='LC155'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Record the fact that this pages has been added, otherwise Site::cleanup will remove it.</span></div><div class='line' id='LC156'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">self</span><span class="o">.</span><span class="n">pages</span> <span class="o">&lt;&lt;</span> <span class="n">feed</span></div><div class='line' id='LC157'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC158'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC159'><br/></div><div class='line' id='LC160'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Loops through the list of category pages and processes each one.</span></div><div class='line' id='LC161'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">write_category_indexes</span></div><div class='line' id='LC162'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="nb">self</span><span class="o">.</span><span class="n">layouts</span><span class="o">.</span><span class="n">key?</span> <span class="s1">&#39;category_index&#39;</span></div><div class='line' id='LC163'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">self</span><span class="o">.</span><span class="n">categories</span><span class="o">.</span><span class="n">keys</span><span class="o">.</span><span class="n">each</span> <span class="k">do</span> <span class="o">|</span><span class="n">category</span><span class="o">|</span></div><div class='line' id='LC164'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">self</span><span class="o">.</span><span class="n">write_category_index</span><span class="p">(</span><span class="n">category</span><span class="p">)</span></div><div class='line' id='LC165'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC166'><br/></div><div class='line' id='LC167'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Throw an exception if the layout couldn&#39;t be found.</span></div><div class='line' id='LC168'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span></div><div class='line' id='LC169'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kp">throw</span> <span class="s2">&quot;No &#39;category_index&#39; layout found.&quot;</span></div><div class='line' id='LC170'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC171'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC172'><br/></div><div class='line' id='LC173'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC174'><br/></div><div class='line' id='LC175'><br/></div><div class='line' id='LC176'>&nbsp;&nbsp;<span class="c1"># Jekyll hook - the generate method is called by jekyll, and generates all of the category pages.</span></div><div class='line' id='LC177'>&nbsp;&nbsp;<span class="k">class</span> <span class="nc">GenerateCategories</span> <span class="o">&lt;</span> <span class="no">Generator</span></div><div class='line' id='LC178'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">safe</span> <span class="kp">true</span></div><div class='line' id='LC179'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">priority</span> <span class="ss">:low</span></div><div class='line' id='LC180'><br/></div><div class='line' id='LC181'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="no">CATEGORY_DIR</span> <span class="o">=</span> <span class="s1">&#39;categories&#39;</span></div><div class='line' id='LC182'><br/></div><div class='line' id='LC183'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">generate</span><span class="p">(</span><span class="n">site</span><span class="p">)</span></div><div class='line' id='LC184'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">site</span><span class="o">.</span><span class="n">write_category_indexes</span></div><div class='line' id='LC185'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC186'><br/></div><div class='line' id='LC187'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Processes the given dir and removes leading and trailing slashes. Falls</span></div><div class='line' id='LC188'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># back on the default if no dir is provided.</span></div><div class='line' id='LC189'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nc">self</span><span class="o">.</span><span class="nf">category_dir</span><span class="p">(</span><span class="n">base_dir</span><span class="p">,</span> <span class="n">category</span><span class="p">)</span></div><div class='line' id='LC190'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">base_dir</span> <span class="o">=</span> <span class="p">(</span><span class="n">base_dir</span> <span class="o">||</span> <span class="no">CATEGORY_DIR</span><span class="p">)</span><span class="o">.</span><span class="n">gsub</span><span class="p">(</span><span class="sr">/^\/*(.*)\/*$/</span><span class="p">,</span> <span class="s1">&#39;\1&#39;</span><span class="p">)</span></div><div class='line' id='LC191'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">category</span> <span class="o">=</span> <span class="n">category</span><span class="o">.</span><span class="n">gsub</span><span class="p">(</span><span class="sr">/_|\P{Word}/</span><span class="p">,</span> <span class="s1">&#39;-&#39;</span><span class="p">)</span><span class="o">.</span><span class="n">gsub</span><span class="p">(</span><span class="sr">/-{2,}/</span><span class="p">,</span> <span class="s1">&#39;-&#39;</span><span class="p">)</span><span class="o">.</span><span class="n">downcase</span></div><div class='line' id='LC192'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="no">File</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="n">base_dir</span><span class="p">,</span> <span class="n">category</span><span class="p">)</span></div><div class='line' id='LC193'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC194'><br/></div><div class='line' id='LC195'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC196'><br/></div><div class='line' id='LC197'><br/></div><div class='line' id='LC198'>&nbsp;&nbsp;<span class="c1"># Adds some extra filters used during the category creation process.</span></div><div class='line' id='LC199'>&nbsp;&nbsp;<span class="k">module</span> <span class="nn">Filters</span></div><div class='line' id='LC200'><br/></div><div class='line' id='LC201'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Outputs a list of categories as comma-separated &lt;a&gt; links. This is used</span></div><div class='line' id='LC202'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># to output the category list for each post on a category page.</span></div><div class='line' id='LC203'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#</span></div><div class='line' id='LC204'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#  +categories+ is the list of categories to format.</span></div><div class='line' id='LC205'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#</span></div><div class='line' id='LC206'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Returns string</span></div><div class='line' id='LC207'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">category_links</span><span class="p">(</span><span class="n">categories</span><span class="p">)</span></div><div class='line' id='LC208'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">base_dir</span> <span class="o">=</span> <span class="vi">@context</span><span class="o">.</span><span class="n">registers</span><span class="o">[</span><span class="ss">:site</span><span class="o">].</span><span class="n">config</span><span class="o">[</span><span class="s1">&#39;category_dir&#39;</span><span class="o">]</span></div><div class='line' id='LC209'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">categories</span> <span class="o">=</span> <span class="n">categories</span><span class="o">.</span><span class="n">sort!</span><span class="o">.</span><span class="n">map</span> <span class="k">do</span> <span class="o">|</span><span class="n">category</span><span class="o">|</span></div><div class='line' id='LC210'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">category_dir</span> <span class="o">=</span> <span class="no">GenerateCategories</span><span class="o">.</span><span class="n">category_dir</span><span class="p">(</span><span class="n">base_dir</span><span class="p">,</span> <span class="n">category</span><span class="p">)</span></div><div class='line' id='LC211'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Make sure the category directory begins with a slash.</span></div><div class='line' id='LC212'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">category_dir</span> <span class="o">=</span> <span class="s2">&quot;/</span><span class="si">#{</span><span class="n">category_dir</span><span class="si">}</span><span class="s2">&quot;</span> <span class="k">unless</span> <span class="n">category_dir</span> <span class="o">=~</span> <span class="sr">/^\//</span></div><div class='line' id='LC213'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;&lt;a class=&#39;category&#39; href=&#39;</span><span class="si">#{</span><span class="n">category_dir</span><span class="si">}</span><span class="s2">/&#39;&gt;</span><span class="si">#{</span><span class="n">category</span><span class="si">}</span><span class="s2">&lt;/a&gt;&quot;</span></div><div class='line' id='LC214'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC215'><br/></div><div class='line' id='LC216'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">case</span> <span class="n">categories</span><span class="o">.</span><span class="n">length</span></div><div class='line' id='LC217'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">when</span> <span class="mi">0</span></div><div class='line' id='LC218'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;&quot;</span></div><div class='line' id='LC219'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">when</span> <span class="mi">1</span></div><div class='line' id='LC220'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">categories</span><span class="o">[</span><span class="mi">0</span><span class="o">].</span><span class="n">to_s</span></div><div class='line' id='LC221'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span></div><div class='line' id='LC222'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">categories</span><span class="o">.</span><span class="n">join</span><span class="p">(</span><span class="s1">&#39;, &#39;</span><span class="p">)</span></div><div class='line' id='LC223'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC224'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC225'><br/></div><div class='line' id='LC226'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Outputs the post.date as formatted html, with hooks for CSS styling.</span></div><div class='line' id='LC227'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#</span></div><div class='line' id='LC228'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#  +date+ is the date object to format as HTML.</span></div><div class='line' id='LC229'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#</span></div><div class='line' id='LC230'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Returns string</span></div><div class='line' id='LC231'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">date_to_html_string</span><span class="p">(</span><span class="n">date</span><span class="p">)</span></div><div class='line' id='LC232'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">result</span> <span class="o">=</span> <span class="s1">&#39;&lt;span class=&quot;month&quot;&gt;&#39;</span> <span class="o">+</span> <span class="n">date</span><span class="o">.</span><span class="n">strftime</span><span class="p">(</span><span class="s1">&#39;%b&#39;</span><span class="p">)</span><span class="o">.</span><span class="n">upcase</span> <span class="o">+</span> <span class="s1">&#39;&lt;/span&gt; &#39;</span></div><div class='line' id='LC233'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">result</span> <span class="o">+=</span> <span class="n">date</span><span class="o">.</span><span class="n">strftime</span><span class="p">(</span><span class="s1">&#39;&lt;span class=&quot;day&quot;&gt;%d&lt;/span&gt; &#39;</span><span class="p">)</span></div><div class='line' id='LC234'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">result</span> <span class="o">+=</span> <span class="n">date</span><span class="o">.</span><span class="n">strftime</span><span class="p">(</span><span class="s1">&#39;&lt;span class=&quot;year&quot;&gt;%Y&lt;/span&gt; &#39;</span><span class="p">)</span></div><div class='line' id='LC235'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">result</span></div><div class='line' id='LC236'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC237'><br/></div><div class='line' id='LC238'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC239'><br/></div><div class='line' id='LC240'><span class="k">end</span></div></pre></div>
          </td>
        </tr>
      </table>
  </div>

          </div>
        </div>

        <a href="#jump-to-line" rel="facebox" data-hotkey="l" class="js-jump-to-line" style="display:none">Jump to Line</a>
        <div id="jump-to-line" style="display:none">
          <h2>Jump to Line</h2>
          <form accept-charset="UTF-8" class="js-jump-to-line-form">
            <input class="textfield js-jump-to-line-field" type="text">
            <div class="full-button">
              <button type="submit" class="button">Go</button>
            </div>
          </form>
        </div>

      </div>
    </div>
</div>

<div id="js-frame-loading-template" class="frame frame-loading large-loading-area" style="display:none;">
  <img class="js-frame-loading-spinner" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-128.gif?1347543529" height="64" width="64">
</div>


        </div>
      </div>
      <div class="context-overlay"></div>
    </div>

      <div id="footer-push"></div><!-- hack for sticky footer -->
    </div><!-- end of wrapper - hack for sticky footer -->

      <!-- footer -->
      <div id="footer">
  <div class="container clearfix">

      <dl class="footer_nav">
        <dt>GitHub</dt>
        <dd><a href="https://github.com/about">About us</a></dd>
        <dd><a href="https://github.com/blog">Blog</a></dd>
        <dd><a href="https://github.com/contact">Contact &amp; support</a></dd>
        <dd><a href="http://enterprise.github.com/">GitHub Enterprise</a></dd>
        <dd><a href="http://status.github.com/">Site status</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>Applications</dt>
        <dd><a href="http://mac.github.com/">GitHub for Mac</a></dd>
        <dd><a href="http://windows.github.com/">GitHub for Windows</a></dd>
        <dd><a href="http://eclipse.github.com/">GitHub for Eclipse</a></dd>
        <dd><a href="http://mobile.github.com/">GitHub mobile apps</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>Services</dt>
        <dd><a href="http://get.gaug.es/">Gauges: Web analytics</a></dd>
        <dd><a href="http://speakerdeck.com">Speaker Deck: Presentations</a></dd>
        <dd><a href="https://gist.github.com">Gist: Code snippets</a></dd>
        <dd><a href="http://jobs.github.com/">Job board</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>Documentation</dt>
        <dd><a href="http://help.github.com/">GitHub Help</a></dd>
        <dd><a href="http://developer.github.com/">Developer API</a></dd>
        <dd><a href="http://github.github.com/github-flavored-markdown/">GitHub Flavored Markdown</a></dd>
        <dd><a href="http://pages.github.com/">GitHub Pages</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>More</dt>
        <dd><a href="http://training.github.com/">Training</a></dd>
        <dd><a href="https://github.com/edu">Students &amp; teachers</a></dd>
        <dd><a href="http://shop.github.com">The Shop</a></dd>
        <dd><a href="/plans">Plans &amp; pricing</a></dd>
        <dd><a href="http://octodex.github.com/">The Octodex</a></dd>
      </dl>

      <hr class="footer-divider">


    <p class="right">&copy; 2013 <span title="0.06995s from fe13.rs.github.com">GitHub</span> Inc. All rights reserved.</p>
    <a class="left" href="https://github.com/">
      <span class="mega-icon mega-icon-invertocat"></span>
    </a>
    <ul id="legal">
        <li><a href="https://github.com/site/terms">Terms of Service</a></li>
        <li><a href="https://github.com/site/privacy">Privacy</a></li>
        <li><a href="https://github.com/security">Security</a></li>
    </ul>

  </div><!-- /.container -->

</div><!-- /.#footer -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-fullscreen-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="js-fullscreen-contents" placeholder="" data-suggester="fullscreen_suggester"></textarea>
          <div class="suggester-container">
              <div class="suggester fullscreen-suggester js-navigation-container" id="fullscreen_suggester"
                 data-url="/recurser/jekyll-plugins/suggestions/commit/2ce22ae621fb6fe30d038d60dd71d8047c541155">
              </div>
          </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped leftwards" title="Exit Zen Mode">
      <span class="mega-icon mega-icon-normalscreen"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped leftwards"
      title="Switch themes">
      <span class="mini-icon mini-icon-brightness"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="mini-icon mini-icon-exclamation"></span>
      Something went wrong with that request. Please try again.
      <a href="#" class="mini-icon mini-icon-remove-close ajax-error-dismiss"></a>
    </div>

    
    
    <span id='server_response_time' data-time='0.07052' data-host='fe13'></span>
    
  </body>
</html>

