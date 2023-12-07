FROM public.ecr.aws/lambda/ruby:3.2

COPY ../app ${LAMBDA_TASK_ROOT}

RUN yum update -y \
    && yum install -y amazon-linux-extras \
    && amazon-linux-extras enable postgresql14 \
    && yum group install "Development Tools" -y

RUN yum install -y postgresql postgresql-devel

WORKDIR ${LAMBDA_TASK_ROOT}

RUN gem update bundler \
    && bundle config set --local path 'vendor/bundle' \
    && bundle install

COPY ./docker/*.sh ./docker/