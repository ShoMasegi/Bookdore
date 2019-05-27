json.extract! history, :id, :created_at, :updated_at
json.card_id history.card.id
json.concrete_history do
  if history.concrete_history.is_a?(ReadHistory)
    json.read_history do
      json.page_count history.concrete_history.page_count
      json.time_sec history.concrete_history.time_sec
    end
  elsif history.concrete_history.is_a?(RegisterHistory)
    json.register_history do
      json.from history.concrete_history.from
      json.to history.concrete_history.to
    end
  end
end
