# https://github.com/Zeronetsec/Muxly

require 'utils/missing_argument'
require 'utils/invalid_option'

module Console
    def self.run(args)
        if args.empty? ||
            args.first.nil? ||
            args.first.strip.empty?
                MissingArgument.execute()
                exit(1)
        end

        input_flag = args.first
        unless input_flag.start_with?('--')
            InvalidOption.execute(input_flag)
            exit(1)
        end

        clean_name = input_flag.sub(/^--/, '')
        file_name = clean_name.tr('-', '_')

        module_base_dir = File.expand_path("../module", __dir__)
        target_file = Dir.glob(File.join(
            module_base_dir, "**", "#{file_name}.rb"),
        ).first

        if target_file && File.exist?(target_file)
            require target_file
            class_name = file_name.split('_').map(&:capitalize).join
            flag_class = Object.const_get(class_name)
            if flag_class.is_a?(Class)
                flag_class.new.execute(args)
            elsif flag_class.is_a?(Module)
                flag_class.execute(args)
            end
        else
            InvalidOption.execute(input_flag)
            exit(1)
        end
    end
end

# Copyright (c) 2026 Zeronetsec