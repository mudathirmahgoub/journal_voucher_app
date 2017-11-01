
describe Company do
  it 'should create a new movie' do
    @company_params = {"address"=>"University of Iowa", "default_currency"=>"USD", "email"=>"jeff@joe.com",
                       "name"=>"Joe place", "phone_number"=>"001 234 567 8999",
                       "start_date"=>"1/1/2017"}
    @company = Company.create @company_params
    expect (@company[:id]).should_not eq (0)
    expect (@company[:name]).should  eq ('Joe place')
    expect (@company[:address]).should  eq ('University of Iowa')
    expect (@company[:default_currency]).should  eq ('USD')
    expect (@company[:email]).should  eq ('jeff@joe.com')
    expect (@company[:phone_number]).should  eq ('001 234 567 8999')

  end
end
