import 'package:flutter/material.dart';

/// Returns screen dimensions as a [Size]
Size screen(BuildContext context) => Size(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );

/// Returns 2% of screen dimensions as a [Size]
Size marginXXS(BuildContext context) => Size(
      MediaQuery.of(context).size.width * 0.02,
      MediaQuery.of(context).size.height * 0.02,
    );

/// Returns 5% of screen dimensions as a [Size]
Size marginXS(BuildContext context) => Size(
      MediaQuery.of(context).size.width * 0.05,
      MediaQuery.of(context).size.height * 0.05,
    );

/// Returns 10% of screen dimensions as a [Size]
Size marginS(BuildContext context) => Size(
      MediaQuery.of(context).size.width * 0.1,
      MediaQuery.of(context).size.height * 0.1,
    );

/// Returns 20% of screen dimensions as a [Size]
Size marginM(BuildContext context) => Size(
      MediaQuery.of(context).size.width * 0.2,
      MediaQuery.of(context).size.height * 0.2,
    );

/// Returns 30% of screen dimensions as a [Size]
Size marginL(BuildContext context) => Size(
      MediaQuery.of(context).size.width * 0.3,
      MediaQuery.of(context).size.height * 0.3,
    );

/// Returns 40% of screen dimensions as a [Size]
Size marginXL(BuildContext context) => Size(
      MediaQuery.of(context).size.width * 0.4,
      MediaQuery.of(context).size.height * 0.4,
    );

/// Returns 50% of screen dimensions as a [Size]
Size marginXXL(BuildContext context) => Size(
      MediaQuery.of(context).size.width * 0.5,
      MediaQuery.of(context).size.height * 0.5,
    );
