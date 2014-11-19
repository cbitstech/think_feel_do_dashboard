module ThinkFeelDoDashboard
  # Top level controller.
  class ApplicationController < ActionController::Base
    unless Rails.env.development? || Rails.env.test?
      before_action :authenticate_user!
    end

    before_action :set_admin_link

    def set_admin_link
      @admin_functionalities = [
        ["Projects", projects_path, "Create necessary \
          projects for studies."],
        ["Arms", arms_path, "Create, update, delete, and \
          associate arms with projects."],
        ["Groups", groups_path, "Create, update, delete, \
          and associate groups with arms along with set moderators."],
        ["Participants", participants_path, "Create, update,\
         and delete participants along with assigning them to groups."],
        ["Users", users_path, "Create and view admins, \
          clinicians, researchers, and content authors."],
        ["CSV Reports", reports_path, "Downlonad data via csv\
         for..."]
      ]
    end
  end
end
