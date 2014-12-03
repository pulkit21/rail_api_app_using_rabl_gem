var frontPageControllers = angular.module('frontPageControllers', ['ngAnimate']);
frontPageControllers.directive('script', function() {
    return {
      restrict: 'E',
      scope: false,
      link: function(scope, elem, attr) 
      {
        if (attr.type==='text/javascript-lazy') 
        {
          var s = document.createElement("script");
          s.type = "text/javascript";                
          var src = elem.attr('src');
          if(src!==undefined)
          {
              s.src = src;
          }
          else
          {
              var code = elem.text();
              s.text = code;
          }
          document.head.appendChild(s);
          elem.remove();
        }
      }
    };
  });
frontPageControllers.directive('ckEditor', function() {
  return {
    require: '?ngModel',
    link: function(scope, elm, attr, ngModel) {
      var ck = CKEDITOR.replace(elm[0]);

      if (!ngModel) return;

      ck.on('pasteState', function() {
        scope.$apply(function() {
          ngModel.$setViewValue(ck.getData());
        });
      });

      ngModel.$render = function(value) {
        ck.setData(ngModel.$viewValue);
      };
    }
  };
});
frontPageControllers.controller('frontPageControllers', ['$scope','$route', function($scope,$route) {   
    $route.reload();
}]);

var blogApp =angular.module('PostsListCtr',[]);
blogApp.controller('PostsListCtr',['$scope','$location', function($scope,$location) {

  $scope.posts =[ 
    {
        title: "John",
        subject: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore, veritatis, tempora, necessitatibus inventore nisi quam quia repellat ut tempore laborum possimus eum dicta id animi corrupti debitis ipsum officiis rerum."
    },
    {
        title: "karthik",
        subject: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore, veritatis, tempora, necessitatibus inventore nisi quam quia repellat ut tempore laborum possimus eum dicta id animi corrupti debitis ipsum officiis rerum."
    },
    {
        title: "deepak",
        subject: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore, veritatis, tempora, necessitatibus inventore nisi quam quia repellat ut tempore laborum possimus eum dicta id animi corrupti debitis ipsum officiis rerum."
    }
  ]; 
  $scope.title="";
  $scope.subject="";
  $scope.submit=function(){
    alert($scope.title);
    alert($scope.subject);
   // $scope.posts.push({
   // 'title':$scope.title,
   //   'subject':$scope.subject
    $location.path('/postdata');
  //});
   //alert($scope.posts);
  };
}]);