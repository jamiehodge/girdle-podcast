require_relative 'spec_helper'

describe Girdle::Podcast::Composition do
  
  describe '::qc_composition' do
    
    before do
      @task = Girdle::Task.qc_composition(
        composition: 'composition',
        width:       'width',
        height:      'height',
        duration:    'duration',
        parameters:  { a_param: 'a_value', another_param: 'another_value' }
      )  
    end
    
    it 'must set name' do
      @task.name.must_match 'qc_composition'
    end
    
    it 'must set command' do
      @task.command.must_equal '/usr/bin/qc2movie'
    end
    
    it 'must set composition argument' do
      @task.arguments[0].must_equal 'composition'
    end
    
    it 'must set output argument' do
      @task.arguments[1].must_equal "./#{@task.name}"
    end
    
    it 'must set width argument' do
      @task.arguments[2].must_equal 'width'
    end
    
    it 'must set height argument' do
      @task.arguments[3].must_equal 'height'
    end
    
    it 'must set duration argument' do
      @task.arguments[4].must_equal 'duration'
    end
    
    it 'must set parameters' do
      @task.arguments[5].must_equal '--a_param'
      @task.arguments[6].must_equal 'a_value'
      @task.arguments[7].must_equal '--another_param'
      @task.arguments[8].must_equal 'another_value'
    end
  end
  
end