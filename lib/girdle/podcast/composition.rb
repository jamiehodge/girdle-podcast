module Girdle
  module Podcast
    module Composition

      def qc_composition(options={})
        name = "qc_composition_#{uuid}.mov"
        base_dir = options[:base_dir] || '.'
        arguments = [
          options[:composition],
          File.join(base_dir, name),
          options[:width],
          options[:height],
          options[:duration]
          ] + (options[:parameters] || {}).map {|k,v| ["--#{k}", v] }.flatten
        new(
          name: name,
          command: '/usr/bin/qc2movie',
          arguments: arguments,
          depends_on: options[:depends_on] || []
        )
      end
    end
  end
end