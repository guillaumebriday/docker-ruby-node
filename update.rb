variants = [nil, 'slim', 'alpine']

Dir.entries('.').sort.reverse.each do |version|
  next if (!File.directory?(version) || ['.', '..', '.git'].include?(version))

  variants.each do |variant|
    tag = [version, variant].reject(&:nil?).join('-')
    dockerfile = [version, variant].reject(&:nil?).join('/')
    image = "guillaumebriday/ruby-node:#{tag}"

    commands = [
      "echo \"Building #{image}\"",
      "docker pull ruby:#{tag}",
      "docker build -t #{image} ./#{dockerfile}",
      "docker push #{image}",
      "docker rmi ruby:#{version} #{image}"
    ]

    system(commands.join(' && '))
  end
end
