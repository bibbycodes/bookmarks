require 'bookmark'

describe Bookmark do
  context "Class Methods" do
    describe '.all' do
      it 'returns all bookmakrs' do
        truncate_and_load_bookmarks
        bookmarks = Bookmark.all

        expect(bookmarks[0][1]).to eq("Makers Academy")
        expect(bookmarks[1][1]).to eq("Google")
        expect(bookmarks[2][1]).to eq("Ask Jeeves")
      end
    end

    describe ".create" do
      it 'adds a new bookmark' do
        truncate_and_load_bookmarks
        guardian = Bookmark.create("http://www.theguardian.co.uk", "The Guardian")
        expect(Bookmark.all).to include(["http://www.theguardian.co.uk", "The Guardian", guardian.id])
      end
    end

    describe ".delete" do
      it 'deletes a specific bookmark' do
        truncate_and_load_bookmarks
        guardian = Bookmark.create("http://www.theguardian.co.uk", "The Guardian")
        Bookmark.remove(guardian.id)
        expect(Bookmark.all).to_not include(["http://www.theguardian.co.uk", "The Guardian", guardian.id])
      end
    end
  end

  context "Instance Methods" do
    describe "new instance of bookmark" do
      it 'makes a new book mark instance' do
        truncate_and_load_bookmarks
        gmail = Bookmark.create("https://www.gmail.com", "Gmail")
        expect(gmail).to be_a(Bookmark)
      end

      it "has a title" do
        truncate_and_load_bookmarks
        google_maps = Bookmark.create("https://www.googlemaps.com", "Google Maps")
        expect(google_maps.title).to eq("Google Maps")
      end
    end
  end
end
