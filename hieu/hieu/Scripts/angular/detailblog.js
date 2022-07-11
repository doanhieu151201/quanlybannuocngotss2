app.controller("DBlogCtrl", function ($scope, $http) {
    /*================== Danh sách các biến =================================== */
    $scope.DBlog = {};

    /*=================== Thao tác dữ liệu ==================================== */
    $scope.LoadData = function (Matt) {
        $http({
            method: 'GET',
            url: 'http://localhost:59292/Page/GetchitietBlog/?Matt=' + Matt,
        }).then(function (response) {
            $scope.DBlog = response.data;
        });
    };
});