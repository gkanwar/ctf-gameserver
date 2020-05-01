import logging


def notify(key):
    try:
        import systemd.daemon
        if key.startswith('READY'):
            return systemd.daemon.notify(systemd.daemon.Notification.READY)
        elif key.startswith('WATCHDOG'):
            return systemd.daemon.notify(systemd.daemon.Notification.WATCHDOG)
        else:
            raise RuntimeError(f'Unknown key {key}')
    except ImportError:
        logging.info('Ignoring daemon notification due to missing systemd module', exc_info=True)
