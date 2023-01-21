class AcceptDoctorMailer < ApplicationMailer
 def send_when_admin_reply(doctor, accept) #メソッドに対して引数を設定
  @doctor = doctor #ユーザー情報
  @answer = contact.reply_text #返信内容
   mail to: doctor.email, subject: '【Cest-facile運営事務局】 申請結果のご連絡につきまして'
 end

end
