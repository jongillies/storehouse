module DataSourcesHelper

  def link_to_data_source_edit(resource, klass = 'btn')
    link_to t('.edit', :default => t('helpers.links.edit')),
            edit_data_source_path(resource), :class => klass
  end

  def link_to_data_source_destroy(resource, klass = 'btn btn-danger')
    link_to t('.destroy', :default => t('helpers.links.destroy')),
            data_source_path(resource),
            :method => :delete,
            :data   => {:confirm => t('.confirm', :default => t('helpers.links.confirm', :default => 'Are you sure?'))},
            :class  => klass
  end

  def last_export_run_record_count(data_source_id)
    ExportRun.where(data_source_id: data_source_id).order('started_at DESC').limit(1).first.record_count
  end
  
end
