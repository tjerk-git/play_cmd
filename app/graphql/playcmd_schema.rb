class PlayCMDSchema < GraphQL::Schema

  log_query_depth = GraphQL::Analysis::QueryDepth.new do |_query, depth|
    Rails.logger.info("[GraphQL Query Depth] #{depth}")
  end

  query_analyzer(log_query_depth)
  mutation(Types::MutationType)
  query(Types::QueryType)

  def self.unauthorized_object(error)
    raise GraphQL::ExecutionError, "An object of type #{error.type.graphql_name} was hidden due to permissions"
  end

  def self.unauthorized_field(error)
    raise GraphQL::ExecutionError, "The field #{error.field.graphql_name} on an object of type #{error.type.graphql_name} was hidden due to permissions"
  end

  rescue_from(ActionPolicy::Unauthorized) do |exp|
    raise GraphQL::ExecutionError.new(
      exp.result.message,
      extensions: {
        code: :unauthorized,
        fullMessages: exp.result.reasons.full_messages,
        details: exp.result.reasons.details
      }
    )
  end
end