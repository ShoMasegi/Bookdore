json.data do
  json.history do
    json.partial! "histories/history", history: @history
  end
end
