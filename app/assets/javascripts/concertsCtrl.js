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
    $scope.toggleCalendarFilter = function(inputAttribute) {
      if (inputAttribute === 'myCalendar') {
        var calendarFilter = "{onMyCalendar:'true'}";
      } else {
        var calendarFilter = '{none}';
      }
    };
    $scope.changeOrderAttribute = function(inputAttribute) {
      if (inputAttribute === $scope.orderAttribute) {
        $scope.isOrderDescending = !$scope.isOrderDescending;
      } else {
        $scope.isOrderDescending = false;
      }
      $scope.orderAttribute = inputAttribute;
    };
    $scope.addReview = function(inputRating, inputDescription, inputUserId, inputVenueId) {
      var params = {
        rating: inputRating,
        description: inputDescription,
        userId: inputUserId,
        venueId: inputVenueId
      };
    $http.post('/api/v1/reviews', params).then(function(response) {
      $scope.messages.push(response.data);
      $scope.newReviewDescription = '';
    });
  };
  });
})();