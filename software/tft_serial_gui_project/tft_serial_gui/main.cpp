

#include <Windows.h>

#include <iostream>
#include <fstream>
#include <string.h>

#include <strsafe.h>
#include <tchar.h> 

#include "resource.h"

using namespace std;

#define File_Menu_Open			1
#define File_Menu_Exit			2
#define But_Open_Port			3
#define But_Close_Port			4
#define But_TFT_Test			5
#define But_TFT_CMD_SEND		6

#define Combo_Cmd				7
#define But_Send_Data			8


HMENU hMenu;

HWND hFile_Sel;

HWND hEdit_bkl;
HWND hEdit_cols;
HWND hEdit_rows;
HWND hEdit_cole;
HWND hEdit_rowe;
HWND hEdit_pgdis;
HWND hEdit_lddis;
HWND hEdit_add_inc;

HWND hBut_open;
HWND hBut_close;
HWND hBut_tft_test;
HWND hBut_tft_cmd_send;

HWND hComboBox_bd;
HWND hComboBox_sb;
HWND hComboBox_pb;
HWND hComboBox_port;
HWND hComboBox_cmd;

HWND hBut_Send;

HANDLE hIcon;

HANDLE serialHandle;

DWORD file_size;

BOOL port_ok = FALSE;

ifstream myfile;
char * memblock;

LRESULT CALLBACK WindowProcedure(HWND, UINT, WPARAM, LPARAM);

void AddMenus(HWND);
void AddControls(HWND);

void combobox_init(HWND hComboBox, int array_sel);

void com_port_check(HWND hComboBox);
void open_com_port(void);
void close_com_port(void);
void tft_test_port(void);

void send_uart_str(char* str_uart, DWORD dNoOFBytestoWrite);
void cmd_combo_sel(HWND hComboBox);

void open_file(HWND);
void send_data(void);

int WINAPI WinMain(HINSTANCE hInst, HINSTANCE hPrevInst, LPSTR args, int ncmdshow) {

	WNDCLASSW wc = {0};

	wc.hbrBackground = (HBRUSH)COLOR_WINDOW;
	wc.hCursor = LoadCursor(NULL, IDC_ARROW);
	wc.hInstance = hInst;
	wc.lpszClassName = L"myWindowClass";
	wc.lpfnWndProc = WindowProcedure;
	//wc.hIcon = LoadIcon(hInst, MAKEINTRESOURCE(IDI_ICON1));

	if (!RegisterClassW(&wc)) {
		return -1;
	}

	CreateWindowW(
		L"myWindowClass",
		L"UART TFT Controller",
		WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU |
		WS_MINIMIZEBOX | WS_MAXIMIZEBOX | WS_VISIBLE,
		100, 100, 1125, 640,
		NULL, NULL, hInst, NULL
	);

	MSG msg = { 0 };

	while (GetMessage(&msg, NULL, NULL, NULL)) {

		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}

	return 0;
}


LRESULT CALLBACK WindowProcedure(HWND hWnd, UINT msg, WPARAM wp, LPARAM lp) {

	HINSTANCE hInstance;

	switch (msg){

		case WM_COMMAND:

			if (HIWORD(wp) == CBN_SELCHANGE) {
				if (LOWORD(wp) == Combo_Cmd) {
					cmd_combo_sel(hComboBox_cmd);
				}
			}

			// the W parameter will pass into here
			switch (wp) {

				case But_Send_Data:
					send_data();
					break;

				case File_Menu_Open:
					if(port_ok)
						open_file(hWnd);
					break;

				case But_Open_Port:
					open_com_port();
					break;

				case But_Close_Port:
					close_com_port();
					break;

				case But_TFT_Test:
					tft_test_port();
					break;

				case File_Menu_Exit:
					myfile.close();
					CloseHandle(serialHandle);
					DestroyWindow(hWnd);
					break;

				case MF_STRING:
					MessageBox(hWnd, L"Brian Sune\r\nUART TFT Controller V 1.0", L"About", MB_OK);
					break;
			}

			break;
		case WM_CREATE:

			hInstance = ((LPCREATESTRUCT)lp)->hInstance;
			hIcon = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_ICON1));
			SendMessage(hWnd, WM_SETICON, ICON_BIG, (LPARAM)hIcon);

			AddMenus(hWnd);
			AddControls(hWnd);
			break;
		case WM_DESTROY:
			myfile.close();
			PostQuitMessage(0);
			break;

		default:
			return DefWindowProcW(hWnd, msg, wp, lp);
	}
}

void AddMenus(HWND hWnd) {

	hMenu = CreateMenu();

	HMENU hFileMneu = CreateMenu();
	HMENU hSubMneu = CreateMenu();

	AppendMenu(hFileMneu, MF_STRING, File_Menu_Open, L"Open");
	AppendMenu(hFileMneu, MF_STRING, File_Menu_Exit, L"Exit");
	AppendMenu(hFileMneu, MF_SEPARATOR, NULL, NULL);

	AppendMenu(hMenu, MF_POPUP, (UINT_PTR)hFileMneu, L"File");
	AppendMenu(hMenu, MF_STRING, NULL, L"About");

	// add menu to the main window
	SetMenu(hWnd, hMenu);
}

void AddControls(HWND hWnd) {

	CreateWindowW(
		L"static",
		L"Baud Rate",
		WS_VISIBLE | WS_CHILD,
		850, 25, 100, 35,
		hWnd,
		NULL, NULL, NULL
	);

	hComboBox_bd = CreateWindowW(
		L"combobox",
		NULL,
		WS_CHILD | WS_VISIBLE | CBS_DROPDOWNLIST | CBS_HASSTRINGS | WS_VSCROLL,
		975, 25, 100, 400,
		hWnd,
		NULL, NULL, NULL
	);

	combobox_init(hComboBox_bd, 0);

	CreateWindowW(
		L"static",
		L"Stop Bits",
		WS_VISIBLE | WS_CHILD,
		850, 65, 100, 35,
		hWnd,
		NULL, NULL, NULL
	);

	hComboBox_sb = CreateWindowW(
		L"combobox",
		NULL,
		WS_CHILD | WS_VISIBLE | CBS_DROPDOWNLIST | CBS_HASSTRINGS | WS_VSCROLL,
		975, 65, 100, 400,
		hWnd,
		NULL, NULL, NULL
	);

	combobox_init(hComboBox_sb, 1);

	CreateWindowW(
		L"static",
		L"Parity Bits",
		WS_VISIBLE | WS_CHILD,
		850, 105, 100, 35,
		hWnd,
		NULL, NULL, NULL
	);

	hComboBox_pb = CreateWindowW(
		L"combobox",
		NULL,
		WS_CHILD | WS_VISIBLE | CBS_DROPDOWNLIST | CBS_HASSTRINGS | WS_VSCROLL,
		975, 105, 100, 400,
		hWnd,
		NULL, NULL, NULL
	);

	combobox_init(hComboBox_pb, 2);

	CreateWindowW(
		L"static",
		L"Port",
		WS_VISIBLE | WS_CHILD,
		850, 145, 100, 35,
		hWnd,
		NULL, NULL, NULL
	);

	hComboBox_port = CreateWindowW(
		L"combobox",
		NULL,
		WS_CHILD | WS_VISIBLE | CBS_DROPDOWNLIST | CBS_HASSTRINGS | WS_VSCROLL,
		975, 145, 100, 400,
		hWnd,
		NULL, NULL, NULL
	);

	com_port_check(hComboBox_port);

	hBut_open = CreateWindowW(
		L"button",
		L"Open Port",
		WS_VISIBLE | WS_CHILD,
		850, 185, 100, 20,
		hWnd,
		(HMENU)But_Open_Port, NULL, NULL
	);

	hBut_close = CreateWindowW(
		L"button",
		L"Close Port",
		WS_VISIBLE | WS_CHILD,
		975, 185, 100, 20,
		hWnd,
		(HMENU)But_Close_Port, NULL, NULL
	);

	hBut_tft_test = CreateWindowW(
		L"button",
		L"TFT Test",
		WS_VISIBLE | WS_CHILD,
		850, 225, 100, 20,
		hWnd,
		(HMENU)But_TFT_Test, NULL, NULL
	);

	hBut_tft_cmd_send = CreateWindowW(
		L"button",
		L"CMD Send",
		WS_VISIBLE | WS_CHILD,
		975, 225, 100, 20,
		hWnd,
		(HMENU)But_TFT_CMD_SEND, NULL, NULL
	);

	CreateWindowW(
		L"static",
		L"Command",
		WS_VISIBLE | WS_CHILD,
		850, 265, 100, 20,
		hWnd,
		NULL, NULL, NULL
	);

	hComboBox_cmd = CreateWindowW(
		L"combobox",
		NULL,
		WS_CHILD | WS_VISIBLE | CBS_DROPDOWNLIST | CBS_HASSTRINGS | WS_VSCROLL,
		975, 265, 100, 400,
		hWnd,
		(HMENU)Combo_Cmd, NULL, NULL
	);

	combobox_init(hComboBox_cmd, 3);

	CreateWindowW(
		L"static",
		L"Backlight",
		WS_VISIBLE | WS_CHILD,
		850, 305, 100, 20,
		hWnd,
		NULL, NULL, NULL
	);

	hEdit_bkl = CreateWindowW(
		L"edit",
		L"00",
		WS_VISIBLE | WS_CHILD | EM_LIMITTEXT | ES_NUMBER,
		975, 305, 100, 20,
		hWnd,
		NULL, NULL, NULL
	);

	SendMessage(hEdit_cols, EM_SETLIMITTEXT, 2, 0);

	CreateWindowW(
		L"static",
		L"Col Start",
		WS_VISIBLE | WS_CHILD,
		850, 335, 100, 20,
		hWnd,
		NULL, NULL, NULL
	);

	hEdit_cols = CreateWindowW(
		L"edit",
		L"000",
		WS_VISIBLE | WS_CHILD | EM_LIMITTEXT | ES_NUMBER,
		975, 335, 100, 20,
		hWnd,
		NULL, NULL, NULL
	);

	SendMessage(hEdit_cols, EM_SETLIMITTEXT, 3, 0);

	CreateWindowW(
		L"static",
		L"Row Start",
		WS_VISIBLE | WS_CHILD,
		850, 365, 100, 20,
		hWnd,
		NULL, NULL, NULL
	);

	hEdit_rows = CreateWindowW(
		L"edit",
		L"000",
		WS_VISIBLE | WS_CHILD | EM_LIMITTEXT | ES_NUMBER,
		975, 365, 100, 20,
		hWnd,
		NULL, NULL, NULL
	);

	SendMessage(hEdit_rows, EM_SETLIMITTEXT, 3, 0);

	CreateWindowW(
		L"static",
		L"Col End",
		WS_VISIBLE | WS_CHILD,
		850, 395, 100, 20,
		hWnd,
		NULL, NULL, NULL
	);

	hEdit_cole = CreateWindowW(
		L"edit",
		L"000",
		WS_VISIBLE | WS_CHILD | EM_LIMITTEXT | ES_NUMBER,
		975, 395, 100, 20,
		hWnd,
		NULL, NULL, NULL
	);

	SendMessage(hEdit_cole, EM_SETLIMITTEXT, 3, 0);

	CreateWindowW(
		L"static",
		L"Row End",
		WS_VISIBLE | WS_CHILD,
		850, 425, 100, 20,
		hWnd,
		NULL, NULL, NULL
	);

	hEdit_rowe = CreateWindowW(
		L"edit",
		L"000",
		WS_VISIBLE | WS_CHILD | EM_LIMITTEXT | ES_NUMBER,
		975, 425, 100, 20,
		hWnd,
		NULL, NULL, NULL
	);

	SendMessage(hEdit_rowe, EM_SETLIMITTEXT, 3, 0);

	CreateWindowW(
		L"static",
		L"Page Disp.",
		WS_VISIBLE | WS_CHILD,
		850, 455, 100, 20,
		hWnd,
		NULL, NULL, NULL
	);

	hEdit_pgdis = CreateWindowW(
		L"edit",
		L"0",
		WS_VISIBLE | WS_CHILD | EM_LIMITTEXT | ES_NUMBER,
		975, 455, 100, 20,
		hWnd,
		NULL, NULL, NULL
	);

	SendMessage(hEdit_pgdis, EM_SETLIMITTEXT, 1, 0);

	CreateWindowW(
		L"static",
		L"Page Load",
		WS_VISIBLE | WS_CHILD,
		850, 485, 100, 20,
		hWnd,
		NULL, NULL, NULL
	);

	hEdit_lddis = CreateWindowW(
		L"edit",
		L"0",
		WS_VISIBLE | WS_CHILD | EM_LIMITTEXT | ES_NUMBER,
		975, 485, 100, 20,
		hWnd,
		NULL, NULL, NULL
	);

	SendMessage(hEdit_lddis, EM_SETLIMITTEXT, 1, 0);

	CreateWindowW(
		L"static",
		L"Page Load",
		WS_VISIBLE | WS_CHILD,
		850, 515, 100, 20,
		hWnd,
		NULL, NULL, NULL
	);

	hEdit_add_inc = CreateWindowW(
		L"edit",
		L"0",
		WS_VISIBLE | WS_CHILD | EM_LIMITTEXT | ES_NUMBER,
		975, 515, 100, 20,
		hWnd,
		NULL, NULL, NULL
	);

	SendMessage(hEdit_add_inc, EM_SETLIMITTEXT, 1, 0);

	hFile_Sel = CreateWindowW(
		L"static",
		L"",
		WS_VISIBLE | WS_CHILD,
		25, 530, 600, 35,
		hWnd,
		NULL, NULL, NULL
	);

	hBut_Send = CreateWindowW(
		L"button",
		L"Send Data",
		WS_VISIBLE | WS_CHILD,
		700, 530, 100, 20,
		hWnd,
		(HMENU)But_Send_Data, NULL, NULL
	);

	EnableWindow(hBut_Send, FALSE);

	EnableWindow(hBut_close, FALSE);
	EnableWindow(hBut_tft_test, FALSE);
	EnableWindow(hBut_tft_cmd_send, FALSE);

	EnableWindow(hComboBox_cmd, FALSE);
	EnableWindow(hEdit_bkl, FALSE);
	EnableWindow(hEdit_cols, FALSE);
	EnableWindow(hEdit_cole, FALSE);
	EnableWindow(hEdit_rows, FALSE);
	EnableWindow(hEdit_rowe, FALSE);

	EnableWindow(hEdit_pgdis, FALSE);
	EnableWindow(hEdit_lddis, FALSE);

	EnableWindow(hEdit_add_inc, FALSE);
}

void open_file(HWND hWnd) {

	OPENFILENAME ofn;

	TCHAR file_name[100];
	TCHAR buf_a[150];
	TCHAR buf_b[150];

	ZeroMemory(&ofn, sizeof(OPENFILENAME));

	ofn.lStructSize = sizeof(OPENFILENAME);
	ofn.hwndOwner = hWnd;
	ofn.lpstrFile = file_name;
	ofn.lpstrFile[0] = L'\0';
	ofn.nMaxFile = 100;
	ofn.lpstrFilter = L"binary files\0*.*BIN\0";
	ofn.nFilterIndex = 1;

	GetOpenFileName(&ofn);

	SetWindowText(hFile_Sel, L"");

	swprintf_s(buf_a, TEXT("Selected File: %s"), ofn.lpstrFile);
	wcscpy_s(buf_b, buf_a);
	
	streampos size, end;

	myfile.open(ofn.lpstrFile, ios::in | ios::binary | ios::ate);
	file_size = 0;

	if (myfile.is_open()) {

		size = myfile.tellg();
		memblock = new char[size];
		myfile.seekg(0, ios::beg);
		myfile.read(memblock, size);

		myfile.close();

		file_size = streamsize(size);

		swprintf_s(buf_b, TEXT("%s  Size: %d Bytes."), buf_a, file_size);
		SetWindowText(hFile_Sel, buf_b);
		EnableWindow(hBut_Send, TRUE);
	}
}

void send_data(void) {

	send_uart_str(memblock, file_size);
	delete[] memblock;

	char SerialBuffer[100] = { 0 };
	int i = 0;
	DWORD NoBytesRead;
	char TempChar;

	do {
		ReadFile(
			serialHandle,		//Handle of the Serial port
			&TempChar,			//Temporary character
			sizeof(TempChar),	//Size of TempChar
			&NoBytesRead,		//Number of bytes read
			NULL
		);

		if (NoBytesRead > 0) {
			SerialBuffer[i] = TempChar;// Store Tempchar into buffer
			i++;
		}
	} while (NoBytesRead > 0);

	EnableWindow(hBut_Send, FALSE);
	SetWindowText(hFile_Sel, L"");

	if (strcmp(SerialBuffer, "OK\r\nOK\r\nOK\r\nOK\r\nOK\r\nOK\r\nOK\r\nDONE\r\n") == 0) {
		EnableWindow(hBut_tft_test, TRUE);
		EnableWindow(hComboBox_cmd, TRUE);
		EnableWindow(hBut_tft_cmd_send, TRUE);
		port_ok = TRUE;
	}
	else {
		EnableWindow(hBut_tft_test, FALSE);
		EnableWindow(hComboBox_cmd, FALSE);
		EnableWindow(hBut_tft_cmd_send, FALSE);
		port_ok = FALSE;
	}
}

void combobox_init(HWND hComboBox, int array_sel) {

	TCHAR A[30];
	int  k = 0;
	int size_all;
	int size_x;

	TCHAR BaudList[][10] = {
		TEXT("1200"), TEXT("2400"), TEXT("4800"), TEXT("9600"),
		TEXT("19200"), TEXT("38400"), TEXT("57600"), TEXT("115200"),
		TEXT("128000"), TEXT("230400"), TEXT("256000"), TEXT("460800"),
		TEXT("512000"), TEXT("921600"), TEXT("1000000")
	};

	TCHAR StopBitList[][10] = {
		TEXT("1"), TEXT("1.5"), TEXT("2")
	};

	TCHAR ParityBitList[][10] = {
		TEXT("No"), TEXT("Odd"), TEXT("Even")
	};

	TCHAR CommandList[][20] = {
		TEXT("NOP"), TEXT("Backlight"),
		TEXT("Col-Row Addr."),
		TEXT("Page Disp."), TEXT("Page Load"),
		TEXT("Load Add Inc."),
	};

	switch (array_sel) {
		case 0:

			size_all = sizeof(BaudList);
			size_x = size_all / sizeof(*BaudList);
			memset(&A, 0, sizeof(A));

			for (k = 0; k < size_x; k += 1) {
				wcscpy_s(A, sizeof(A) / sizeof(TCHAR), (TCHAR*)BaudList[k]);
				SendMessage(hComboBox, (UINT)CB_ADDSTRING, 0, (LPARAM)A);
			}
			SendMessage(hComboBox, CB_SETCURSEL, (size_x - 1), (LPARAM)0);

			break;
	case 1:

		size_all = sizeof(StopBitList);
		size_x = size_all / sizeof(*StopBitList);

		memset(&A, 0, sizeof(A));
		for (k = 0; k < size_x; k += 1) {
			wcscpy_s(A, sizeof(A) / sizeof(TCHAR), (TCHAR*)StopBitList[k]);
			SendMessage(hComboBox, (UINT)CB_ADDSTRING, 0, (LPARAM)A);
		}
		SendMessage(hComboBox, CB_SETCURSEL, 0, (LPARAM)0);

		break;

	case 2:

		size_all = sizeof(ParityBitList);
		size_x = size_all / sizeof(*ParityBitList);

		memset(&A, 0, sizeof(A));
		for (k = 0; k < size_x; k += 1) {
			wcscpy_s(A, sizeof(A) / sizeof(TCHAR), (TCHAR*)ParityBitList[k]);
			SendMessage(hComboBox, (UINT)CB_ADDSTRING, 0, (LPARAM)A);
		}
		SendMessage(hComboBox, CB_SETCURSEL, 0, (LPARAM)0);

		break;

	case 3:

		size_all = sizeof(CommandList);
		size_x = size_all / sizeof(*CommandList);

		memset(&A, 0, sizeof(A));
		for (k = 0; k < size_x; k += 1) {
			wcscpy_s(A, sizeof(A) / sizeof(TCHAR), (TCHAR*)CommandList[k]);
			SendMessage(hComboBox, (UINT)CB_ADDSTRING, 0, (LPARAM)A);
		}
		SendMessage(hComboBox, CB_SETCURSEL, 0, (LPARAM)0);

		break;
	}
}

void com_port_check(HWND hComboBox) {

	unsigned int i;

	for (i = 0; i < 255; i++) {

		TCHAR buf[20];
		swprintf_s(buf, TEXT("\\\\.\\COM%d"), (i + 1));

		serialHandle = CreateFile(
			buf,
			GENERIC_READ | GENERIC_WRITE,
			0,
			NULL,
			OPEN_EXISTING,
			0,
			NULL
		);

		if (serialHandle != INVALID_HANDLE_VALUE) {
			
			swprintf_s(buf, TEXT("COM%d"), (i + 1));
			SendMessage(hComboBox, (UINT)CB_ADDSTRING, 0, (LPARAM)buf);

			CloseHandle(serialHandle);
		}
	}

	SendMessage(hComboBox, CB_SETCURSEL, 0, (LPARAM)0);
}

void open_com_port(void) {

	TCHAR buf[20];
	TCHAR com_port_name[10];
	TCHAR com_port_sb[10];
	TCHAR com_port_pb[10];
	TCHAR com_port_bd[10];

	DCB serialParams = { 0 };

	GetWindowTextW(hComboBox_port, com_port_name, 10);
	GetWindowTextW(hComboBox_sb, com_port_sb, 10);
	GetWindowTextW(hComboBox_pb, com_port_pb, 10);
	GetWindowTextW(hComboBox_bd, com_port_bd, 10);

	swprintf_s(buf, TEXT("\\\\.\\%s"), com_port_name);
	wcscpy_s(com_port_name, buf);

	serialHandle = CreateFile(
		com_port_name,
		GENERIC_READ | GENERIC_WRITE,
		0,
		NULL,
		OPEN_EXISTING,
		0,
		NULL
	);

	if (serialHandle == INVALID_HANDLE_VALUE) {
		return;
	}

	serialParams.DCBlength = sizeof(serialParams);

	int num_buff;

	GetCommState(serialHandle, &serialParams);

	num_buff = _wtoi(com_port_bd);
	serialParams.BaudRate = num_buff;
	serialParams.ByteSize = 8;

	if (_tcscmp(com_port_sb, L"1.5") == 0) {
		serialParams.StopBits = ONE5STOPBITS;
	}else if (_tcscmp(com_port_sb, L"1") == 0) {
		serialParams.StopBits = ONESTOPBIT;
	}else if (_tcscmp(com_port_sb, L"2") == 0) {
		serialParams.StopBits = TWOSTOPBITS;
	}else {
		serialParams.StopBits = ONESTOPBIT;
	}

	if (_tcscmp(com_port_pb, L"No") == 0) {
		serialParams.Parity = NOPARITY;
	}else if (_tcscmp(com_port_pb, L"Odd") == 0) {
		serialParams.Parity = ODDPARITY;
	}else if (_tcscmp(com_port_pb, L"Even") == 0) {
		serialParams.Parity = EVENPARITY;
	}else {
		serialParams.Parity = NOPARITY;
	}

	SetCommState(serialHandle, &serialParams);

	COMMTIMEOUTS timeout = { 0 };

	// Set timeouts
	timeout.ReadIntervalTimeout = 50;
	timeout.ReadTotalTimeoutConstant = 50;
	timeout.ReadTotalTimeoutMultiplier = 50;
	timeout.WriteTotalTimeoutConstant = 50;
	timeout.WriteTotalTimeoutMultiplier = 10;

	SetCommTimeouts(serialHandle, &timeout);

	EnableWindow(hComboBox_port, FALSE);
	EnableWindow(hComboBox_bd, FALSE);
	EnableWindow(hComboBox_sb, FALSE);
	EnableWindow(hComboBox_pb, FALSE);

	EnableWindow(hBut_open, FALSE);
	EnableWindow(hBut_close, TRUE);
	EnableWindow(hBut_tft_test, TRUE);
}

void close_com_port(void) {

	CloseHandle(serialHandle);

	SendMessage(hComboBox_cmd, CB_SETCURSEL, 0, (LPARAM)0);

	EnableWindow(hComboBox_port, TRUE);
	EnableWindow(hComboBox_bd, TRUE);
	EnableWindow(hComboBox_sb, TRUE);
	EnableWindow(hComboBox_pb, TRUE);

	EnableWindow(hBut_open, TRUE);
	EnableWindow(hBut_close, FALSE);
	EnableWindow(hBut_tft_test, FALSE);
	EnableWindow(hBut_tft_cmd_send, FALSE);

	EnableWindow(hComboBox_cmd, FALSE);
	EnableWindow(hEdit_bkl, FALSE);
	EnableWindow(hEdit_cols, FALSE);
	EnableWindow(hEdit_cole, FALSE);
	EnableWindow(hEdit_rows, FALSE);
	EnableWindow(hEdit_rowe, FALSE);

	EnableWindow(hEdit_pgdis, FALSE);
	EnableWindow(hEdit_lddis, FALSE);

	EnableWindow(hEdit_add_inc, FALSE);

	EnableWindow(hBut_Send, FALSE);
	SetWindowText(hFile_Sel, L"");
}

void send_uart_str(char* str_uart, DWORD dNoOFBytestoWrite) {

	BOOL Status;
	DWORD dNoOfBytesWritten = 0;

	Status = WriteFile(
		serialHandle,			// Handle to the Serial port
		str_uart,				// Data to be written to the port
		dNoOFBytestoWrite,		//No of bytes to write
		&dNoOfBytesWritten,		//Bytes written
		NULL
	);
}

void tft_test_port(void) {
	
	char test_array[] = "TFT_C\r\n";

	send_uart_str(test_array, sizeof(test_array));

	char SerialBuffer[20] = { 0 };
	int i = 0;
	DWORD NoBytesRead;
	char TempChar;

	do {
		ReadFile(
			serialHandle,		//Handle of the Serial port
			&TempChar,			//Temporary character
			sizeof(TempChar),	//Size of TempChar
			&NoBytesRead,		//Number of bytes read
			NULL
		);

		if (NoBytesRead > 0) {
			SerialBuffer[i] = TempChar;// Store Tempchar into buffer
			i++;
		}
	} while (NoBytesRead > 0);

	if (strcmp(SerialBuffer, "OK\r\n") == 0) {
		EnableWindow(hBut_tft_test, TRUE);
		EnableWindow(hComboBox_cmd, TRUE);
		EnableWindow(hBut_tft_cmd_send, TRUE);
		port_ok = TRUE;
	}else {
		EnableWindow(hBut_tft_test, FALSE);
		EnableWindow(hComboBox_cmd, FALSE);
		EnableWindow(hBut_tft_cmd_send, FALSE);
		port_ok = FALSE;
	}
}

void cmd_combo_sel(HWND hComboBox) {

	int index_sel = SendMessage(hComboBox, (UINT)CB_GETCURSEL, 0, 0);

	switch (index_sel) {
		case 1:
			EnableWindow(hEdit_bkl, TRUE);
			EnableWindow(hEdit_cols, FALSE);
			EnableWindow(hEdit_cole, FALSE);
			EnableWindow(hEdit_rows, FALSE);
			EnableWindow(hEdit_rowe, FALSE);
			EnableWindow(hEdit_pgdis, FALSE);
			EnableWindow(hEdit_lddis, FALSE);
			EnableWindow(hEdit_add_inc, FALSE);
			break;
		
		case 2:
			EnableWindow(hEdit_bkl, FALSE);
			EnableWindow(hEdit_cols, TRUE);
			EnableWindow(hEdit_cole, TRUE);
			EnableWindow(hEdit_rows, TRUE);
			EnableWindow(hEdit_rowe, TRUE);
			EnableWindow(hEdit_pgdis, FALSE);
			EnableWindow(hEdit_lddis, FALSE);
			EnableWindow(hEdit_add_inc, FALSE);
			break;

		case 3:
			EnableWindow(hEdit_bkl, FALSE);
			EnableWindow(hEdit_cols, FALSE);
			EnableWindow(hEdit_cole, FALSE);
			EnableWindow(hEdit_rows, FALSE);
			EnableWindow(hEdit_rowe, FALSE);
			EnableWindow(hEdit_pgdis, TRUE);
			EnableWindow(hEdit_lddis, FALSE);
			EnableWindow(hEdit_add_inc, FALSE);
			break;

		case 4:
			EnableWindow(hEdit_bkl, FALSE);
			EnableWindow(hEdit_cols, FALSE);
			EnableWindow(hEdit_cole, FALSE);
			EnableWindow(hEdit_rows, FALSE);
			EnableWindow(hEdit_rowe, FALSE);
			EnableWindow(hEdit_pgdis, FALSE);
			EnableWindow(hEdit_lddis, TRUE);
			EnableWindow(hEdit_add_inc, FALSE);
			break;

		case 5:
			EnableWindow(hEdit_bkl, FALSE);
			EnableWindow(hEdit_cols, FALSE);
			EnableWindow(hEdit_cole, FALSE);
			EnableWindow(hEdit_rows, FALSE);
			EnableWindow(hEdit_rowe, FALSE);
			EnableWindow(hEdit_pgdis, FALSE);
			EnableWindow(hEdit_lddis, FALSE);
			EnableWindow(hEdit_add_inc, TRUE);
			break;

		case 0:
			EnableWindow(hEdit_bkl, FALSE);
			EnableWindow(hEdit_cols, FALSE);
			EnableWindow(hEdit_cole, FALSE);
			EnableWindow(hEdit_rows, FALSE);
			EnableWindow(hEdit_rowe, FALSE);
			EnableWindow(hEdit_pgdis, FALSE);
			EnableWindow(hEdit_lddis, FALSE);
			break;
	}
}

