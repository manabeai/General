import socket

def socket_server():
    host = socket.gethostbyname(socket.gethostname())  
    port = 11000  # 任意のポート番号

    # ソケットの作成
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    try:
        # 通信の受け入れ準備
        server_socket.bind((host, port))
        server_socket.listen(10)  # 最大接続数を10に設定
        print(f"Server listening on {host}:{port}")
    except socket.error as e:
        print(f"Error while binding socket: {e}")
        server_socket.close()
        return

    # クライアントからの接続を待機
    try:
        client_socket, client_address = server_socket.accept()
        print(f"Connection established with {client_address}")
    except socket.error as e:
        print(f"Error while accepting connection: {e}")
        server_socket.close()
        return

    # 任意の処理
    data = client_socket.recv(1024).decode('utf-8')
    print(f"Received data: {data}")

    data = data.upper()

    client_socket.send(data.encode('utf-8'))

    # ソケットを閉じる
    client_socket.close()
    server_socket.close()

if __name__ == "__main__":
    socket_server()

