#global module:false

"use strict"

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-exec"

  grunt.initConfig

    copy:
      jquery:
        files: [{
          expand: true
          cwd: "bower_components/jquery/dist/"
          src: "jquery.min.js"
          dest: "assets/vendor/js/"
        }]

      jqueryterminal:
        files: [{
          expand: true
          cwd: "bower_components/jquery.terminal/js/"
          src: "jquery.terminal-0.11.9.min.js"
          dest: "assets/vendor/js/"
        }, {
          expand: true
          cwd: "bower_components/jquery.terminal/js/"
          src: "jquery.mousewheel-min.js"
          dest: "assets/vendor/js/"
        }, {
          expand: true
          cwd: "bower_components/jquery.terminal/css/"
          src: "jquery.terminal-0.11.9.css"
          dest: "assets/vendor/css/"
        }]

    exec:
      jekyll:
        cmd: "bundle exec jekyll -v"

    watch:
      options:
        livereload: true
      source:
        files: [
          "_drafts/**/*"
          "_includes/**/*"
          "_layouts/**/*"
          "_posts/**/*"
          "css/**/*"
          "js/**/*"
          "_config.yml"
          "*.html"
          "*.md"
        ]
        tasks: [
          "exec:jekyll"
        ]

    connect:
      server:
        options:
          port: 4000
          base: '_site'
          livereload: true

  grunt.registerTask "build", [
    "copy"
    "exec:jekyll"
  ]

  grunt.registerTask "serve", [
    "build"
    "connect:server"
    "watch"
  ]

  grunt.registerTask "default", [
    "serve"
  ]