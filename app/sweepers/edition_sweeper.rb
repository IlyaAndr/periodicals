class EditionSweeper < ActionController::Caching::Sweeper

  observe Edition

  def sweep edition
    expire_fragment "new_editions"
  end

  alias_method :after_update, :sweep
  alias_method :after_create, :sweep
  alias_method :after_destroy, :sweep

end