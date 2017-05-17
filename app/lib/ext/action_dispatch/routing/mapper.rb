module ActionDispatch
  module Routing
    class Mapper
      ID_FORMAT_REGEX = /\w{8}/

      def listable(a_z_action, letter_action)
        scope '/a-z', as: 'a_z' do
          get '/',    to: a_z_action

          scope '/:letter', as: 'letter' do
            get '/', to: letter_action
          end
        end
      end

      def lookupable(action)
        get '/:letters', to: action
      end

      def build_default_routes(route_name, current: true, lookup: true, postcode: true)
        get '/', to: "#{route_name}#index"
        get '/current', to: "#{route_name}#current" if current
        get '/lookup', to: "#{route_name}#lookup" if lookup
        post '/postcode_lookup', to: "#{route_name}#postcode_lookup", as: 'postcode_lookup' if postcode
      end

      def build_root_and_current_routes(parent_route_name, route_name)
        scope "/#{route_name}", as: route_name do
          get '/',        to: "#{parent_route_name}##{route_name}"
          get '/current', to: "#{parent_route_name}#current_#{route_name.singularize}"
        end
      end

      def build_members_routes(route_name, current: true)
        scope '/members', as: 'members' do
          get '/', to: "#{route_name}#members"

          listable("#{route_name}#a_to_z_members", "#{route_name}#members_letters")

          # /route_name/:id/members/current
          scope '/current', as: 'current' do
            if current
              get '/', to: "#{route_name}#current_members"

              listable("#{route_name}#a_to_z_current_members", "#{route_name}#current_members_letters")
            end
          end

          yield if block_given?
        end
      end
    end
  end
end
