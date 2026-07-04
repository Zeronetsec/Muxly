# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/variable'
require 'utils/missing_argument'

module Symlink
    def self.execute(args)
        args.shift
        target_rootfs = args.at(0)
        shortcut_name = args.at(1)

        unless Dir.exist?(Variable.RfsPath)
            printf(
                "%s[!] %sFolder: %s%s %snot found!\n",
                Color.R, Color.N, Color.GG, Variable.RfsPath, Color.N,
            )
            exit(1)
        end

        if target_rootfs.nil? ||
            target_rootfs.strip.empty? ||
            shortcut_name.nil? ||
            shortcut_name.strip.empty?
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

        prefix_bin = ENV["PREFIX"] || "/data/data/com.termux/files/usr"
        shortcut_path = File.join(
            prefix_bin, "bin", shortcut_name,
        )

        if File.exist?(shortcut_path)
            printf(
                "%s[!] %sExecutable: %s%s %sis already exist!\n",
                Color.R, Color.N, Color.GG, shortcut_name, Color.N,
            )
            exit(1)
        end

        begin
            File.open(shortcut_path, "w") do |file|
                file.puts("#!/usr/bin/env bash")
                file.puts(
                    "exec pd530 login #{target_rootfs} --work-dir $(pwd) -- #{shortcut_name} \"${@}\"",
                )
            end
            File.chmod(0755, shortcut_path)
            exit(0)
        rescue => e
            printf(
                "%s[!] %sFailed to create symlink: %s%s%s\n",
                Color.R, Color.N, Color.GG, e.message, Color.N,
            )
            exit(1)
        end
    end
end

# Copyright (c) 2026 Zeronetsec