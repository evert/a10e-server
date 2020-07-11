import { render } from '../../templates';
type KeyValue = { [key: string]: string };

export function loginForm(msg: string, error: string, hiddenFields: KeyValue, registrationEnabled: boolean) {
  return render('login', {
    title: 'Login',
    msg: msg,
    error: error,
    hiddenFields: hiddenFields,
    action: '/login',
    registrationEnabled,
  });

}

export function mfaForm(
  msg: string,
  error: string,
  useTotp: boolean,
  useWebAuthn: boolean,
  hiddenFields: KeyValue
) {
  return render('mfa', {
    title: 'MFA',
    msg: msg,
    error: error,
    useTotp,
    useWebAuthn,
    hiddenFields: hiddenFields,
    action: '/mfa',
  });

}
