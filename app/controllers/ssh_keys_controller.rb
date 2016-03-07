##
## Copyright [2013-2016] [Megam Systems]
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
## http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##
require 'sshkeys_finder'

class SshKeysController < ApplicationController
  respond_to :html, :js

  before_action :add_authkeys_for_api, only: [:index]

  def index
    @foundkeys ||= SSHKeysFinder.new(params).foundkeys
  end

  def create
    params[:sshoption] = Api::Sshkeys::NEW
    Api::Sshkeys.new.create_or_import(params)
    redirect_to(ssh_keys_path, :flash => { :success => "#{params[:ssh_keypair_name]} created successfully."}, format: 'js')
  end


  ## this downloads a key
  def edit
    params.merge!({:download_location => current_user.email+"_"+"#{params[:id]}"})
    Api::Sshkeys.new.download(params)
    send_file Rails.root.join("#{params[:download_location]}"), :x_sendfile=>true
  end

  ## this imports the ssh keys.
  def update
    params[:sshoption] = Api::Sshkeys::IMPORT
    Api::Sshkeys.new.create_or_import(params)
    redirect_to(ssh_keys_path, :flash => { :success => "#{params[:ssh_keypair_name]} imported successfully."}, format: 'js')
  end
end
