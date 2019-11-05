require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmakrs' do
      truncate_and_load_bookmarks
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.askjeeves.com")
    end
  end
end
