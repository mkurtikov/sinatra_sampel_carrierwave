module Workers
  class Image
    include Sidekiq::Worker

    def perform(id)
      sleep 1
      logger.info "Job's done: #{id}"
    end
  end
end
