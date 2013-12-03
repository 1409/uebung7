json.array!(@taks) do |tak|
  json.extract! tak, :name, :deadline, :done, :duration
  json.url tak_url(tak, format: :json)
end
