import 'package:flutter/material.dart';
import '../models/equipment.dart';
import 'exercises_page.dart';

class EquipmentSelectionPage extends StatefulWidget {
  const EquipmentSelectionPage({super.key});

  @override
  State<EquipmentSelectionPage> createState() => _EquipmentSelectionPageState();
}

class _EquipmentSelectionPageState extends State<EquipmentSelectionPage> {
  List<Equipment> equipments = [
    Equipment(
      id: '1',
      name: 'Mains',
      reference: 'REF-001',
      imagePath: 'assets/main1.png',
    ),
    Equipment(
      id: '2',
      name: 'Piedes',
      reference: 'REF-002',
      imagePath: 'assets/piedes.png',
    ),
    Equipment(
      id: '3',
      name: 'Prothese',
      reference: 'REF-003',
      imagePath: 'assets/prothese.png',
    ),
    Equipment(
      id: '4',
      name: 'Main Complet',
      reference: 'REF-004',
      imagePath: 'assets/maincomplet.png',
    ),

  ];

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _referenceController = TextEditingController();

  void _addNewEquipment() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ajouter une nouvelle pièce'),
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nom de la pièce',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                  value?.isEmpty ?? true ? 'Ce champ est obligatoire' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _referenceController,
                  decoration: const InputDecoration(
                    labelText: 'Référence (optionnel)',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: _saveNewEquipment,
            child: const Text('Ajouter'),
          ),
        ],
      ),
    );
  }

  void _saveNewEquipment() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        equipments.add(Equipment(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: _nameController.text,
          reference: _referenceController.text.isEmpty
              ? 'Nouvelle référence'
              : _referenceController.text,
          imagePath: 'assets/default_equipment.png',
        ));
      });
      _clearControllers();
      Navigator.pop(context);
    }
  }

  void _clearControllers() {
    _nameController.clear();
    _referenceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Pièces'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addNewEquipment,
            tooltip: 'Ajouter une pièce',
          ),
        ],
      ),
      body: _buildEquipmentGrid(),
    );
  }

  Widget _buildEquipmentGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),
      itemCount: equipments.length,
      itemBuilder: (context, index) => _buildEquipmentCard(equipments[index]),
    );
  }

  Widget _buildEquipmentCard(Equipment equipment) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _navigateToExercises(equipment),
        onLongPress: () => _showDeleteDialog(equipment),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildEquipmentImage(equipment),
            _buildEquipmentInfo(equipment),
          ],
        ),
      ),
    );
  }

  Widget _buildEquipmentImage(Equipment equipment) {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        child: Image.asset(
          equipment.imagePath,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: Colors.grey[100],
            child: const Center(
              child: Icon(Icons.construction, size: 40, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEquipmentInfo(Equipment equipment) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            equipment.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (equipment.reference.isNotEmpty)
            Text(
              equipment.reference,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
        ],
      ),
    );
  }

  void _navigateToExercises(Equipment equipment) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExercisesPage(
          equipmentId: equipment.id,
          equipmentName: equipment.name,
        ),
      ),
    );
  }

  void _showDeleteDialog(Equipment equipment) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Supprimer la pièce ?'),
        content: Text('Voulez-vous vraiment supprimer ${equipment.name} ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              setState(() => equipments.removeWhere((e) => e.id == equipment.id));
              Navigator.pop(context);
            },
            child: const Text('Supprimer', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _referenceController.dispose();
    super.dispose();
  }
}