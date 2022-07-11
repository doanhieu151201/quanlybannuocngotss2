
app.controller('Danhmuc', ['$scope', 'CrudService',
    function ($scope, CrudService) {
        // Base Url   

        var baseUrl = '/Admin/Category/';
        $scope.btntxt = "Save";

        $scope.getct = function () {
            var apiRoute = baseUrl + 'GetCategory';
            var categori = CrudService.getAll(apiRoute);
            categori.then(function (response) {
                $scope.listLoaiSP = response.data;
            },
                function (error) {
                    console.log("Error: " + error);
                })
        };
        $scope.getct();
        $scope.Clear = function () {
            $scope.id = " ";
            $scope.TenDm = " ";
        }


        $scope.Savedt = function () {
            var st = {
                id: $scope.id,
                TenDm: $scope.TenDm,
            }
            if ($scope.btntxt == "Save") {
                var apiRoute = baseUrl + 'SaveLSP';
                var saveLSP = CrudService.post(apiRoute, st);
                saveLSP.then(function (response) {
                    if (response.data != "") {
                        alert("Data Save Successfully");
                        $scope.getct();
                        $scope.Clear();

                    } else {
                        alert("Some error");
                    }
                },
                    function (error) {
                        console.log("Error: " + error);
                    });
            }
            else {
                var apiRoute = baseUrl + 'UpdateLSP';
                var UpdateSV = CrudService.post(apiRoute, st);
                UpdateSV.then(function (response) {
                    if (response.data != "") {
                        alert("Data Update Successfully");
                        $scope.getct();
                        $scope.Clear();

                    } else {
                        alert("Some error");
                    }
                }, function (error) {
                    console.log("Error: " + error);

                })
            }
        }
        $scope.DeletteLSP = function (item) {
            if (!confirm("Bạn có muốn xóa loại sản phẩm: " + item.TenDm + " không?")) {
                return;
            }
            var apiRoute = baseUrl + 'DeleteLSP/';
            var deleLSP = CrudService.getbyID(apiRoute, item.id);
            deleLSP.then(function (response) {
                if (response.data != "") {
                    alert("Data Delete Successfully");
                    $scope.getct();
                    $scope.Clear();
                } else {
                    alert("Some error");
                }
            }, function (error) {
                console.log("Error: " + error);
            })
        },
            $scope.GetLSPID = function (dataModel) {
                //debugger
                var apiRoute = baseUrl + 'GetLSPID';
                var lsp = CrudService.getbyID(apiRoute, dataModel.id);
                lsp.then(function (response) {
                    $scope.id = response.data.data.id;
                    $scope.TenDm = response.data.data.TenDm;
                
                    $scope.btntxt = "Update";
                },
                    function (error) {
                        console.log("Error: " + error);
                    });
            },
            $scope.currentPage = 1;
        
       

    }]);
