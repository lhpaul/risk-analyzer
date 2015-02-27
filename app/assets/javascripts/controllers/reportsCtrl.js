'use strict';
angular.module('riskAnalyser.appControllers').controller('reportsCtrl', [
  '$scope',
  '$location',
  '$interval',
  'sessionService',
  'reportsRsrc',
  function($scope, $location, $interval, sessionService, reportsRsrc) {
    var refresh_time = 3000; // tiempo para refrescar la informacion de los reportes

    $scope.user = sessionService.requestCurrentUser();
    $scope.reports = [];

    $scope.$on('$viewContentLoaded', function(){
      // esto es para que refresque la informacion de los reportes cada cierta cantidad de segundos
      // $interval(refreshInformation, refresh_time);
      refreshInformation();
    });

    $scope.newReportButtonClicked = function() {
      $location.path('/reports/new');
    };

    var refreshInformation = function(){
      $scope.reports = reportsRsrc.index({}, function(){
        console.log('reportes refrescados');
      });
    };
  }
]);