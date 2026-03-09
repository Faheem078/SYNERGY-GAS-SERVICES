<?php
// ============================================
// Synergy Gas Services - Contact Form Handler
// ============================================

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');

require_once 'config.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'message' => 'Invalid request method.']);
    exit;
}

// Sanitize inputs
$full_name    = htmlspecialchars(trim($_POST['full_name'] ?? ''));
$email        = filter_var(trim($_POST['email'] ?? ''), FILTER_SANITIZE_EMAIL);
$phone        = htmlspecialchars(trim($_POST['phone'] ?? ''));
$service_type = htmlspecialchars(trim($_POST['service_type'] ?? ''));
$message      = htmlspecialchars(trim($_POST['message'] ?? ''));

// Validate
$errors = [];
if (empty($full_name))  $errors[] = 'Full name is required.';
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) $errors[] = 'Valid email is required.';
if (empty($message))    $errors[] = 'Message is required.';

if (!empty($errors)) {
    echo json_encode(['success' => false, 'errors' => $errors]);
    exit;
}

$conn = getDBConnection();

$stmt = $conn->prepare(
    "INSERT INTO contacts (full_name, email, phone, service_type, message) VALUES (?, ?, ?, ?, ?)"
);
$stmt->bind_param('sssss', $full_name, $email, $phone, $service_type, $message);

if ($stmt->execute()) {
    // Optional: send notification email
    $to      = 'info@synergygasservices.co.uk';
    $subject = "New Contact Form Submission from $full_name";
    $body    = "Name: $full_name\nEmail: $email\nPhone: $phone\nService: $service_type\n\nMessage:\n$message";
    $headers = "From: noreply@synergygasservices.co.uk";
    @mail($to, $subject, $body, $headers);

    echo json_encode(['success' => true, 'message' => 'Your message has been sent! We\'ll be in touch shortly.']);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to send message. Please try again.']);
}

$stmt->close();
$conn->close();
?>
