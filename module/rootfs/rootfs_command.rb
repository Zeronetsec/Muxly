# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/variable'
require 'utils/missing_argument'

module RootfsCommand
    def self.execute(args)
        args.shift
        target_rootfs = args.at(0)
        command_to_run = args[1..-1] || []

        unless Dir.exist?(Variable.RfsPath)
            printf(
                "%s[!] %sFolder: %s%s %snot found!\n",
                Color.R, Color.N, Color.GG, Variable.RfsPath, Color.N,
            )
            exit(1)
        end

        if target_rootfs.nil? ||
            target_rootfs.strip.empty? ||
            command_to_run.empty?
                MissingArgument.execute()
                exit(1)
        end

        target_dir = File.join(
            Variable.RfsPath, target_rootfs,
        )

        unless Dir.exist?(target_dir)
            printf(
                "%s[!] %sRootfs: %s%s %sis not installed!\n",
                Color.R, Color.N, Color.GG, target_rootfs, Color.N,
            )
            exit(1)
        end

        system(
            "pd530", "login", target_rootfs,
            "--", *command_to_run
        )

        exit_code = $?.exitstatus
        exit(exit_code)
    end
end

# Copyright (c) 2026 Zeronetsec