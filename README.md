# Serverspec test

## Pre-requiste
You should have following to run these serverspec tests
* Ruby 2.4.1
* bundler

## Environment Variable

| Name              | Description                                     |
| ----              | -----------                                     |
| SERVERSPEC_IP     | IP to connect remote machine                    |
| SERVERSPEC_USER   | User to connect to remote machine               |
| SERVERSPEC_SSH_KEY| Private key of user to login to remote machine  |
| ASK_SSH_PASSWORD  | Set if you want to type password on console     |
| SERVERSPEC_PASSWORD | User password                                 |
| SSH_PORT          | Custom SSH Port                                 |
| RESULT_PATH       | Local directory path to store result            |

Update env.sh and execute `sh env.sh`

## How to Run
1. Clone this repo
2. Run `bundle install` to install all required gems.
3. Run command<br>
`cd serverspec-test && rake spec`
4. Navigate to `RESULT_PATH` to see rspec reports in `html` and `json` format.
