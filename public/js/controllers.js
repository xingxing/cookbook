var cookbookController = angular.module("cookbookController", []);

cookbookController.controller("cookbookListCrl",
                              ['$scope', '$http',
                               function($scope, $http){
                                   $http.get("/cookbooks.json").success(function(data){
                                       $scope.cookbooks = data ;
                                   });

                               } ]);

cookbookController.controller("cookbookDetailCrl",
                              ["$scope", '$http', '$routeParams',
                               function($scope, $http, $routeParams){
                                   $http.get("/cookbooks/" + $routeParams.cookbookId).success(function(data){
                                       $scope.cookbook = data ;
                                   });
                               }]
                             );
