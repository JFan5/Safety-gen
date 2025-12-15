(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_08 - type_1
obj_06 obj_01 - type_2
obj_04 obj_09 obj_03 - type_3
obj_02 obj_05 obj_07 - object)
(:init
(pred_4 obj_08 obj_04)
(pred_2 obj_08 obj_06)
(pred_2 obj_08 obj_01)
(pred_1 obj_02 obj_04)
(pred_1 obj_05 obj_09)
(pred_1 obj_07 obj_09)
)
(:goal
(and
(pred_1 obj_02 obj_09)
(pred_1 obj_05 obj_03)
(pred_1 obj_07 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_08 ?b obj_06))))
)
)