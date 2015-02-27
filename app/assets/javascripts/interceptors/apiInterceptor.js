'use strict';
angular.module('riskAnalyser.appInterceptors').factory('apiInterceptor',[
  '$location',
  '$rootScope',
  '$q',
  function($location, $rootScope, $q) {
    return {

      'response': function(response) {
        return response;
      },

      'responseError': function(response) {
        if (response.status == 401) {
            $rootScope.$broadcast('event:unauthorized');
            $location.path('/users/login');
            return response;
        }
        return $q.reject(response);
      }
    };
  }
]);

