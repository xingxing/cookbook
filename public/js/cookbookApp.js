var cookbookApp = angular.module('cookbookApp', ["ngRoute", "cookbookController"]);

cookbookApp.config(["$routeProvider", function($routeProvider){
    $routeProvider.
        when("/cookbooks",{
            templateUrl: 'partials/cookbook-list.html',
            controller: 'cookbookListCrl'
        }).
        when("/cookbooks/new",{
            templateUrl: 'partials/cookbook-form.html',
            controller:  'cookbookNewCrl'
        }).
        when("/cookbooks/:cookbookId", {
            templateUrl: 'partials/cookbook-detail.html',
            controller: 'cookbookDetailCrl'
        }).
        when("/cookbooks/:cookbookId/edit",{
            templateUrl: 'partials/cookbook-form.html',
            controller: 'cookbookEditCrl'
        }).
        otherwise({
            redirectTo: '/cookbooks'
        });   
}]);
