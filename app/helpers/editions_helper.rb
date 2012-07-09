module EditionsHelper

	def kinds_links_join edition
		edition.kinds.map{|kind| link_to kind.name, kind}.join ', '
	end

end
