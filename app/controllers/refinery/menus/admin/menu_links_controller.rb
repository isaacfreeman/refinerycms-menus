module Refinery
  module Menus
    module Admin
      class MenuLinksController < Refinery::AdminController

        def create
          respond_to do |format|
            format.js do
              @menu_links = []
              if params[:resource_ids]
                params[:resource_ids].each do |id|
                  @menu_links << MenuLink.create({resource_id: id}.merge(menu_link_params))
                end
              else
                @menu_links << MenuLink.create(menu_link_params)
              end
            end
          end
        end

        def destroy
          respond_to do |format|
            format.js do
              @menu_link = MenuLink.find(params[:id])
              @menu_link.destroy
            end
          end
        end

      private

        def menu_link_params
          params.require(:menu_link).permit(:parent_id, :refinery_page_id, :refinery_menu_id, :resource, :resource_id, :resource_type, :title_attribute, :custom_url, :label, :menu, :id_attribute, :class_attribute)
        end

      end
    end
  end
end
