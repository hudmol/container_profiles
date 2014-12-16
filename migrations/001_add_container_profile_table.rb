# -*- coding: utf-8 -*-
require 'db/migrations/utils'

Sequel.migration do
  up do

    create_table(:container_profile) do
      primary_key :id

      Integer :repo_id, :null => false
      Integer :lock_version, :default => 0, :null => false
      
      String :name                     # unique
      String :url, :null => true       # optional

      String :extent_dimension         # enum (‘height’, ‘width’, ‘depth’)
      DynamicEnum :dimension_units_id  # default ‘inches’

      String :height                   # validates as float
      String :width                    # validates as float
      String :depth                    # validates as float

      apply_mtime_columns
    end

    alter_table(:container_profile) do
      add_unique_constraint([:name], :name => "container_profile_name_uniq")
    end

    create_enum("dimension_units", ["inches", "feet", "yards", "millimeters", "centimeters", "meters"])
  end

  down do
    drop_table(:container_profile)
  end
end


