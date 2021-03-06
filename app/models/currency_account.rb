class CurrencyAccount < ActiveRecord::Base
  belongs_to :currency
  belongs_to :user
  has_many :play_currency_account_links, :dependent => :destroy
  has_many :plays, :through => :play_currency_account_links

  validates_presence_of :currency_id,:user_id,:player_class,:name
  validates_uniqueness_of :currency_id, :scope => [:name,:player_class], :message => 'You are allready a member of that currency'
  validates_uniqueness_of :name, :scope => [:currency_id,:player_class], :message => 'You allready have an account with that name in the currency'

  attr_accessor :destroyed
  after_destroy :mark_as_destroyed
  def mark_as_destroyed
    self.destroyed = true
  end
  
  def setup
    self.state = currency.api_initialize_new_player_state(player_class) if currency
  end

  def get_state
    s = self.state
   begin
      self.state = YAML.load(s) if s.class == String
   rescue Exception => e
     raise "Err in CA #{self.id}: #{e.message}"
     # return {"corrupted state"=>s}
   end
    self.state
  end
  
  def render_state
    currency.api_render_player_state(self).split(/; /).join('<br/>')
  end

  def name_as_html_id
    name.downcase.gsub(/\s+/,'_').gsub(/\W/,'X')
  end

  protected
  def validate
    if currency
      errors.add("player_class", "#{player_class} does not exist in #{currency.name}") if !currency.api_player_classes.include?(player_class)
    end
  end
end
