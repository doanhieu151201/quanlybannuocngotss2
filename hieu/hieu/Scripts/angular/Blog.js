

var app = angular.module("NuocngotApp", []);

app.controller("BlogCtrl", function ($scope, $http,) {
    $scope.listAllData = {};

    $scope.LoadData1 = function () {
        $http({
            method: 'GET',
            url: 'http://localhost:59292/Home/Blog',
        }).then(function (response) {
            $scope.listAllData = response.data;
        });
    };

});

