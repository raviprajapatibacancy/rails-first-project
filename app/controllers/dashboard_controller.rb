class DashboardController < ApplicationController
    before_action :require_user
    layout "custom"
    def index
        @total_categories = Category.all.count;
        @total_tags = Tag.all.count;
        @total_blogs = Blog.all.count;
        @total_active_blogs = Blog.where("blogs.status = ?", "0").count;
    end
end
