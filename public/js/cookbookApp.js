var cookbookApp = angular.module('cookbookApp', ["ngRoute", "cookbookController"]);

cookbookApp.config(["$routeProvider", function($routeProvider){
    $routeProvider.
        when("/cookbooks",{
            templateUrl: 'partials/cookbook-list.html',
            controller: 'cookbookListCrl'
        }).
        when("/cookbooks/:cookbookId", {
            templateUrl: 'partials/cookbook-detail.html',
            controller: 'cookbookDetailCrl'
        }).
        otherwise({
            redirectTo: '/cookbooks'
        });   
}]);
