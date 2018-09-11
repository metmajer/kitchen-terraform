# frozen_string_literal: true

# Copyright 2016 New Context Services, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "kitchen/terraform/inspec"

module Kitchen
  module Terraform
    # InSpec instances act as interfaces to the InSpec gem.
    class InSpecWithoutHosts
      # exec executes the InSpec controls of InSpec profiles.
      #
      # @raise [::Kitchen::Terraform::Error] if the execution of the InSpec controls fails.
      # @return [void]
      def exec(system:)
        ::Kitchen::Terraform::InSpec
          .new(options: options, profile_paths: profile_paths).info(message: "Verifying #{system}").exec
      end

      private

      attr_accessor :options, :profile_paths

      # @param options [::Hash] options for execution.
      # @param profile_paths [::Array] the paths to the InSpec profiles which contain the controls to be executed.
      def initialize(options:, profile_paths:)
        self.options = options
        self.profile_paths = profile_paths
      end
    end
  end
end
