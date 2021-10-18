json.type_of "post"

json.extract!(
    post,
    :id,
    :title,
    :slug,
    :created_at
)
