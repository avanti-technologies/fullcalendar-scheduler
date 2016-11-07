
path = require('path')

module.exports = (config) ->

	config.set

		basePath: path.join(__dirname, '..')

		frameworks: [ 'jasmine' ]

		files: [
			'node_modules/native-promise-only/lib/npo.src.js',
			'lib/moment/moment.js'
			'lib/jquery/dist/jquery.js'
			'lib/fullcalendar/dist/fullcalendar.js'
			'lib/fullcalendar/dist/fullcalendar.css'
			'dist/scheduler.js'
			'dist/scheduler.css'

			'lib/jasmine-jquery/lib/jasmine-jquery.js'
			'lib/jasmine-fixture/dist/jasmine-fixture.js'
			'lib/jquery-simulate/jquery.simulate.js'
			'lib/jquery-ui/jquery-ui.js'

			'tests/util/base.css'
			'tests/util/util.coffee'
			'tests/util/util-more.js'
			'tests/util/geom.coffee'
			'tests/util/day-grid.coffee'
			'tests/util/time-grid.coffee'
			'tests/util/column.coffee'
			'tests/util/timeline.coffee'
			'tests/util/moment.js'
			'tests/util/simulate.js'
			'tests/*.coffee'

			# serve everything in the dist directory, like sourcemaps.
			# above files take precedence of over this, and will be watched.
			{ pattern: 'dist/*', included: false, watched: false, nocache: true }

			# serve source files for sourcemap debugging.
			# don't watch. dist files will be generated and trigger a retest.
			{ pattern: 'src/**/*.coffee', included: false, watched: false, nocache: true }

			# serve JSON files for AJAX-related tests. watch also.
			{ pattern: 'tests/json/*', included: false }
		]

		preprocessors:
			'tests/**/*.coffee': [ 'coffee' ]

		coffeePreprocessor:
			options:
				bare: true
				sourceMap: true
			transformPath: (path) ->
				path.replace(/\.coffee$/, '.js')

		customLaunchers:
			PhantomJS_custom:
				base: 'PhantomJS'
				options:
					viewportSize:
						width: 1024
						height: 768

		reporters: [ 'dots' ]
