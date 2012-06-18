require 'spec_helper'

describe 'puppet::client', :type => :class do
  context 'on Ubuntu 12.04 (Precise)' do
    let(:facts) { { 
      :lsbdistcodename  => 'precise',
      :lsbdistrelease   => '12.04',
      :operatingsystem  => 'Ubuntu',
    } }

    let(:params) { { :monitor => false } }

    it do
      should_not contain_class('puppet::client::monitor')
    end

    directories = [
      '/etc/puppet',
      '/etc/puppet/modules',
      '/etc/puppet/manifests',
      '/etc/puppet/templates',
    ]

    directories.each do |dirs|
      it do
        should contain_file(dirs).with({
          'ensure'  => 'directory',
          'group'   => 'root',
          'mode'    => '0644',
          'owner'   => 'root',
        })
      end
    end

    it do
      should contain_file('/etc/puppet/puppet.conf').with({
        'group'   => 'root',
        'mode'    => '0644',
        'owner'   => 'root',
      })
    end

    it do
      should contain_file('/etc/default/puppet').with({
        'ensure'  => 'file',
        'group'   => 'root',
        'mode'    => '0644',
        'owner'   => 'root',
      })
    end

    it do
      should contain_package('puppet').with_ensure('present')
    end

    it do
      should contain_service('puppet').with({
        'ensure'      => true,
        'enable'      => true,
        'hasstatus'   => true,
        'hasrestart'  => true,
      })
    end

    context 'service disabled' do
      let(:params) { {
        :enable   => false,
        :monitor  => false,
      } }
      it do
        should contain_service('puppet').with({
          'ensure'      => false,
          'enable'      => false,
          'hasstatus'   => true,
          'hasrestart'  => true,
        })
      end
    end
  end
end

# vim:sw=2:ts=2:expandtab:textwidth=79
