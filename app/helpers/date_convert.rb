def date_convert(object)
  return object.created_at.strftime('%D')
end

def time_convert(object)
  return object.created_at.strftime('%I:%M%p')
end
