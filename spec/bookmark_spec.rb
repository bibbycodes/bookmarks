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

  describe ".create" do
    it 'adds a new bookmark' do
      Bookmark.create("http://www.theguardian.co.uk")
      expect(Bookmark.all).to include("http://www.theguardian.co.uk")
    end
  end
end
