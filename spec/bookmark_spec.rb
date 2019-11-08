require 'bookmark'

describe Bookmark do
  context "Class Methods" do
    describe '.all' do
      it 'returns all bookmakrs' do
        truncate_and_load_bookmarks
        bookmarks = Bookmark.all
        expect(bookmarks[0].title).to eq("Makers Academy")
        expect(bookmarks[1].title).to eq("Google")
        expect(bookmarks[2].title).to eq("Ask Jeeves")
      end
    end

    describe ".create" do
      it 'adds a new bookmark' do
        truncate_and_load_bookmarks
        guardian = Bookmark.create("http://www.theguardian.co.uk", "The Guardian")
        expect(Bookmark.all.last.title).to eq(guardian.title)
      end

      it "checks if a title is empty" do
        truncate_and_load_bookmarks
        expect(Bookmark.check_title("The Guardian")).to be(true)
        expect(Bookmark.check_title("")).to be(false)
      end

      it "checks a url is valid" do
        truncate_and_load_bookmarks
        expect(Bookmark.check_url("")).to be(nil)
        expect(Bookmark.check_url("http://www.theguardian.co.uk")).not_to be(nil)
      end
    end

    describe ".delete" do
      it 'deletes a specific bookmark' do
        truncate_and_load_bookmarks
        guardian = Bookmark.create("http://www.theguardian.co.uk", "The Guardian")
        Bookmark.remove(guardian.id)
        expect(Bookmark.all).to_not include(guardian)
      end
    end

    describe ".edit" do
      it "edits a specific bookmark" do
        truncate_and_load_bookmarks
        bookmark_1 = Bookmark.create("http://www.thegardian.co.uk", "The Gardian")
        bookmark_2 = gardian = Bookmark.create("http://www.theguardian.co.uk", "The Guardian")
        Bookmark.edit("http://www.theguardian.co.uk", "The Guardian", bookmark_1.id)
        expect(Bookmark.all.last.url).to eq("http://www.theguardian.co.uk")
        expect(Bookmark.all.last.url).not_to eq("http://www.thegardian.co.uk")
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
