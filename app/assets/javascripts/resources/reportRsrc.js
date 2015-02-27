'use strict';
angular.module('riskAnalyser.resources', ['ngResource'])
    .factory('reportsRsrc', function($resource) {
        return $resource('/api/report', {}, {
            create: { method: 'POST' },
            index: { method: 'GET', isArray:true }
        });
    })
    .factory('ReportRsrc', function($resource){
        return $resource('/api/report/:report_id.json', {}, {
            show: { method: 'GET' },
            update: { method: 'PUT' },
            destroy: { method: 'DELETE' }
        });
    });