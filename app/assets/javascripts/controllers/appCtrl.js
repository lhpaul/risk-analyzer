'use strict';
angular.module('riskAnalyser.appControllers').controller('appCtrl',[
  '$scope',
  function($scope) {
    $scope.$on('event:unauthorized', function(event) {
      console.log('unauthorized');
      console.log(event);
    });
    $scope.$on('event:authenticated', function(event) {
      console.log('authenticated');
      console.log(event);
    });

}]);