# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/missing_argument'

module RestoreRootfs
    def self.execute(args)
        args.shift
        backup_file = args.first

        if backup_file.nil? ||
            backup_file.strip.empty?
                MissingArgument.execute()
                exit(1)
        end

        unless File.file?(backup_file)
            printf(
                "%s[!] %sFile: %s%s %snot found!\n",
                Color.R, Color.N, Color.GG, backup_file, Color.N,
            )
            exit(1)
        end

        system("pd530", "restore", backup_file)
        exit_code = $?.exitstatus
        exit(exit_code)
    end
end

# Copyright (c) 2026 Zeronetsec