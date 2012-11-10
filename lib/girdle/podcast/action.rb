module Girdle
  module Podcast
    module Action

      def add_chapter(options={})
        name = "add_chapter-#{uuid}.mov"
        arguments = [
          'addchapter',
          '--basedir', options[:base_dir] || '.',
          '--input',   options[:input],
          '--output',  name,
          '--time',    options[:time],
          '--title',   options[:title]
          ]
        new(
          name: name,
          command: '/usr/bin/pcastaction',
          arguments: arguments,
          depends_on: select_tasks([ options[:input] ] + (options[:depends_on] || []))
        )
      end

      def add_tracks(options={})
        name = "add_tracks-#{uuid}.mov"
        arguments = [
          'addtracks',
          '--basedir', options[:base_dir] || '.',
          '--tracks', options[:tracks],
          '--input', options[:input],
          '--output', name
          ]
        new(
          name: name,
          command: '/usr/bin/pcastaction',
          arguments: arguments,
          depends_on: select_tasks([ options[:input] ] + (options[:depends_on] || []))
        )
      end

      def annotate(options={})
        arguments = [
          'annotate',
          '--basedir',    options[:base_dir] || '.',
          '--input',      options[:input]
          ]
        arguments += ['--title', options[:title]] if options[:title]
        arguments += ['--comment', options[:comment]] if options[:comment]
        arguments += 
          ['--description', options[:description]] if options[:description]
        arguments += ['--author', options[:author]] if options[:author]
        arguments += ['--keywords', options[:keywords]] if options[:keywords]
        arguments += ['--copyright', options[:copyright]] if options[:copyright]
        new(
          name: "annotate-#{uuid}.mov",
          command: '/usr/bin/pcastaction',
          arguments: arguments,
          depends_on: select_tasks([ options[:input] ] + (options[:depends_on] || []))
        )
      end

      def chapterize(options={})
        name = "chapterize-#{uuid}.mov"
        arguments = [
          'chapterize',
          '--basedir', options[:base_dir] || '.',
          '--input', options[:input],
          '--output', name
          ]
        new(
          name: name,
          command: '/usr/bin/pcastaction',
          arguments: arguments,
          depends_on: select_tasks([ options[:input] ] + (options[:depends_on] || []))
        )
      end

      def delete_tracks(options={})
        name = "delete_tracks-#{uuid}.mov"
        arguments = [
          'deletetracks',
          '--basedir', options[:base_dir] || '.',
          '--input', options[:input],
          '--output', name,
          '--type', options[:type]
          ]
        new(
          name: name,
          command: '/usr/bin/pcastaction',
          arguments: arguments,
          depends_on: select_tasks([ options[:input] ] + (options[:depends_on] || []))
        )
      end

      def encode(options={})
        name = "encode-#{uuid}.mov"
        arguments = [
          'encode',
          '--basedir', options[:base_dir] || '.',
          '--input', options[:input],
          '--output', name,
          '--encoder', options[:encoder]
          ]
        new(
          name: name,
          command: '/usr/bin/pcastaction',
          arguments: arguments,
          depends_on: select_tasks([ options[:input] ] + (options[:depends_on] || []))
        ) 
      end

      def extract_tracks(options={})
        name = "extract_tracks-#{uuid}.mov"
        arguments = [
          'extracttracks',
          '--basedir', options[:base_dir] || '.',
          '--input', options[:input],
          '--output', name,
          '--type', options[:type]
          ]
        new(
          name: name,
          command: '/usr/bin/pcastaction',
          arguments: arguments,
          depends_on: select_tasks([ options[:input] ] + (options[:depends_on] || []))
        )
      end
      
      def flatten(options={})
        name = "flatten-#{uuid}.mov"
        arguments = [
          'flatten',
          '--basedir', options[:base_dir] || '.',
          '--input', options[:input],
          '--output', name,
          ]
        new(
          name: name,
          command: '/usr/bin/pcastaction',
          arguments: arguments,
          depends_on: select_tasks([ options[:input] ] + (options[:depends_on] || []))
        ) 
      end

      def get_poster_image(options={})
        name = "get_poster_image-#{uuid}.png"
        arguments = [
          'getposterimage',
          '--basedir', options[:base_dir] || '.',
          '--input',  options[:input],
          '--output', name,
          "--time=#{options[:time]}"
          ]
        new(
          name: name,
          command: '/usr/bin/pcastaction',
          arguments: arguments,
          depends_on: select_tasks([ options[:input] ] + (options[:depends_on] || []))
        )
      end

      def join(options={})
        name = "join-#{uuid}.mov"
        arguments = [
          'join', 
          '--basedir', options[:base_dir] || '.',
          '--input1',  options[:input_1],
          '--input2',  options[:input_2],
          '--output',  name
          ]
        new(
          name: name,
          command: '/usr/bin/pcastaction',
          arguments: arguments,
          depends_on: select_tasks([ options[:input_1], options[:input_2] ] + (options[:depends_on] || []))
        )
      end

      def qt_import(options={})
        name = "qt_import-#{uuid}.mov"
        arguments = [
          'qtimport',
          '--basedir', options[:base_dir] || '.',
          '--input', options[:input],
          '--output', name
          ]
        if options[:enable_auto_chaptering] == true
          arguments << '--enable_auto_chaptering'
        end
        new(
          name: name,
          command: '/usr/bin/pcastaction',
          arguments: arguments,
          depends_on: select_tasks([ options[:input] ] + (options[:depends_on] || []))
        )
      end

      def qt_info(options={})
        arguments = [
          'qtinfo',
          '--basedir', options[:base_dir] || '.',
          '--input',   options[:input],
          ]
        arguments += ['--key', options[:key] ] if options[:key]
        new(
          name: "qt_info-#{uuid}",
          command: '/usr/bin/pcastaction',
          arguments: arguments,
          depends_on: select_tasks([ options[:input] ] + (options[:depends_on] || []))
        )
      end

      private

        def uuid
          `uuidgen`.strip
        end
        
        def select_tasks(dependencies)
          dependencies.select {|d| d.respond_to?(:name) }
        end
    end
  end
end