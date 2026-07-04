# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/variable'
require 'utils/missing_argument'

module InstallRootfsNoTemplate
    def self.execute(args)
        args.shift

        url_or_alias = args.at(0)
        param_flag = args.at(1)
        custom_name = args.at(2)

        if url_or_alias.nil? ||
            url_or_alias.strip.empty?
                MissingArgument.execute()
                exit(1)
        end

        check_exist = lambda do |name|
            target_dir = File.join(
                Variable.RfsPath, name,
            )

            if Dir.exist?(target_dir)
                printf(
                    "%s[!] %sRootfs: %s%s %sis already exist!\n",
                    Color.R, Color.N, Color.GG, name, Color.N,
                )
                exit(1)
            end
        end

        if param_flag.nil?
            default_name = url_or_alias.split(
                '/',
            ).last.to_s.gsub(
                /\.tar\..*$/, '',
            )

            check_exist.call(default_name)
            system("pd530", "install", url_or_alias)
            exit($?.exitstatus)
        elsif param_flag == "--name"
            if custom_name.nil? ||
                custom_name.strip.empty?
                    MissingArgument.execute()
                    exit(1)
            end

            check_exist.call(custom_name)
            system(
                "pd530","install",
                url_or_alias, "--name", custom_name,
            )
            exit($?.exitstatus)
        end
    end
end

# Copyright (c) 2026 Zeronetsec