CONFIG =
  # interval between polling of circle ci status
  interval: 15
  # insert circle ci status api key here or leave blank and set the environment
  # variable CIRCLE_CI_API_KEY which is then used in the server.coffee
  apiKey: 'a4aa8692f3c6ee02fbe72e12091b41273ecfab1c'
  # list of projects, note that you’ll have to follow the projects with the
  # account that created the api key to access the build details for that
  # project over the circle ci api
  projects: [
    {
      name: 'API'
      path: 'QuiqUpLTD/QuiqupAPI'
    }
  ]

