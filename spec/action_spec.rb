require_relative 'spec_helper'

def must_set_subcommand(value)
  @task.arguments.first.must_equal value
end

def must_set_argument(argument, value)
  @task.arguments[
    @task.arguments.index("--#{argument}") + 1
    ].must_equal value
end

describe Girdle::Podcast::Action do
  
  before do
    @input = Girdle::Task.new(name: 'input')
  end
  
  describe '::add_chapter' do
    
    before do
      @task = Girdle::Task.add_chapter(
        input: @input,
        time: 'time',
        title: 'title'
      )
    end
    
    it 'must set name' do
      @task.name.must_match 'add_chapter'
    end
    
    it 'must set subcommand argument' do
      must_set_subcommand 'addchapter'
    end
    
    it 'must set base_dir argument' do
      must_set_argument 'basedir', '.'
    end
    
    it 'must set input argument' do
      must_set_argument 'input', 'input'
    end
    
    it 'must set time argument' do
      must_set_argument 'time', 'time'
    end
    
    it 'must set title argument' do
      must_set_argument 'title', 'title'
    end
    
    it 'must set output argument' do
      must_set_argument 'output', @task.name
    end
    
    it 'must set depends_on' do
      @task.depends_on.must_equal [ 'input' ]
    end
  end
  
  describe '::add_tracks' do
    
    before do
      @task = Girdle::Task.add_tracks(
        tracks: 'tracks',
        input: @input
      )
    end
    
    it 'must set name' do
      @task.name.must_match 'add_tracks'
    end
    
    it 'must set subcommand argument' do
      must_set_subcommand 'addtracks'
    end
    
    it 'must set base_dir argument' do
      must_set_argument 'basedir', '.'
    end
    
    it 'must set tracks argument' do
      must_set_argument 'tracks', 'tracks'
    end
    
    it 'must set input argument' do
      must_set_argument 'input', 'input'
    end
    
    it 'must set output argument' do
      must_set_argument 'output', @task.name
    end
    
    it 'must set depends_on' do
      @task.depends_on.must_equal [ 'input' ]
    end
  end
  
  describe '::annotate' do
    
    before do
      @task = Girdle::Task.annotate(
        input:       @input,
        title:       'title',
        comment:     'comment',
        description: 'description',
        author:      'author',
        keywords:    'keywords',
        copyright:   'copyright'
      )
    end
    
    it 'must set name' do
      @task.name.must_match 'annotate'
    end
    
    it 'must set subcommand argument' do
      must_set_subcommand 'annotate'
    end
    
    it 'must set base_dir argument' do
      must_set_argument 'basedir', '.'
    end
    
    it 'must set input argument' do
      must_set_argument 'input', 'input'
    end
    
    it 'must set title argument' do
      must_set_argument 'title', 'title'
    end
    
    it 'must set comment argument' do
      must_set_argument 'comment', 'comment'
    end
    
    it 'must set author argument' do
      must_set_argument 'author', 'author'
    end
    
    it 'must set keywords argument' do
      must_set_argument 'keywords', 'keywords'
    end
    
    it 'must set copyright argument' do
      must_set_argument 'copyright', 'copyright'
    end
    
    it 'must set depends_on' do
      @task.depends_on.must_equal [ 'input' ]
    end
  end
  
  describe '::chapterize' do
    
    before do
      @task = Girdle::Task.chapterize(
        input: @input
      )
    end
    
    it 'must set name' do
      @task.name.must_match 'chapterize'
    end
    
    it 'must set subcommand argument' do
      must_set_subcommand 'chapterize'
    end
    
    it 'must set base_dir argument' do
      must_set_argument 'basedir', '.'
    end
    
    it 'must set input argument' do
      must_set_argument 'input', 'input'
    end
    
    it 'must set output argument' do
      must_set_argument 'output', @task.name
    end
    
    it 'must set depends_on' do
      @task.depends_on.must_equal [ 'input' ]
    end
  end
  
  describe '::delete_tracks' do
    
    before do
      @task = Girdle::Task.delete_tracks(
        input: @input,
        type:  'type'
      )
    end
    
    it 'must set name' do
      @task.name.must_match 'delete_tracks'
    end
    
    it 'must set subcommand argument' do
      must_set_subcommand 'deletetracks'
    end
    
    it 'must set base_dir argument' do
      must_set_argument 'basedir', '.'
    end
    
    it 'must set input argument' do
      must_set_argument 'input', 'input'
    end
    
    it 'must set output argument' do
      must_set_argument 'output', @task.name
    end
    
    it 'must set type argument' do
      must_set_argument 'type', 'type'
    end
    
    it 'must set depends_on' do
      @task.depends_on.must_equal [ 'input' ]
    end
  end
  
  describe '::encode' do
    
    before do
      @task = Girdle::Task.encode(
        input: @input,
        encoder: 'encoder'
      )
    end
    
    it 'must set name' do
      @task.name.must_match 'encode'
    end
    
    it 'must set subcommand argument' do
      must_set_subcommand 'encode'
    end
    
    it 'must set base_dir argument' do
      must_set_argument 'basedir', '.'
    end
    
    it 'must set input argument' do
      must_set_argument 'input', 'input'
    end
    
    it 'must set encoder argument' do
      must_set_argument 'encoder', 'encoder'
    end
    
    it 'must set output argument' do
      must_set_argument 'output', @task.name
    end
    
    it 'must set depends_on' do
      @task.depends_on.must_equal [ 'input' ]
    end
  end
  
  describe '::extract_tracks' do
    
    before do
      @task = Girdle::Task.extract_tracks(
        input: @input,
        type: 'type'
      )
    end
    
    it 'must set name' do
      @task.name.must_match 'extract_tracks'
    end
    
    it 'must set subcommand argument' do
      must_set_subcommand 'extracttracks'
    end
    
    it 'must set base_dir argument' do
      must_set_argument 'basedir', '.'
    end
    
    it 'must set input argument' do
      must_set_argument 'input', 'input'
    end
    
    it 'must set output argument' do
      must_set_argument 'output', @task.name
    end
    
    it 'must set type argument' do
      must_set_argument 'type', 'type'
    end
    
    it 'must set depends_on' do
      @task.depends_on.must_equal [ 'input' ]
    end
  end
  
  describe '::get_poster_image' do
    
    before do
      @task = Girdle::Task.get_poster_image(
        input: @input,
        time:  'time'
      )
    end
    
    it 'must set name' do
      @task.name.must_match 'get_poster_image'
    end
    
    it 'must set subcommand' do
      must_set_subcommand 'getposterimage'
    end
    
    it 'must set input argument' do
      must_set_argument 'input', 'input'
    end
    
    it 'must set time argument' do
      must_set_argument 'time', 'time'
    end
    
    it 'must set output argument' do
      must_set_argument 'output', @task.name
    end
    
  end
  
  describe '::get_preview_movie' do; end
  
  describe '::join' do
    
    before do
      @task = Girdle::Task.join(
        input_1: 'input 1', 
        input_2: @input
        )
    end
    
    it 'must set name' do
      @task.name.must_match 'join'
    end
    
    it 'must set subcommand argument' do
      must_set_subcommand 'join'
    end
    
    it 'must set base_dir argument' do
      must_set_argument 'basedir', '.'
    end
    
    it 'must set input_1 argument' do
      must_set_argument 'input1', 'input 1'
    end
    
    it 'must set input_2 argument' do
      must_set_argument 'input2', 'input'
    end
    
    it 'must set output argument' do
      must_set_argument 'output', @task.name
    end
    
    it 'must set depends_on' do
      @task.depends_on.must_equal [ 'input' ]
    end
  end
  
  describe '::merge' do; end
  
  describe '::picture_in_picture' do; end
  
  describe '::qceffect' do; end
  
  describe '::qtimport' do
    
    before do
      @task = Girdle::Task.qt_import(
        input: @input,
        output: 'output',
        enable_auto_chaptering: true
      )
    end
    
    it 'must set name' do
      @task.name.must_match 'qt_import'
    end
    
    it 'must set subcommand argument' do
      must_set_subcommand 'qtimport'
    end
    
    it 'must set base_dir argument' do
      must_set_argument 'basedir', '.'
    end
    
    it 'must set input argument' do
      must_set_argument 'input', 'input'
    end
    
    it 'must set output argument' do
      must_set_argument 'output', @task.name
    end
    
    it 'must set auto chaptering argument' do
      @task.arguments.must_include('--enable_auto_chaptering')
    end
    
    it 'must not set auto chaptering argument' do
      Girdle::Task.qt_import(
        input: @input,
        output: 'output',
        enable_auto_chaptering: false
      ).arguments.wont_include('--enable_auto_chaptering')
    end
    
    it 'must set depends_on' do
      @task.depends_on.must_equal [ 'input' ]
    end
  end
  
  describe '::qtinfo' do
    
    before do
      @task = Girdle::Task.qt_info(
        input: @input,
        key:   'key'
      )
    end
    
    it 'must set name' do
      @task.name.must_match 'qt_info'
    end
    
    it 'must set subcommand' do
      must_set_subcommand 'qtinfo'
    end
    
    it 'must set basedir argument' do
      must_set_argument 'basedir', '.'
    end
    
    it 'must set input argument' do
      must_set_argument 'input', 'input'
    end
    
    it 'must set key argument' do
      must_set_argument 'key', 'key'
    end
    
    it 'must not set key argument' do
      Girdle::Task.qt_info(
        input: @input
      ).arguments.wont_include '--key'
    end
    
    it 'must set depends_on' do
      @task.depends_on.must_equal [ 'input' ]
    end
  end
  
  describe '::split' do; end
  
  describe '::trim' do; end
  
  describe '::watermark' do; end
end