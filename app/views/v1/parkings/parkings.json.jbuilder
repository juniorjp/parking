json.array! @parkings do |parking|
  json.partial! "v1/parkings/parking", parking: parking
end
