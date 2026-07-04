# https://github.com/Zeronetsec/Muxly

require 'utils/variable'

module GetConf
    def self.execute(key)
        return nil if key.nil? || key.empty?
        return nil unless File.exist?(Variable.Config)
        File.foreach(Variable.Config) do |line|
            if line =~ /^#{Regexp.escape(key)} = (.+)$/
                return $1.strip
            end
        end
        nil
    end
end

# Copyright (c) 2026 Zeronetsec