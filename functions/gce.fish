function gce
  if [ (count $argv) -eq 0 ]
    echo 'Usage: gce [create|delete]'
    return 1
  end

  # default values
  set -l config_file gce_instance.toml
  set -l instance_name "test-vm"
  set -l machine_flag "--machine-type" "f1-micro"
  set -l image_flag "--image" "container-vm"
  set -l preemptible_flag "--preemptible"
  set -l metadata_flag
  set -l tags_flag

  set -l cmd $argv[1]

  if [ (count $argv) -gt 1 ]
    set instance_name $argv[2]
  else
    set -l name (tq name $config_file)
    if test $status -eq 0
      set instance_name $name
    end
  end

  set -l machine (tq machine $config_file ^ /dev/null)
  if test $status -eq 0
    set machine_flag "--machine-type" $machine
  end

  set -l image (tq image $config_file ^ /dev/null)
  if test $status -eq 0
    set image_flag "--image" $image
  end

  set -l preemptible (tq preemptible $config_file ^ /dev/null)
  if test $status -eq 0 -a "$preemptible" = "false"
    set preemptible_flag ""
  end

  set -l tags (tq tags $config_file ^ /dev/null)
  if test $status -eq 0
    set tags_flag "--tags" $tags
  end

  if [ -e containers.tmpl.yaml ]
    set -l container_manifest_arr (expandenv containers.tmpl.yaml)
    set -l container_manifest
    for line in $container_manifest_arr
      set container_manifest "$container_manifest"$line\n
    end

    set metadata_flag "--metadata" "^GCLOUD_SAFER_DELIMITER^google-container-manifest=$container_manifest"
  else if [ -e containers.yaml ]
    set metadata_flag "--metadata-from-file" "google-container-manifest=containers.yaml"
  end

  if [ $cmd = "create" ]
    gcloud compute instances create $instance_name $machine_flag $image_flag $preemptible_flag $tags_flag $metadata_flag
  else if [ $cmd = "delete" ]
    gcloud compute instances delete $instance_name
  end
end
