require 'bookmark'

describe Bookmark do
  context "Class Methods"
    describe '.all' do
      it 'returns all bookmakrs' do
        truncate_and_load_bookmarks
        bookmarks = Bookmark.all

        expect(bookmarks).to include(["http://www.makersacademy.com", "Makers Academy"])
        expect(bookmarks).to include(["http://www.google.com", "Google"])
        expect(bookmarks).to include(["http://www.askjeeves.com", "Ask Jeeves"])
      end
    end

    describe ".create" do
      it 'adds a new bookmark' do
        Bookmark.create("http://www.theguardian.co.uk", "The Guardian")
        expect(Bookmark.all).to include(["http://www.theguardian.co.uk", "The Guardian"])
      end
    end

    describe ".delete" do
      it 'deletes a specific bookmark' do
        Bookmark.create("http://www.theguardian.co.uk", "The Guardian")
        Bookmark.remove("http://www.theguardian.co.uk")
        expect(Bookmark.all).to_not include(["http://www.theguardian.co.uk", "The Guardian"])
      end
    end

  context "instance methods" do
    describe ".create" do
      it "creates a new bookmark object" do
        gmail = Bookmark.create("https://gmail.com", "Gmail")
        expect(gmail).to be_a(Bookmark)
      end
    end
  end
end
