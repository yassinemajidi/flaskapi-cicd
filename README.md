# flaskapi-cicd

A Python Flask API that fetches random images from the internet and uploads them to AWS S3. DevOps pipeline using Docker, Kubernetes, GitLab CI/CD, Terraform, and AWS services.

## I. Project structure

┣ 📂application/api

┣ 📂infrastructure

┗ 📜.gitlab-ci.yml

## II. Application
┣ 📂application

This is the folder of the Flask api. It gets random images with api/get-random-image and upload it to s3 bucket with api/upload-random-image

To use the image of this api using docker:

  ```terminal|command=1|title=bash
  docker pull yassinemajidi/randomimage-api:1.0.0
  docker run -t --name randomimageapi -p 4545:4545 yassinemajidi/randomimage-api:1.0.0
  ```

In this project we push this image to registry.gitlab.com/yassinemidfig/flaskapi-cicd:latest

## III. Infrastructure
┣ 📂infrastructure

In the ┣ 📂modules folder there is the eks and s3 terraform infrastructure configuration started with main.tf

You need to set up your terraform backend s3 bucket:

  ```terminal|command=1|title=bash
  aws s3api create-bucket --bucket <your-terraform-backend-bucket> --region us-east-1
  ```

change your-terraform-backend-bucket with your s3 bucket

You can create the infrastructure using:
  ```terminal|command=1|title=bash
  cd infrastructure
  terraform init
  terraform apply
  ```
## IV. Gitlab cicd

I have this gitlab cicd in both app and infra folders with this stages

  - test
  - build
  - validate
  - plan
  - apply

This can automate the creation of the image of the app and the infrastructure to deploy it.

You can access the pipelines in my gitlab repository https://gitlab.com/yassinemidfig/flaskapi-cicd
