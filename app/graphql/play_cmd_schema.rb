class PlayCmdSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  use GraphQL::Dataloader

  def self.type_error(err)
    super
  end

  def self.resolve_type(abstract_type, obj, ctx)
    raise(GraphQL::RequiredImplementationMissingError)
  end

  def self.id_from_object(object, type_definition, query_ctx)
    object_id = object.to_global_id.to_s
    object_id = object_id.sub("gid://#{GlobalID.app}/", "")
    encoded_id = Base64.urlsafe_encode64(object_id)
    encoded_id = encoded_id.sub(/=+/, "")
    type_hint = type_definition.graphql_name.first
    "#{type_hint}_#{encoded_id}"
  end

  def self.object_from_id(encoded_id_with_hint, query_ctx)
    _type_hint, encoded_id = encoded_id_with_hint.split("_", 2)
    id = Base64.urlsafe_decode64(encoded_id)
    full_global_id = "gid://#{GlobalID.app}/#{id}"
    GlobalID::Locator.locate(full_global_id)
  end
end
