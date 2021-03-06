require 'active_record/associations/join_dependency/join_part'

module ActiveRecord
  module Associations
    class JoinDependency # :nodoc:
      class JoinBase < JoinPart # :nodoc:
        def initialize(klass)
          super(klass, nil)
        end

        def match?(other)
          return true if self == other
          super && base_klass == other.base_klass
        end

        def aliased_prefix
          "t0"
        end

        def table
          Arel::Table.new(table_name, arel_engine)
        end

        def aliased_table_name
          base_klass.table_name
        end
      end
    end
  end
end
