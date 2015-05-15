require 'spec_helper'

module NYUDL
  module MDI
    module Worker
      describe Base do
        context 'when instantiated' do
          it 'should be the correct class' do
            expect(Base.new).to be_an_instance_of(NYUDL::MDI::Worker::Base)
          end
        end
      end
    end
  end
end
