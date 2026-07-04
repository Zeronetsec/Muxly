# https://github.com/Zeronetsec/Muxly

require 'utils/variable'

module SetConf
    def self.execute(key, value)
        if key.nil? ||
            key.empty? ||
            value.nil? ||
            value.empty?
                return false
        end
        lines = []
        if File.exist?(Variable.Config)
            lines = File.readlines(
                Variable.Config,
            ).reject {
                |line| line.start_with?("#{key} =")
            }
        end
        lines << "#{key} = #{value}\n"
        File.write(Variable.Config, lines.join)
        true
    end
end

# Copyright (c) 2026 Zeronetsec