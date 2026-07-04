# https://github.com/Zeronetsec/Muxly

require 'json'
require 'utils/color'
require 'utils/birthday'
require 'utils/banner'

module Help
    def self.execute(*)
        metadata = File.expand_path(
            "../../metadata", __dir__,
        )

        unless Dir.exist?(metadata)
            printf(
                "%s[!] %sFolder: %smetadata %snot found!\n",
                Color.R, Color.N, Color.GG, Color.N,
            )
            exit(1)
        end

        Banner.execute()
        Birthday.execute()

        printf(
            "%sUsage: %smuxly %s<option> <args>%s\n",
            Color.N, Color.GG, Color.CC, Color.N,
        )

        printf("\n")

        dirs = Dir.glob(File.join(metadata, '*/')).sort
        dirs.each_with_index do |dirp, idx|
            printf("\n") if idx > 0

            section = File.basename(dirp).capitalize
            printf(
                "%s%s options:\n",
                Color.N, section,
            )

            json_files = Dir.glob(
                File.join(dirp, '*.json'),
            ).sort

            json_files.each do |file_path|
                parse_and_print_json(file_path)
            end
        end
    end

    def self.parse_and_print_json(file_path)
        file_content = File.read(
            file_path, encoding: 'utf-8',
        )

        data = JSON.parse(file_content)

        command = data["Command"] || ""
        args = data["Args"] || ""
        desc = data["Description"] || ""

        fullcmd = args.empty? ?
            "#{Color.GG}#{command}#{Color.N}" :
            "#{Color.GG}#{command} #{Color.CC}#{args}#{Color.N}"

        printf(
            "    %s* %s\n",
            Color.DG, fullcmd,
        )

        printf(
            "    %s└── %s%s%s\n",
            Color.DG, Color.WW, desc, Color.N,
        )
    rescue JSON::ParserError, Errno::EACCES
        nil
    end

    private_class_method :parse_and_print_json
end

# Copyright (c) 2026 Zeronetsec