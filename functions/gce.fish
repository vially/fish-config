function gce
  if [ (count $argv) -eq 0 ]
    echo 'Usage: gce [create|scale|delete]'
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
  set -l zone_flag

  set -l cmd $argv[1]

  set -l name (tq name $config_file ^ /dev/null)
  if test $status -eq 0
    set instance_name $name
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

  set -l zone (tq zone $config_file ^ /dev/null)
  if test $status -eq 0
    set zone_flag "--zone" $zone
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
    if [ (count $argv) -gt 1 ]
      set instance_name $argv[2]
    end

    gcloud compute instances create $instance_name $machine_flag $image_flag $preemptible_flag $tags_flag $metadata_flag $zone_flag
  else if [ $cmd = "scale" ]
      set -l instance_count $argv[2]
      set -l running_instances (gcloud compute instances list --regexp="$instance_name-\\d+" $zone_flag --format=json | jq --raw-output ".[].name")
      if [ $instance_count = "0" ]
        gcloud compute instances delete --quiet $zone_flag $running_instances
      else
        for x in (seq $instance_count)
          set -l instance_range_name "$instance_name-$x"
          gcloud compute instances create $instance_range_name $machine_flag $image_flag $preemptible_flag $tags_flag $metadata_flag $zone_flag
        end
      end
  else if [ $cmd = "delete" ]
    if [ (count $argv) -gt 1 ]
      set instance_name $argv[2]
    end

    gcloud compute instances delete $zone_flag $instance_name
  end
end
