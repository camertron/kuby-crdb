module Kuby::CRDB::DSL::CRDB::V1alpha1
  class CrdbCluster < ::KubeDSL::DSLObject
    object_field(:status) { Kuby::CRDB::DSL::CRDB::V1alpha1::Status.new }
    object_field(:spec) { Kuby::CRDB::DSL::CRDB::V1alpha1::Spec.new }
    value_field :api_version
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

    validates :status, object: { kind_of: Kuby::CRDB::DSL::CRDB::V1alpha1::Status }
    validates :spec, object: { kind_of: Kuby::CRDB::DSL::CRDB::V1alpha1::Spec }
    validates :api_version, field: { format: :string }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }

    def serialize
      {}.tap do |result|
        result[:status] = status.serialize
        result[:kind] = "CrdbCluster"
        result[:spec] = spec.serialize
        result[:apiVersion] = api_version
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :crdb_cluster
    end
  end
end
