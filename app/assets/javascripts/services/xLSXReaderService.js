/* global  XLSXReader */
'use strict';
angular.module('riskAnalyser.appServices')
.factory('xLSXReaderService', [
  function() {
    var service = function(data) {
      angular.extend(this, data);
    };

    service.readFile = function(file, showPreview, handler) {
      new XLSXReader(file, showPreview, true, function(data){
        var result = [];
        for (var sheet in data.sheets){
          var obj = {
            name: sheet,
            values:  data.sheets[sheet]
          };
          result.push(obj);
        }
        handler(result);
      });
    };

    return service;
  }
]);