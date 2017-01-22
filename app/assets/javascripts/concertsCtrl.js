(function() {
  "use strict";

  angular.module("app").controller('concertsCtrl', function($scope, $http) {
    $scope.setup = function() {
      $http.get('api/v1/concerts').then(function(response) {
        $scope.concerts = response.data;
        $scope.orderAttribute = 'date';
        $scope.isOrderDescending = false;
      });
    };
    $scope.changeOrderAttribute = function(inputAttribute) {
      if (inputAttribute === $scope.orderAttribute) {
        $scope.isOrderDescending = !$scope.isOrderDescending;
      } else {
        $scope.isOrderDescending = false;
      }
      $scope.orderAttribute = inputAttribute;
    };
  }
  );
})();