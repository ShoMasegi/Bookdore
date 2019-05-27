json.data do
  json.histories do
    json.array! @histories do |history|
      json.partial! "histories/history", history: history
    end
  end
end
