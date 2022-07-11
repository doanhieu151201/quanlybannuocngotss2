var app = angular.module('DanhmucApp', []);

app.controller("SanPhamCtrl", function ($scope, $http) {
    /*================== Danh sách các biến =================================== */
    $scope.listLoaiSP = [];
    $scope.Item;
    $scope.btntxt = "Thêm mới";

    $scope.LoadLoaiSP = function () {
        $http({
            method: 'GET',
            url: 'http://localhost:59292/SP/GetSP',
        }).then(function (response) {
            $scope.listLoaiSP = response.data;
        });
    };
   

    $scope.Xoa = function (item) {
        if (!confirm("Bạn có muốn xóa loại sản phẩm: " + item.Ten + " không?")) {
            return;
        }
        $http({
            method: 'POST',
            url: 'http://localhost:59292/SP/DeleteSP',
            datatype: 'json',
            data: JSON.stringify(item)
        }).then(function (response) {
            if (response.data == 1) {
                alert('Xóa thành công');
                location.reload();
            }
            else {
                alert('Xóa thành công');
            }
        });
    };
   
    $scope.AddSanPham = function () {

        var sp = {
        }
        sp.Masp = $scope.Masp;
        sp.Ten = $scope.Ten;
        sp.Gia = $scope.Gia;
        sp.Loai = $scope.Loai;
       
        var file = document.getElementById('file').files[0];//lấy ảnh thông qua id

        if ($scope.btntxt == "Thêm mới") {

            if (file) {
                const formData = new FormData();
                formData.append('file', file);//Thêm ảnh vào
                $http({
                    method: 'POST',
                    headers: {
                        'Content-Type': undefined
                    },
                    data: formData,
                    url: 'http://localhost:59292/SP/Upload',
                }).then(function (res) {
                    sp.Anh = res.data;
                    $http({
                        method: 'POST',
                        url: 'http://localhost:59292/SP/AddSanPham',
                        datatype: 'json',
                        data: JSON.stringify(sp)
                    }).then(function (response) {
                        if (response.data == 1) {
                            alert('Thêm thành công');
                            location.reload();
                        }
                        else {
                            alert('Thêm thành công');

                        }
                    });
                });
            } else {
                $http({
                    method: 'POST',
                    url: 'http://localhost:59292/SP/AddSanPham',
                    datatype: 'json',
                    data: JSON.stringify(sp)
                }).then(function (response) {
                    if (response.data.res == 1) {
                        alert('Thêm thành công');
                        location.reload();
                    }
                    else {
                        alert('có lỗi');
                    }
                });
            }
        } else {
            if (file) {
                const formData = new FormData();
                formData.append('file', file);
                $http({
                    method: 'POST',
                    headers: {
                        'Content-Type': undefined
                    },
                    data: formData,
                    url: 'http://localhost:59292/SP/Upload',
                }).then(function (res) {
                    sp.Anh = res.data;
                    $http({
                        method: 'POST',
                        url: 'http://localhost:59292/SP/UpdateSanPham',
                        datatype: 'json',
                        data: JSON.stringify(sp)
                    }).then(function (response) {
                        if (response.data == 1) {
                            alert('Cập nhật thành công');
                            location.reload();
                        }
                        else {
                            alert('Có lỗi');
                        }
                    });
                });
            } else {
                sp.Anh = $scope.Item.Anh;
                $http({
                    method: 'POST',
                    url: 'http://localhost:59292/SP/UpdateSanPham',
                    datatype: 'json',
                    data: JSON.stringify(sp)
                }).then(function (response) {
                    if (response.data == 1) {
                        alert('Cập nhật thành công');
                        location.reload();
                    }
                    else {
                        alert('Có lỗi');
                    }
                });
            }
        }

    };
    $scope.GetSPid = function (item) {
        $scope.btntxt = "Sửa"
        $http({
            method: 'GET',
            url: 'http://localhost:59292/SP/GetSPID/?Masp=' + item,
        }).then(function (response) {
            $scope.Masp = response.data.data.Masp;
            $scope.Anh = response.data.data.Anh;
            $scope.Ten = response.data.data.Ten;
            $scope.Gia = response.data.data.Gia;
            $scope.Loai = response.data.data.Loai;
           
        });
    };

});














































