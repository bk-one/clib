FactoryBot.define do
  factory :job do
    person
    creative_work factory: :comic
    name { Job::VALID_JOB_NAMES.sample }
  end
end
