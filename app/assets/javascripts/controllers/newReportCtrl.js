angular.module('riskAnalyser.appControllers').controller('newReportCtrl',[
  '$scope',
  '$timeout',
  '$location',
  'sessionService',
  'xLSXReaderService',
  'reportsRsrc',
  function($scope, $timeout, $location ,sessionService, xLSXReaderService, reportsRsrc){
    'use strict';

    $scope.user = sessionService.requestCurrentUser();

    $scope.selectedSheet = null;
    $scope.sheets = null;
 
    $scope.fileChanged = function(files) {
      // $scope.sheets = [];
      $scope.excelFile = files[0];
      xLSXReaderService.readFile($scope.excelFile, true, function(xlsxData) {
        $timeout(function() {
          $scope.sheets = xlsxData;
        }, 500);
      });
    };

    $scope.onSubmit = function() {
      console.log($scope.selectedSheet);
      var ruts = [];
      for(var i = 0; i < $scope.selectedSheet.values.length; i++){
        for(var key in $scope.selectedSheet.values[i]){
          ruts.push($scope.selectedSheet.values[i][key]);
          break;
        }
      }

      reportsRsrc.create({
        report: {
          'ruts': ruts
        }
      }, function() {
        $location.path('/reports');
      });
    };
  }
]);

