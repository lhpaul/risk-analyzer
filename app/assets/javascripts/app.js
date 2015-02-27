'use strict';
angular.module('riskAnalyser', [
  'ngRoute',
  'riskAnalyser.resources',
  'riskAnalyser.appServices',
  'riskAnalyser.appControllers',
  'riskAnalyser.appInterceptors'
  ])
  .config(['$routeProvider', function($routeProvider){
    $routeProvider
      .when('/', {templateUrl:'/home/index.html'})
      .when('/reports', {templateUrl:'/report/index.html', controller:'reportsCtrl'})
      .when('/reports/new', {templateUrl:'/report/new.html', controller:'newReportCtrl'})
      .when('/users/login', {templateUrl:'/users/login.html', controller:'usersCtrl'})
      .when('/users/register', {templateUrl:'/users/register.html', controller:'usersCtrl'})
      .otherwise({ redirectTo: '/' });
  }])
  .config([ '$httpProvider', function($httpProvider) {
    $httpProvider.interceptors.push('apiInterceptor');
  }]);