import socket

def socket_client():
    host = socket.gethostbyname(socket.gethostname())  # ローカルIPを取得
    port = 11000  # サーバーと同じポート番号

    # ソケットの作成
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    try:
        # サーバーに接続
        client_socket.connect((host, port))
        print(f"Connected to server at {host}:{port}")

        # サーバーにデータを送信
        message = "Hello Server"
        client_socket.sendall(message.encode('utf-8'))

        # サーバーからの応答を受信
        data = client_socket.recv(1024).decode('utf-8')
        print(f"Received from server: {data}")
    except socket.error as e:
        print(f"Error while connecting to server: {e}")
    finally:
        client_socket.close()

if __name__ == "__main__":
    socket_client()
