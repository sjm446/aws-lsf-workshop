#!/bin/sh

REGION=eu-west-1

UNUSEDVOLS=`aws ec2 describe-volumes --query "Volumes[*].{ID:VolumeId}" --filter "Name=status,Values=available" --region=$REGION --output=text`

for i in $UNUSEDVOLS
do
 echo Found unused volume $i
 aws ec2 delete-volume --volume-id $i --region=$REGION
done
