'use strict';
angular.module('riskAnalyser.resources', ['ngResource'])
    .factory('reportsRsrc', function($resource) {
        return $resource('/api/report', {}, {
            create: { method: 'POST' },
            index: { method: 'GET', isArray:true }
        });
    })
    .factory('reportRsrc', function($resource){
        return $resource('/api/report/:report_id.json', {}, {
            show: { method: 'GET' },
            update: { method: 'PUT' },
            delete: { method: 'DELETE' }
        });
    })
    .factory('reportSubjectsRsrc', function($resource){
        return $resource('/api/report/:report_id/subjects', {}, {
            get_all: { method: 'GET', isArray:true },
        });
    });