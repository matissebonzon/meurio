class AddShareCountersToComments < ActiveRecord::Migration
  def up
    drop_view :comments
    create_view :comments, "
    SELECT t.id, t.created_at, t.text, t.hashtag, t.username, t.published_at, t.text_html, t.user_uid, t.retweet_count as share_count, t.favorite_count as like_count, 'tweets' as relname FROM tweets t
    UNION ALL 
    SELECT fp.id, fp.created_at, fp.text, fp.hashtag, fp.username, fp.published_at, fp.text_html, fp.user_uid, fp.share_count, fp.like_count, 'facebook_posts' as relname FROM facebook_posts fp;"
  end

  def down
    drop_view :comments
    create_view :comments, "
    SELECT t.id, t.created_at, t.text, t.hashtag, t.username, t.published_at, t.text_html, t.user_uid, 'tweets' as relname FROM tweets t
    UNION ALL 
    SELECT fp.id, fp.created_at, fp.text, fp.hashtag, fp.username, fp.published_at, fp.text_html, fp.user_uid, 'facebook_posts' as relname FROM facebook_posts fp;"
  end  
end
