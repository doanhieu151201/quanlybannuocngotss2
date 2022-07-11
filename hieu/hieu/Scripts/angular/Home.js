

var app = angular.module("NuocngotApp", []);

app.controller("HomeCtrl", function ($scope, $http,) {
    /*================== Danh sách các biến =================================== */
    $scope.current_url = 'http://localhost:59292/';
    $scope.listAllData = {};
    $scope.listAllDataNhieu = {};

    $scope.LoadData = function () {
        $http({
            method: 'GET',
            url: 'http://localhost:59292/Home/AjaxHome',
        }).then(function (response) {
            $scope.listAllData = response.data;
        });
    };

    $scope.LoadDataNhieu = function () {
        $http({
            method: 'GET',
            url: 'http://localhost:59292/Home/GetSPNhieu',
        }).then(function (response) {
            $scope.listAllDataNhieu = response.data;
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