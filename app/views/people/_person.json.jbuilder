# frozen_string_literal: true

json.extract! person, :id, :first_name

json.sgid person.attachable_sgid
json.content render(partial: 'people/person', locals: { person: person }, formats: [:html])
