<template>
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-8 col-lg-6">
        <b-card class="p-4 shadow-sm" header="Registro" header-bg-variant="primary" header-text-variant="light">
          <b-form @submit.prevent="submitSignup">
            <b-form-group
              label="Nombre"
              label-for="input-name"
              label-cols-md="4"
              label-class="text-md-right"
            >
              <b-form-input
                id="input-name"
                v-model="form.name"
                placeholder="Ingresa tu nombre"
                required
                :state="form.name ? true : null"
              ></b-form-input>
              <b-form-invalid-feedback id="input-name-feedback">El nombre es obligatorio.</b-form-invalid-feedback>
            </b-form-group>
            <b-form-group
              label="Correo Electrónico"
              label-for="input-email"
              label-cols-md="4"
              label-class="text-md-right"
            >
              <b-form-input
                id="input-email"
                v-model="form.email"
                type="email"
                placeholder="Ingresa tu correo electrónico"
                required
                :state="form.email ? true : null"
              ></b-form-input>
              <b-form-invalid-feedback id="input-email-feedback">El correo electrónico es obligatorio.</b-form-invalid-feedback>
            </b-form-group>
            <b-form-group
              label="Contraseña"
              label-for="input-password"
              label-cols-md="4"
              label-class="text-md-right">
                <b-form-input
                  id="input-password"
                  v-model="form.password"
                  type="password"
                  placeholder="Ingresa la contraseña"
                  required
                  :state="form.password ? true : null"
                >
                </b-form-input>
              <b-form-invalid-feedback id="input-password-feedback">La contraseña es obligatoria.</b-form-invalid-feedback>
            </b-form-group>
            <b-form-group
              label="Número de Teléfono"
              label-for="input-phone"
              label-cols-md="4"
              label-class="text-md-right"
            >
              <b-form-input
                id="input-phone"
                v-model="form.phoneNumber"
                type="tel"
                placeholder="Ingresa tu número de teléfono"
                required
                :state="form.phoneNumber ? true : null"
              ></b-form-input>
              <b-form-invalid-feedback id="input-phone-feedback">El número de teléfono es requerido.</b-form-invalid-feedback>
            </b-form-group>
            <b-button type="submit" variant="primary" class="w-100 mt-3">Enviar</b-button>
          </b-form>
          <div class="mt-4">
            <b-alert v-model="success" variant="success" show>{{ successmessage }}</b-alert>
            <b-alert v-model="error" variant="danger" class="mt-3">
              {{ errormessage }}
            </b-alert>
          </div>
        </b-card>
      </div>
    </div>
  </div>
</template>

<script lang="ts">

  import { defineComponent, ref } from 'vue';

  export default defineComponent({
    setup() {
      const form = ref({
        email: '',
        name: '',
        password: '',
        phoneNumber: ''
      });

      const success = ref(false);
      const error = ref(false);
      const errormessage = ref<string | null>(null);
      const successmessage = "Tu cuenta ha sido creada con éxito. ¡Bienvenido!";
      const submitSignup = async () => {
        try {
        
          if (!form.value.email || !form.value.name ||  !form.value.password || !form.value.phoneNumber) {
            errormessage.value ='Todos los campos del formulario son obligatorios.';
          }

          const response = await fetch('http://localhost:3000/api/users', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(form.value)
          });

          if (!response.ok) {
            const errorApi = await response.json();
            error.value = true;
            success.value = false;
            errormessage.value = errorApi.message || `¡Error HTTP! Estado: ${response.status}`;
          } else { 
            success.value = true;
          }
        } catch (err) {
          console.error('Error al enviar el registro:', err);
          error.value = true;
          errormessage.value = err.message || 'Error al enviar el registro.';
        }
      };

      return {
        form,
        submitSignup,
        error,
        success,
        errormessage,
        successmessage
      };
    },
  });
</script>