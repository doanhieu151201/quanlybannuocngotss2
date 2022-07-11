var app = angular.module('DanhmucApp', []);

app.controller("TintucCtrl", function ($scope, $http) {
    /*================== Danh sách các biến =================================== */
    $scope.listTintuc = [];
    $scope.Item;
    $scope.LoadLoaiTintuc = function () {
        $http({
            method: 'GET',
            url: 'http://localhost:59292/Tintuc/GetTT',
        }).then(function (response) {
            $scope.listTintuc = response.data;
        });
    };

    $scope.Xoa = function (item) {
        if (!confirm("Bạn có muốn xóa Tin tức: " + item.Tentt + " không?")) {
            return;
        }
        $http({
            method: 'POST',
            url: 'http://localhost:59292/Tintuc/DeleteTT',
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
    $scope.AddTintuc = function () {

        var tt = {
        }
        tt.Matt = $scope.Matt;
        tt.Tentt = $scope.Tentt;
        tt.Noidung = $scope.Noidung;
        

        var file = document.getElementById('file').files[0];

        if ($scope.btntxt = "Thêm mới") {

            if (file) {
                const formData = new FormData();
                formData.append('file', file);
                $http({
                    method: 'POST',
                    headers: {
                        'Content-Type': undefined
                    },
                    data: formData,
                    url: 'http://localhost:59292/Tintuc/Upload',
                }).then(function (res) {
                    tt.Anh = res.data;
                    $http({
                        method: 'POST',
                        url: 'http://localhost:59292/Tintuc/AddTT',
                        datatype: 'json',
                        data: JSON.stringify(tt)
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
                    url: 'http://localhost:59292/Tintuc/AddTT',
                    datatype: 'json',
                    data: JSON.stringify(tt)
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
                    url: 'http://localhost:59292/Tintuc/Upload',
                }).then(function (res) {
                    tt.Anh = res.data;
                    $http({
                        method: 'POST',
                        url: 'http://localhost:59292/Tintuc/UpdateTT',
                        datatype: 'json',
                        data: JSON.stringify(tt)
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
                tt.Anh = $scope.Item.Anh;
                $http({
                    method: 'POST',
                    url: 'http://localhost:59292/Tintuc/UpdateTT',
                    datatype: 'json',
                    data: JSON.stringify(tt)
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
            url: 'http://localhost:59292/Tintuc/GetTTID/?Matt=' + item,
        }).then(function (response) {

            $scope.Matt = response.data.data.Matt;
            $scope.Anh = response.data.data.Anh;
            $scope.Tentt = response.data.data.Tentt;
            $scope.Noidung = response.data.data.Noidung;
           

        });
    };
});














































