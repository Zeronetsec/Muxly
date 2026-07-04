# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/variable'
require 'utils/missing_argument'

module BackupRootfs
    def self.execute(args)
        args.shift
        target_rootfs = args.at(0)
        output_name = args.at(1)

        if target_rootfs.nil? ||
            target_rootfs.strip.empty? ||
            output_name.nil? ||
            output_name.strip.empty?
                MissingArgument.execute()
                exit(1)
        end

        rootfs_dir = File.join(
            Variable.RfsPath, target_rootfs,
        )

        tar_output = "#{output_name}.tar"
        unless Dir.exist?(rootfs_dir)
            printf(
                "%s[!] %sInvalid rootfs: %s%s%s\n",
                Color.R, Color.N, Color.GG, target_rootfs, Color.N,
            )
            exit(1)
        end

        if File.exist?(tar_output)
            printf(
                "%s[!] %sFile: %s%s %sis already exist!\n",
                Color.R, Color.N, Color.GG, tar_output, Color.N,
            )
            exit(1)
        end

        printf(
            "%s[*] %sBackup: %s%s %sto %s%s%s\n",
            Color.B, Color.N, Color.GG, target_rootfs,
            Color.N, Color.GG, tar_output, Color.N,
        )

        system(
            "pd530", "backup", target_rootfs,
            "--output", tar_output,
        )

        exit_code = $?.exitstatus
        exit(exit_code)
    end
end

# Copyright (c) 2026 Zeronetsec