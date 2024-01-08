module PoolsHelper
  def pool_line_button_attributes(current_user, pool)
    if current_user.pools.exclude?(pool)
      {
        has_pool: false,
        btn_class: "btn-primary",
        btn_title: "Participer",
        btn_link: join_pool_path(user_id: current_user.id, pool_id: pool.id),
        btn_action: :post
      }
    else
      {
        has_pool: true,
        btn_class: "btn-secondary",
        btn_title: "Désinscrire",
        btn_link: unjoin_pool_path(user_id: current_user.id, pool_id: pool.id),
        btn_action: :delete
      }
    end
  end
end
