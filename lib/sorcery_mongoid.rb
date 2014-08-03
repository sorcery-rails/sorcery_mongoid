require "sorcery_mongoid/version"

module SorceryMongoid
  if defined?(Mongoid)
    require 'sorcery_mongoid/adapter'

    Mongoid::Document::ClassMethods.send :include, Sorcery::Model

    Mongoid::Document.send :define_method, :sorcery_adapter do
      @sorcery_adapter ||= Adapter.new(self)
    end

    Mongoid::Document::ClassMethods.send :define_method, :sorcery_adapter do
      Adapter.from(self)
    end
  end
end
