require "date"

@id = 0
@events = {
  "2020": {
    "45": [
      {
        id: (@id = @id.next),
        start_date: DateTime.new(2020, 11, 3),
        title: "Ruby Basics 1",
        calendar: "tech",
        end_date: "",
        notes: "Ruby Basics 1 notes",
        guests: %w[Wences Deyvi]
      },
      {
        id: (@id = @id.next),
        start_date: DateTime.new(2020, 11, 3, 12, 0, 0),
        title: "English Course B1",
        calendar: "english",
        end_date: DateTime.new(2020, 11, 3, 13, 30, 0),
        notes: "",
        guests: %w[Stephanie Patricia]
      },
      {
        id: (@id = @id.next),
        start_date: DateTime.new(2020, 11, 4),
        title: "Ruby Basics 2",
        calendar: "tech",
        end_date: "",
        notes: "Ruby Basics 2 notes",
        guests: %w[Wences Deyvi]
      },
      {
        id: (@id = @id.next),
        start_date: DateTime.new(2020, 11, 4, 12, 45, 0),
        title: "Soft Skill Session - Resilience",
        calendar: "soft skills",
        end_date: DateTime.new(2020, 11, 4, 13, 30, 0),
        notes: "",
        guests: %w[Jordi]
      },
      {
        id: (@id = @id.next),
        start_date: DateTime.new(2020, 11, 4, 18, 30, 0),
        title: "Conversation Club",
        calendar: "english",
        end_date: DateTime.new(2020, 11, 4, 19, 0o0, 0),
        notes: "",
        guests: %w[Andrea]
      },
      {
        id: (@id = @id.next),
        start_date: DateTime.new(2020, 11, 5),
        title: "Ruby Methods",
        calendar: "tech",
        end_date: "",
        notes: "Ruby Methods notes",
        guests: %w[Wences Deyvi]
      },
      {
        id: (@id = @id.next),
        start_date: DateTime.new(2020, 11, 5, 12, 0, 0),
        title: "English Course B1",
        calendar: "english",
        end_date: DateTime.new(2020, 11, 5, 13, 30, 0),
        notes: "",
        guests: %w[Stephanie Patricia]
      },
      {
        id: (@id = @id.next),
        start_date: DateTime.new(2020, 11, 6),
        title: "Dates",
        calendar: "tech",
        end_date: "",
        notes: "Dates notes",
        guests: %w[Wences Deyvi]
      },
      {
        id: (@id = @id.next),
        start_date: DateTime.new(2020, 11, 6),
        title: "Extended Project",
        calendar: "tech",
        end_date: "",
        notes: "",
        guests: %w[Wences Deyvi]
      },
      {
        id: (@id = @id.next),
        start_date: DateTime.new(2020, 11, 6, 12, 0, 0),
        title: "Summary Workshop",
        calendar: "tech",
        end_date: DateTime.new(2020, 11, 6, 13, 30, 0),
        notes: "",
        guests: %w[Wences Deyvi]
      },
      {
        id: (@id = @id.next),
        start_date: DateTime.new(2020, 11, 7),
        title: "Extended Project",
        calendar: "tech",
        end_date: "",
        notes: "",
        guests: %w[Wences Deyvi]
      },
      {
        id: (@id = @id.next),
        start_date: DateTime.new(2020, 11, 7, 12, 0, 0),
        title: "English for Engineers",
        calendar: "english",
        end_date: DateTime.new(2020, 11, 7, 13, 30, 0),
        notes: "",
        guests: %w[Patricia]
      },
      {
        id: (@id = @id.next),
        start_date: DateTime.new(2020, 11, 8, 10, 0, 0),
        title: "Breakfast with my family",
        calendar: "default",
        end_date: DateTime.new(2020, 11, 8, 11, 0o0, 0),
        notes: "",
        guests: []
      },
      {
        id: (@id = @id.next),
        start_date: DateTime.new(2020, 11, 8, 15, 0, 0),
        title: "Hackaton",
        calendar: "default",
        end_date: DateTime.new(2020, 11, 8, 20, 0o0, 0),
        notes: "Never rest!",
        guests: []
      }
    ],
    "46": [
      {
        id: (@id = @id.next),
        start_date: DateTime.new(2020, 11, 11, 18, 30, 0),
        title: "Conversation Club",
        calendar: "english",
        end_date: DateTime.new(2020, 11, 11, 19, 0o0, 0),
        notes: "",
        guests: %w[Andrea]
      },
      {
        id: (@id = @id.next),
        start_date: DateTime.new(2020, 11, 13),
        title: "Extended Project",
        calendar: "tech",
        end_date: "",
        notes: "",
        guests: %w[Wences Deyvi]
      },
      {
        id: (@id = @id.next),
        start_date: DateTime.new(2020, 11, 13, 12, 0, 0),
        title: "Summary Workshop",
        calendar: "tech",
        end_date: DateTime.new(2020, 11, 13, 13, 30, 0),
        notes: "",
        guests: %w[Wences Deyvi]
      },
      {
        id: (@id = @id.next),
        start_date: DateTime.new(2020, 11, 14),
        title: "Extended Project",
        calendar: "tech",
        end_date: "",
        notes: "",
        guests: %w[Wences Deyvi]
      }
    ]
  }
}
