module Girdle
  module Podcast
    module Action

      def add_chapter(options={})
        name = "add_chapter-#{uuid}.mov"
        input = options[:input]
        arguments = [
          'addchapter',
          '--basedir', options[:base_dir] || '.',
          '--input',   input,
          '--output',  name,
          '--time',    options[:time],
          '--title',   options[:title]
          ]
        new(
          name: name,
          command: '/usr/bin/pcastaction',
          arguments: arguments,
          depends_on: [ options[:input] ]
        )
      end

      def add_tracks(options={})
        name = "add_tracks-#{uuid}.mov"
        input = options[:input]
        arguments = [
          'addtracks',
          '--basedir', options[:base_dir] || '.',
          '--tracks', options[:tracks],
          '--input', input,
          '--output', name
          ]
        new(
          name: name,
          command: '/usr/bin/pcastaction',
          arguments: arguments,
          depends_on: [ options[:input] ]
        )
      end

      def annotate(options={})
        input = options[:input]
        arguments = [
          'annotate',
          '--basedir',    options[:base_dir] || '.',
          '--input',      input
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
          depends_on: [ options[:input] ]
        )
      end

      def chapterize(options={})
        name = "chapterize-#{uuid}.mov"
        input = options[:input]
        arguments = [
          'chapterize',
          '--basedir', options[:base_dir] || '.',
          '--input', input,
          '--output', name
          ]
        new(
          name: name,
          command: '/usr/bin/pcastaction',
          arguments: arguments,
          depends_on: [ options[:input] ]
        )
      end

      def delete_tracks(options={})
        name = "delete_tracks-#{uuid}.mov"
        input = options[:input]
        arguments = [
          'deletetracks',
          '--basedir', options[:base_dir] || '.',
          '--input', input,
          '--output', name,
          '--type', options[:type]
          ]
        new(
          name: name,
          command: '/usr/bin/pcastaction',
          arguments: arguments,
          depends_on: [ options[:input] ]
        )
      end

      def encode(options={})
        name = "encode-#{uuid}.mov"
        input = options[:input]
        arguments = [
          'encode',
          '--basedir', options[:base_dir] || '.',
          '--input', input,
          '--output', name,
          '--encoder', options[:encoder]
          ]
        new(
          name: name,
          command: '/usr/bin/pcastaction',
          arguments: arguments,
          depends_on: [ options[:input] ]
        ) 
      end

      def extract_tracks(options={})
        name = "extract_tracks-#{uuid}.mov"
        input = options[:input]
        arguments = [
          'extracttracks',
          '--basedir', options[:base_dir] || '.',
          '--input', input,
          '--output', name,
          '--type', options[:type]
          ]
        new(
          name: name,
          command: '/usr/bin/pcastaction',
          arguments: arguments,
          depends_on: [ options[:input] ]
        )
      end

      def get_poster_image(options={})
        name = "get_poster_image-#{uuid}.png"
        arguments = [
          'getposterimage',
          '--input',  options[:input],
          '--output', name,
          '--time',   options[:time]
          ]
        new(
          name: name,
          command: '/usr/bin/pcastaction',
          arguments: arguments,
          depends_on: [ options[:input] ]
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
          depends_on: [ options[:input_1], options[:input_2] ]
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
          depends_on: [ options[:input] ]
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
          depends_on: [ options[:input] ]
        )
      end

      private

        def uuid
          `uuidgen`.strip
        end  
    end
  end
end