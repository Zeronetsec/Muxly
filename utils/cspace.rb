# https://github.com/Zeronetsec/Muxly

require 'utils/variable'

module Cspace
    def self.execute(*)
        file_path = Variable.Config
        return unless File.exist?(file_path) &&
        !File.zero?(file_path)

        last_char = File.read(
            file_path, 1, File.size(file_path) - 1,
        )

        if last_char != "\n"
            File.open(
                file_path, "a",
            ) { |f| f.write("\n") }
        end
    end
end

# Copyright (c) 2026 Zeronetsec