var cookbookController = angular.module("cookbookController", []);

cookbookController.controller("cookbookListCrl",
                              ['$scope', '$http',
                               function($scope, $http){
                                   $http.get("/cookbooks.json").success(function(data){
                                       $scope.cookbooks = data.data ;
                                       $scope.paginate  = data.paginate;
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


cookbookController.controller("cookbookNewCrl",
                              ["$scope", '$http',
                               function($scope, $http){
                                   $http.get("/materials").success(function(data){ $scope.materials = data });
                               }]
                             );





// cookbookController.controller("cookbookEditCrl"
//                               ["$scope", '$ttp', '$routeParams',
//                                function($scope, $http, $routeParams){
                                   
//                                }
//                               ]
//                              );
