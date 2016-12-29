User.create!([
  {email: "b@bdc.com", encrypted_password: "$2a$11$oLDV9fmFUxk7OU/WPqwOt.AHDsnSgGLCRYBJvoa0GP5Xlq9hRDCey", admin: true, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2016-12-28 19:05:51", last_sign_in_at: "2016-12-27 03:06:03", current_sign_in_ip: "::1", last_sign_in_ip: "::1", provider: nil, uid: nil, name: nil, oauth_token: nil, oauth_token_expires_at: nil, username: "bdc"}
])
Artist.create!([
  {artist_name: "Brandon De Carlo"}
])
Comment.create!([
  {content: "nice!!", user_id: 1, song_id: 1}
])
Genre.create!([
  {genre_name: "Techno"},
  {genre_name: "Tech House"},
  {genre_name: "House"},
  {genre_name: "DJ Tools"}
])
Release.create!([
  {release_name: "Nascense EP"},
  {release_name: ""},
  {release_name: "Premonition EP"},
  {release_name: "One Would Hope EP"}
])
Song.create!([
  {title: "Trepidation", artist_id: 1, genre_id: 1, release_id: 1, image_file_name: "Nascence_EP_med_thmb.jpg", image_content_type: "image/jpeg", image_file_size: 18126, image_updated_at: "2016-12-27 03:11:08"},
  {title: "Non Grata", artist_id: 1, genre_id: 2, release_id: 1, image_file_name: "Nascence_EP_med_thmb.jpg", image_content_type: "image/jpeg", image_file_size: 18126, image_updated_at: "2016-12-27 04:02:20"},
  {title: "Prosthetic Asthetic", artist_id: 1, genre_id: 2, release_id: 1, image_file_name: "Nascence_EP_med_thmb.jpg", image_content_type: "image/jpeg", image_file_size: 18126, image_updated_at: "2016-12-27 04:03:26"},
  {title: "Premonition", artist_id: 1, genre_id: 3, release_id: 3, image_file_name: "PremonitionEPthumb.jpg", image_content_type: "image/jpeg", image_file_size: 45129, image_updated_at: "2016-12-27 04:17:54"},
  {title: "Maya", artist_id: 1, genre_id: 2, release_id: 3, image_file_name: "PremonitionEPthumb.jpg", image_content_type: "image/jpeg", image_file_size: 45129, image_updated_at: "2016-12-29 14:56:25"},
  {title: "Gravitas", artist_id: 1, genre_id: 4, release_id: 3, image_file_name: "PremonitionEPthumb.jpg", image_content_type: "image/jpeg", image_file_size: 45129, image_updated_at: "2016-12-29 14:58:05"},
  {title: "Adobo", artist_id: 1, genre_id: 1, release_id: 4, image_file_name: "OneWouldHopeThumb.jpg", image_content_type: "image/jpeg", image_file_size: 31513, image_updated_at: "2016-12-29 15:08:36"},
  {title: "What The Dickens", artist_id: 1, genre_id: 1, release_id: 4, image_file_name: "OneWouldHopeThumb.jpg", image_content_type: "image/jpeg", image_file_size: 31513, image_updated_at: "2016-12-29 15:10:58"},
  {title: "Off The Record", artist_id: 1, genre_id: 1, release_id: 4, image_file_name: "OneWouldHopeThumb.jpg", image_content_type: "image/jpeg", image_file_size: 31513, image_updated_at: "2016-12-29 15:12:02"}
])
SongRelease.create!([
  {song_id: 1, artist_id: nil, release_id: 2},
  {song_id: 2, artist_id: nil, release_id: 2},
  {song_id: 3, artist_id: nil, release_id: 2},
  {song_id: 4, artist_id: nil, release_id: 2},
  {song_id: 5, artist_id: nil, release_id: 2},
  {song_id: 6, artist_id: nil, release_id: 2},
  {song_id: 7, artist_id: nil, release_id: 2},
  {song_id: 8, artist_id: nil, release_id: 2},
  {song_id: 9, artist_id: nil, release_id: 2}
])
