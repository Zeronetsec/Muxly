# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/variable'
require 'utils/missing_argument'

module RenameRootfs
    def self.execute(args)
        args.shift
        old_name = args.at(0)
        new_name = args.at(1)

        if old_name.nil? ||
            old_name.strip.empty? ||
            new_name.nil? ||
            new_name.strip.empty?
                MissingArgument.execute()
                exit(1)
        end

        new_target_dir = File.join(
            Variable.RfsPath, new_name,
        )

        if Dir.exist?(new_target_dir)
            printf(
                "%s[!] %sRootfs: %s%s %sis already exist!\n",
                Color.R, Color.N, Color.GG, new_name, Color.N,
            )
            exit(1)
        end

        system("pd530", "rename", old_name, new_name)
        exit_code = $?.exitstatus
        exit(exit_code)
    end
end

# Copyright (c) 2026 Zeronetsec