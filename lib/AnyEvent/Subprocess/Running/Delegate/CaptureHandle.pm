package AnyEvent::Subprocess::Running::Delegate::CaptureHandle;
use Moose;
use AnyEvent::Subprocess::Done::Delegate::CaptureHandle;

with 'AnyEvent::Subprocess::Running::Delegate';

has 'output' => (
    traits   => ['String'],
    init_arg => undef,
    is       => 'ro',
    isa      => 'Str',
    default  => '',
    handles  => {
        '_append_output' => 'append',
    },
);

sub build_done_delegates {
    my $self = shift;

    return AnyEvent::Subprocess::Done::Delegate::CaptureHandle->new(
        name   => $self->name,
        output => $self->output,
    );
}

sub build_events {}
sub completion_hook {}

1;
