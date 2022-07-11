var app = angular.module("CocaApp", []);
app.controller("SPCtrl", function ($scope,$http) {
    $scope.current_url = 'http://localhost:59292/';
    $scope.listAllData = {};
    
    $scope.listAllDatafanta = {};
    $scope.listAllDatasprite = {};


    $scope.LoadData = function () {
        $http({
            method: 'GET',
            url: 'http://localhost:59292/Page/Getcoca',
        }).then(function (response) {
            $scope.listAllData = response.data;
           
        });
    };
    $scope.LoadDatafanta = function () {
        $http({
            method: 'GET',
            url: 'http://localhost:59292/Page/Getfanta',
        }).then(function (response) {
            $scope.listAllDatafanta= response.data;

        });
    };
    $scope.LoadDatasprite = function () {
        $http({
            method: 'GET',
            url: 'http://localhost:59292/Page/Getsprite',
        }).then(function (response) {
            $scope.listAllDatasprite = response.data;

        });
    };












    $scope.addToCart = function (sp) {
        let item = {};
        item.Masp = sp.Masp;
        item.Ten = sp.Ten;
        item.Anh = sp.Anh;
        item.Gia = sp.Gia;
        item.quantity = 1;
        var list;
        if (localStorage.getItem('cart') == null) {
            list = [item];
        } else {
            list = JSON.parse(localStorage.getItem('cart')) || [];
            let ok = true;
            for (let x of list) {
                if (x.Masp == item.Masp) {
                    x.quantity += 1;
                    ok = false;
                    break;
                }
            }
            if (ok) {
                list.push(item);
            }
        }
        localStorage.setItem('cart', JSON.stringify(list));
        alert("Đã thêm giỏ hàng thành công");
    }
})