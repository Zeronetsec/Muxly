# https://github.com/Zeronetsec/Muxly

module Variable
    def Config = "#{ENV['HOME']}/.config/muxly/config.conf".freeze
    def PropPath = "#{ENV['HOME']}/.termux/termux.properties".freeze
    def FontPath = "#{ENV['HOME']}/.termux/font.ttf".freeze
    def ThPath = "#{ENV['HOME']}/.termux/colors.properties".freeze
    def RfsPath = "#{ENV['PREFIX']}/var/lib/pd530/containers".freeze
    def CfgTmp = "#{ENV['PREFIX']}/tmp/muxly_config_temporary.tmp".freeze
    def Utemp = "#{ENV['PREFIX']}/tmp/muxly_utils_temporary.tmp".freeze
    module_function(
        :Config, :PropPath, :FontPath, :ThPath,
        :RfsPath, :CfgTmp, :Utemp,
    )
end

# Copyright (c) 2026 Zeronetsec