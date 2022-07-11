var app = angular.module("NuocngotApp", []);
app.controller("CheckOutCtrl", function ($scope, $http) {
    /*================== Danh sách các biến =================================== */
    /*Giỏ hàng*/


    /*Thanh toán*/
    $scope.listSPTT = [];
    $scope.total = 0;

    /*=================== Thao tác dữ liệu ==================================== */
    $scope.LoadCart = function () {
        $scope.listSP = JSON.parse(localStorage.getItem('cart'));
        //$scope.listSP.forEach(function (i) {
        //    $scope.total += $scope.listSP.quantity[i] * $scope.listSP.Gia[i];
        //    debugger;

        //});
        
    };
   

    /*Thanh toán*/
    $scope.LoadCartTT = function () {
        $scope.LoadCartTT();

        $scope.CreateHoaDon = function () {
            let Hoadon = {};
            Hoadon.Mahd = $('#Mahd').val();
            Hoadon.Hoten = $('#Hoten').val();
            Hoadon.DiaChi = $('#DiaChi').val();
            Hoadon.Ngaygui = $('#Ngaygui').val();
          
            Hoadon.Chitiethoadons = [];
            $scope.listSPTT.forEach(function (item, i) {
                Hoadon.Chitiethoadons.push({Masp: item.Masp,SoLuong: item.quantity });
            });
            $http({
                method: 'POST',
                url: "/Page/CreateHoaDon",
                datatype: 'json',
                data: JSON.stringify(Hoadon)
            }).then(function (response) {
                if (response.data.ok == 1) {
                    alert('Thêm thành công');
                }
                else {
                    alert('Có lỗi');
                }
            });
        };
    };
});