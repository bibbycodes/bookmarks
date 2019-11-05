require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmakrs' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.github.com")
    end
  end
end