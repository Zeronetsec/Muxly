# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/variable'
require 'utils/missing_argument'

module Rootfs
    def self.execute(args)
        args.shift
        target_rootfs = args.first

        unless Dir.exist?(Variable.RfsPath)
            printf(
                "%s[!] %sFolder: %s%s %snot found!\n",
                Color.R, Color.N, Color.GG, Variable.RfsPath, Color.N,
            )
            exit(1)
        end

        if target_rootfs.nil? ||
            target_rootfs.strip.empty?
                MissingArgument.execute()
                exit(1)
        end

        target_dir = File.join(
            Variable.RfsPath, target_rootfs,
        )

        unless Dir.exist?(target_dir)
            printf(
                "%s[!] %sRootfs: %s%s %snot found!\n",
                Color.R, Color.N, Color.GG, target_rootfs, Color.N,
            )
            exit(1)
        end

        login_args = ["login", target_rootfs]
        user_flag_index = args.index("--user")

        if user_flag_index
            custom_user = args[user_flag_index + 1]
            if custom_user.nil? ||
                custom_user.strip.empty?
                    MissingArgument.execute()
                    exit(1)
            end
            login_args << "--user"
            login_args << custom_user
        end
        exec("pd530", *login_args)
    end
end

# Copyright (c) 2026 Zeronetsec