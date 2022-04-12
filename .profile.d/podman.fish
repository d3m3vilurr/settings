if type -q podman && ! type -q docker
    function docker; /usr/bin/env podman $argv; end
end

if type -q podman-compose && ! type -q docker-compose
    function docker-compose; /usr/bin/env podman-compose $argv; end
end
