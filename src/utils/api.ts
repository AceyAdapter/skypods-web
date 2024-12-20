export async function checkAPI() {
  try {
    fetch(process.env.BASE_URL ?? "").then((res) => {
      if (res.status == 200) {
        console.log(true);
      } else {
        console.log(false);
      }
    });
  } catch (e) {
    console.log(e);
  }
}
