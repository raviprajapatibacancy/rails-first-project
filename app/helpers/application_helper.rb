module ApplicationHelper
    def current_class?(test_path)
        return 'active' if request.path.include? test_path
      end
end
