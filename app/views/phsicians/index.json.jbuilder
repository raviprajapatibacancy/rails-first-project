json.set! :data do
  json.array! @phsicians do |phsician|
    json.partial! 'phsicians/phsician', phsician: phsician
    json.url  "
              #{link_to 'Show', phsician }
              #{link_to 'Edit', edit_phsician_path(phsician)}
              #{link_to 'Destroy', phsician, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end