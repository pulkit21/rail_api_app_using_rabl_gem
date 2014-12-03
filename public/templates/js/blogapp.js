var blogApp = angular.module('Emangu', ['ngRoute','ngCookies','frontPageControllers','PostsListCtr']);

blogApp.config(function($routeProvider) {
    $routeProvider.
      when('/blog', {
         templateUrl: '/templates/posts/partials/blog.html',
         controller: 'PostsListCtr'
      }).
      when('/show',{
	     templateUrl: 'partials/show.html'
      }).
      when('/post',{
	     templateUrl: '/templates/posts/partials/post.html',
       controller: 'PostsListCtr'
      }).
      when('/about',{
	       templateUrl: 'partials/about.html'
      }).	
      when('/contact',{
	       templateUrl: 'partials/contact.html'
      }).
      when('/postdata',{
         templateUrl: 'partials/postdata.html',
         controller: 'PostsListCtr'
      }).	
      otherwise({
        redirectTo: '/blog'
      });
  });
