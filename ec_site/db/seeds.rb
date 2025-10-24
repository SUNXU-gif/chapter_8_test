Admin.destroy_all
User.destroy_all
Tag.destroy_all
Book.destroy_all
Cart.destroy_all
Order.destroy_all
OrderDetail.destroy_all

admin = Admin.create!(email: "admin@example.com", password: "password")
u1 = User.create!(email: "bookuser1@example.com", password: "password")
u2 = User.create!(email: "bookuser2@example.com", password: "password")

t1 = Tag.create!(tag_name: "料理")
t2 = Tag.create!(tag_name: "地図")
t3 = Tag.create!(tag_name: "技術")

b1 = Book.create!(book_name: "日本地図", author_name: "日本 作家", issue_date: Date.new(2025,2,12), product_display: true, price: 1200, status: "販売中")
b2 = Book.create!(book_name: "和食の基本", author_name: "日本 作家", issue_date: Date.new(2025,2,12), product_display: true, price: 1000, status: "販売中")
b3 = Book.create!(book_name: "Rails入門", author_name: "技術太郎", issue_date: Date.new(2025,1,10), product_display: false, price: 2000, status: "準備中")

Tagging.create!(book: b1, tag: t2)
Tagging.create!(book: b2, tag: t1)
Tagging.create!(book: b3, tag: t3)
