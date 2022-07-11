var app = angular.module("NuocngotApp", []);
app.controller("CartCtrl", function ($scope) {
    $scope.listSP = [];
    /*=================== Thao tác dữ liệu ==================================== */
    $scope.LoadCart = function () {
        $scope.listSP = JSON.parse(localStorage.getItem('cart'));
       
    };
    $scope.LoadCart();


    $scope.Tang = function (item) {
        var index = $scope.listSP.indexOf(item);
        if (index >= 0) {
            $scope.listSP[index].quantity += 1;
        }
        localStorage.setItem('cart', JSON.stringify($scope.listSP));
    }

    $scope.Giam = function (item) {
        var index = $scope.listSP.indexOf(item);
        if (index >= 0 && $scope.listSP[index].quantity >= 2) {
            $scope.listSP[index].quantity -= 1;
        }
        localStorage.setItem('cart', JSON.stringify($scope.listSP));
    }

    $scope.Xoa = function (item) {
        var index = $scope.listSP.indexOf(item);
        $scope.listSP.splice(index, 1);
        localStorage.setItem('cart', JSON.stringify($scope.listSP));
        alert("Đã xóa sản phẩm thành công");
    }
    $scope.TTong = function () {
        var x = 0;
        for (var i = 0; i < $scope.listSP.length; i++) {
            x += $scope.listSP[i].quantity * $scope.listSP[i].Gia;
        }
        $('#sum').text(x);
    }
    $scope.TTong();

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
                Hoadon.Chitiethoadons.push({ Masp: item.Masp, SoLuong: item.quantity });
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