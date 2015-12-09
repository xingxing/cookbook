angular.module('cookbook', [])
    .controller('CookbookListCtrl', function() {
        var cookbookList = this;

        cookbookList.cookbooks = [
            { "name": "鱼香肉丝" , "tags": ["川菜", "微辣"], "description": "第一步鱼香", "image_url": "http://img01.3dmgame.com/uploads/allimg/150718/271_150718062452_1_lit.jpg"  }
            
        ];

        cookbookList.materials = [
            {"name": "猪肉"},
            {"name": "胡萝卜"},
            {"name": "青椒"},
            {"name": "白糖"},
            {"name": "盐"}
        ];

        
        cookbookList.seachCookbooks = function(){
            alert("s");
        };
        
        

    });

