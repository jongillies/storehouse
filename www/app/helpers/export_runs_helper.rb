module ExportRunsHelper

  def link_to_export_run_edit(resource, klass = "btn")
    link_to t('.edit', :default => t("helpers.links.edit")),
            edit_export_run_path(resource), :class => klass
  end

  def link_to_export_run_destroy(resource, klass = "btn btn-danger")
    link_to t('.destroy', :default => t("helpers.links.destroy")),
            export_run_path(resource),
            :method => :delete,
            :data   => {:confirm => t('.confirm', :default => t("helpers.links.confirm", :default => 'Are you sure?'))},
            :class  => klass
  end

  def running?(export_run)
    if export_run.finished_at.nil?
      '(Running)'
    end
  end

end
