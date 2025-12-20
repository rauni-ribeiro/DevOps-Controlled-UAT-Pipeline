import os
import sys

print("hello [uat] !!")

def build_message(environment: str, greeting_owner: str, build_id: str) -> str:
    """
    Reading Env vars - this is just a test
    """
    return f"[{environment}] - Hello {greeting_owner}, your current build is {build_id} "




def main() -> None:
    environment = os.getenv("ENVIRONMENT", "dev").lower()
    greeting_owner = os.getenv("GREETING_TARGET", "default_greeting")
    build_id = os.getenv("BUILD_BUILDID", "default_buildID")

    if environment != "uat":
        print(f"[SKIP] Environment '{environment}' is not UAT. Exiting.")
        sys.exit(0)
    
    msg = build_message(environment,greeting_owner,build_id)
    print(msg)

    #writing our first ever DevOps Artifact! :)
    os.makedirs("out", exist_ok=True)
    with open("out/message.txt","w",encoding="utf-8") as f:
        f.write(msg + "\n")



if __name__ == "__main__":
    main()