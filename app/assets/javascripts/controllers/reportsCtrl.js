/* global angular, $ */
'use strict';
angular.module('riskAnalyser.appControllers').controller('reportsCtrl', [
  '$scope',
  '$location',
  '$interval',
  'sessionService',
  'reportsRsrc',
  'reportRsrc',
  'reportSubjectsRsrc',
  function($scope, $location, $interval, sessionService, reportsRsrc, reportRsrc, reportSubjectsRsrc) {
    var refresh_time = 10000; // tiempo para refrescar la informacion de los reportes

    $scope.user = sessionService.requestCurrentUser();
    $scope.reports = [];

    $scope.$on('$viewContentLoaded', function(){
      // esto es para que refresque la informacion de los reportes cada cierta cantidad de segundos
      // $interval(_refreshInformation, refresh_time);
      _refreshInformation();
    });

    var _refreshInformation = function(){
      var new_reports = reportsRsrc.index({}, function(){
        console.log('reportes refrescados');
        // console.log(new_reports);
        $scope.reports = new_reports;
      });
    };

    var _filterSubjectsForExcel = function(subjects){
      var output = [];
      for(var i = 0; i < subjects.length; i++){
        output.push({
          Nombre: subjects[i].name,
          Rut: subjects[i].rut,
          Otro: 'Algo mas'
        });
      }
      return output;
    };

    $scope.newReportButtonClicked = function() {
      $location.path('/reports/new');
    };

    // $scope.viewReportButtonClicked = function(id) {
    //   $location.path('/report/'+id);
    // };

    $scope.deleteReportButtonClicked = function(id, index) {
      var modalElement = $('#deleteModal');
      modalElement.attr('report-id', id);
      modalElement.attr('report-index', index);
      modalElement.modal('show');
    };

    $scope.deleteReport = function() {
      var modalElement = $('#deleteModal');
      var reportId = modalElement.attr('report-id');
      var index = modalElement.attr('report-index');
      reportRsrc.delete({report_id: reportId}, function(){
        console.log('llega');
        $scope.reports.splice(index, 1); // sacar el lemento del arreglo
      });
    };

    $scope.downloadReportButtonClicked = function(id, reportName) {
      var element = $('#report_' + id);
      element.html('<span class="icon icon-refresh glyphicon-refresh-animate"></span>Cargando');
      reportSubjectsRsrc.get_all({report_id: id}, function(subjects){
        element.html('Descargar');
        alasql('SELECT * INTO XLSX("'+ reportName +'.xlsx",{headers:true}) FROM ?',[_filterSubjectsForExcel(subjects)]);
      });
      // $location.path('/report/'+id);
    };

  }
]);