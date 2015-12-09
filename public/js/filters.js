var cookbookFilter = angular.module("cookbookFilter", []);

cookbookFilter.filter('cb_tags',
                      function(){
                          return function(tags) {
                              return tags.join("-");
                          };
});
