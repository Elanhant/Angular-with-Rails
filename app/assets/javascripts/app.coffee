receta = angular.module('receta', [
	'templates',
	'ngRoute',
	'controllers'
])

receta.config([ '$routeProvider', 
	($routeProvider)->
		$routeProvider
			.when('/',
				templateUrl: "index.html"
				controller: 'RecipesController'
			)
])

recipes = [
	{
		id: 1,
		name: 'Baked Potato w/ Cheese'
	},
	{
		id: 1,
		name: 'Garlic Mashed Potatoes'
	},
	{
		id: 1,
		name: 'Potatoes Au Gratin'
	},
	{
		id: 1,
		name: 'Baked Brussel Sprouts'
	},
]

controllers = angular.module('controllers', [])
controllers.controller("RecipesController", [ '$scope', '$routeParams', '$location',
	($scope, $routeParams, $location)->
		$scope.search = (keywords)-> $location.path("/").search('keywords', keywords)

		if $routeParams.keywords
			keywords = $routeParams.keywords.toLowerCase()
			$scope.recipes = recipes.filter (recipe)-> recipe.name.toLowerCase().indexOf(keywords) != -1
		else
			$scope.recipes = []
])