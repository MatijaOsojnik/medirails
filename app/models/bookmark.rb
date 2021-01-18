class Bookmark < ApplicationRecord
    has_one :article
    has_one :user
end
