class ChangeRunsDistanceDatatype < ActiveRecord::Migration
  def change
    change_column :runs, :distance, :float
  end
end
