class Case < ApplicationRecord

    scope :verified, -> { joins(:charities_cases).joins(:charities).where("charities_cases.state = 'approved'") }

    require 'carrierwave/orm/activerecord'
    mount_uploader :NID_img, NidUploader
    attr_accessor :perform_image_validation
    paginates_per 25
    validates :name , presence: true ,  format: { with: /\A[a-z\s]+\Z/i, message:  "Name must only contain letters." }
    validates :job , presence: true ,  format: { with: /\A[a-z\s]+\Z/i, message:  "Job must only contain letters." }
    validates :email, email_format: { message: 'Invalid email format' } , confirmation: true
    validates :national_id, format: { with: /\A[+-]?\d+\z/ , message:  "National Id must only contain Numbers." } , uniqueness: true , length: { is: 14  }
    validates :NID_img , presence:  {message:  "you have to upload a National Id image" } , if: :perform_image_validation
    validates :children_num, :inclusion => { :in => 0..8 }
    validates :marital_status , presence: true
    validates :phone, format: { with: /\A[+-]?\d+\z/ , message:  "Phone must only contain Numbers." } , uniqueness: true
    validates :priority, :inclusion => { :in => 1..5 } , allow_nil: true



    #charity&case relation
    has_many :charities_cases
    has_many :charities, through: :charities_cases
    accepts_nested_attributes_for :charities


    # doner&case relation
    has_many :donors_cases
    has_many :donors, through: :donors_cases
    belongs_to :city
end
