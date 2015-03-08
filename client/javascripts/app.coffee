app = angular.module('app', [
    'app.controllers'
    'app.directives'
    'app.services'
])

angular.module 'app.controllers', []

angular.module 'app.directives', []

angular.module 'app.services', []

app.config [
    '$routeProvider'
    '$locationProvider'
    '$translateProvider'
    ($routeProvider, $locationProvider, $translateProvider) ->

    $locationProvider.html5Mode true

    $routeProvider

    .when('/',
      templateUrl: 'partials/patientDetails'
      controller: 'PatientDetailsCtrl')

    .otherwise redirectTo: '/'

    # I18N
    $translateProvider.preferredLanguage 'de-DE'
    $translateProvider.useStaticFilesLoader
      prefix: 'static/languages/'
      suffix: '.json'
]
