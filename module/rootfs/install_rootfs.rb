# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/variable'
require 'utils/missing_argument'

module InstallRootfs
    def self.execute(args)
        args.shift
        rootfs_name = args.first

        if rootfs_name.nil? ||
            rootfs_name.strip.empty?
                MissingArgument.execute()
                exit(1)
        end

        root_path = File.expand_path("../..", __dir__)
        rootfs_source_dir = File.join(
            root_path, "rootfs", rootfs_name,
        )

        rootfs_script = File.join(
            rootfs_source_dir, "rootfs.sh",
        )

        installer_script = File.join(
            rootfs_source_dir, "install.sh",
        )

        target_install_dir = File.join(
            Variable.RfsPath, rootfs_name,
        )

        unless Dir.exist?(rootfs_source_dir)
            printf(
                "%s[!] %sInvalid rootfs: %s%s%s\n",
                Color.R, Color.N, Color.GG, rootfs_name, Color.N,
            )
            exit(1)
        end

        unless File.exist?(rootfs_script)
            printf(
                "%s[!] %sRootfs: %s%s %sfound, but missing %srootfs.sh%s\n",
                Color.R, Color.N, Color.GG, rootfs_name, Color.N, Color.GG, Color.N,
            )
            exit(1)
        end

        if Dir.exist?(target_install_dir)
            printf(
                "%s[!] %sRootfs: %s%s %sis already exist!\n",
                Color.R, Color.N, Color.GG, rootfs_name, Color.N,
            )
            exit(1)
        end

        ENV["rfspath"] = Variable.RfsPath
        ENV["root"] = root_path

        printf(
            "%s[*] %sInstalling: %s%s%s\n",
            Color.B, Color.N, Color.GG, rootfs_name, Color.N,
        )

        system("bash", installer_script)
        exit_code = $?.exitstatus
        exit(exit_code)
    end
end

# Copyright (c) 2026 Zeronetsec