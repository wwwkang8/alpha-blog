module ApplicationHelper
  def gravatar_for(user, options = {size: 80})
    # Digest 해쉬로 파라메터로 넘겨 받은 유저의 이메일을 id로 함.
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    # 파라메터로 넘긴 size를 받아온다.
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    # 이미지 태그를 반환한다.
    image_tag(gravatar_url, alt: user.username, class:"img-circle")
  end
end
