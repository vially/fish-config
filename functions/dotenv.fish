function dotenv --description 'Load environment variables from the .env file'
  if test -e .env
    for line in (cat .env)
      set -xg (echo $line | cut -d = -f 1) (echo $line | cut -d = -f 2-)
    end
  end
end
