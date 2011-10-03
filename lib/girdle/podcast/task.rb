module Girdle
  module Podcast
    class Task < Girdle::Task

      def initialize(options={})
        super(options)
        @command = '/usr/bin/pcastaction'
      end

      def self.add_chapter(options={})
        name = "#{File.basename(options[:input])}-addchapter-#{uuid}.mov"
        arguments = [
          'addchapter',
          '--basedir', options[:base_dir] || '.',
          '--input',   options[:input],
          '--output',  name,
          '--time',    options[:time],
          '--title',   options[:title]
          ]
        self.new(
          name: name,
          arguments: arguments,
          depends_on: [
            options[:input]
            ]
        )
      end

      def self.add_tracks(options={})
        name = "#{File.basename(options[:input])}-addtracks-#{uuid}.mov"
        arguments = [
          'addtracks',
          '--basedir', options[:base_dir] || '.',
          '--tracks', options[:tracks],
          '--input', options[:input],
          '--output', name
          ]
        self.new(
          name: name,
          arguments: arguments,
          depends_on: [
            File.basename(options[:input].to_s)
            ]
        )
      end

      def self.annotate(options={})
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
        self.new(
          name: "#{File.basename(options[:input])}-annotate-#{uuid}.mov",
          arguments: arguments,
          depends_on: [ options[:input] ]
        )
      end

      def self.chapterize(options={})
        name = "#{File.basename(options[:input])}-chapterize-#{uuid}.mov"
        arguments = [
          'chapterize',
          '--basedir', options[:base_dir] || '.',
          '--input', options[:input],
          '--output', name
          ]
        self.new(
          name: name,
          arguments: arguments,
          depends_on: [
            options[:input]
            ]
        )
      end

      def self.delete_tracks(options={})
        name = "#{File.basename(options[:input])}-deletetracks-#{uuid}.mov"
        arguments = [
          'deletetracks',
          '--basedir', options[:base_dir] || '.',
          '--input', options[:input],
          '--output', name,
          '--type', options[:type]
          ]
        self.new(
          name: name,
          arguments: arguments,
          depends_on: [ options[:input] ]
        )
      end

      def self.encode(options={})
        name = "#{File.basename(options[:input])}-encode-#{uuid}.mov"
        arguments = [
          'encode',
          '--basedir', options[:base_dir] || '.',
          '--input', options[:input],
          '--output', name,
          '--encoder', options[:encoder]
          ]
        self.new(
          name: name,
          arguments: arguments,
          depends_on: [
            options[:input]
            ]
        ) 
      end

      def self.extract_tracks(options={})
        name = "#{File.basename(options[:input])}-extracttracks-#{uuid}.mov"
        arguments = [
          'extracttracks',
          '--basedir', options[:base_dir] || '.',
          '--input', options[:input],
          '--output', name,
          '--type', options[:type]
          ]
        self.new(
          name: name,
          arguments: arguments,
          depends_on: [
            File.basename(options[:input])
            ]
        )
      end

      def self.get_poster_image(options={})
        name = "#{File.basename(options[:input])}-getposterimage-#{uuid}.png"
        arguments = [
          'getposterimage',
          '--input',  options[:input],
          '--output', name,
          '--time',   options[:time]
          ]
        self.new(
          name: name,
          arguments: arguments,
          depends_on: [
            options[:input]
            ]
        )
      end

      def self.join(options={})
        name = "#{File.basename(options[:input_1])}-#{File.basename(options[:input_2])}-join-#{uuid}.mov"
        arguments = [
          'join', 
          '--basedir', options[:base_dir] || '.',
          '--input1',  options[:input_1],
          '--input2',  options[:input_2],
          '--output',  name
          ]
        self.new(
          name: name, 
          arguments: arguments,
          depends_on: [
            options[:input_1],
            options[:input_2]
            ]
        )
      end

      def self.qt_import(options={})
        name = "#{File.basename(options[:input])}-qtimport-#{uuid}.mov"
        arguments = [
          'qtimport',
          '--basedir', options[:base_dir] || '.',
          '--input', options[:input],
          '--output', name
          ]
        if options[:enable_auto_chaptering] == true
          arguments << '--enable_auto_chaptering'
        end
        self.new(
          name: name,
          arguments: arguments,
          depends_on: ['preflight']
        )
      end

      def self.qt_info(options={})
        arguments = [
          'qtinfo',
          '--basedir', options[:base_dir] || '.',
          '--input',   options[:input]
          ]
        arguments += ['--key', options[:key] ] if options[:key]
        self.new(
          name: "#{File.basename(options[:input])}-qtinfo-#{uuid}",
          arguments: arguments,
          depends_on: [ options[:input] ]
        )
      end
      
      def self.qc_composition(options={})
        name = "qc_composition_#{options[:composition]}_#{uuid}.mov"
        arguments = [
          options[:composition],
          name,
          options[:width],
          options[:height],
          options[:duration]
          ] + (options[:parameters] || {}).map {|k,v| ["--#{k}", v] }.flatten
        self.new(
          name: name,
          arguments: arguments
        ).tap { |t| t.instance_eval { @command = '/usr/bin/qc2movie' }}
      end

      private

        def self.uuid
          `uuidgen`.strip
        end
    end
  end
end