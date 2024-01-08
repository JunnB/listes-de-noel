class ApplicationController < ActionController::Base
  helper_method :breadcrumbs
  before_action :decorate_user

  def breadcrumbs
    @breadcrumbs ||= []
  end

  def add_breadcrumb(name, path = nil)
    breadcrumbs << BreadcrumbDecorator.new(name, path)
  end

  def decorate_user
    current_user&.decorate
  end
end
