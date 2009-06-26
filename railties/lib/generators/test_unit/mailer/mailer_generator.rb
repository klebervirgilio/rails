module TestUnit
  module Generators
    class MailerGenerator < Base
      argument :actions, :type => :array, :default => [], :banner => "method method"

      def check_class_collisions
        class_collisions class_name, "#{class_name}Test"
      end

      def create_test_files
        template "unit_test.rb", File.join('test', 'unit', class_path, "#{file_name}_test.rb")
      end

      def create_fixtures_files
        actions.each do |action|
          @action, @path = action, File.join(file_path, action)
          template "fixture", File.join("test", "fixtures", @path)
        end
      end
    end
  end
end
