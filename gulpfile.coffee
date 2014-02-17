gulp = require 'gulp'

sass = require 'gulp-sass'
connect = require 'gulp-connect'

sources =
	sass: 'sass/*.scss'
	html: 'index.html'

destinations =
	css: 'dist/css'
	html: 'dist/'

gulp.task 'connect', connect.server(
  root: ['dist']
  port: 1337
  livereload: true
  open:
    browser: 'chromium-browser'
)

gulp.task 'html', ->
	gulp.src(sources.html)
	.pipe(gulp.dest(destinations.html))

gulp.task 'style', ->
  gulp.src(sources.sass)
  .pipe(sass({outputStyle: 'compressed', errLogToConsole: true}))
  .pipe(gulp.dest(destinations.css))
  .pipe(connect.reload())


gulp.task 'watch', ->
	gulp.watch sources.html, ['html']
	gulp.watch sources.sass, ['style']

gulp.task 'default', [
  'style'
  'html'
  'connect'
  'watch'
]
