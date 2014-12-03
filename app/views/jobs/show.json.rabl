object @job
attributes :id, :title, :description
if action_name != "index"
  node(:edit) {edit_job_path(@job, format: :json)}
  node(:apply) {new_job_applicant_path(@job, format: :json)}
end