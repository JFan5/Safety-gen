(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_05 - type_1
obj_02 obj_11 obj_01 obj_10 - type_2
obj_04 obj_03 obj_09 obj_14 - type_3
obj_06 obj_08 obj_07 obj_12 - object)
(:init
(pred_1 obj_13 obj_04)
(pred_3 obj_13 obj_02)
(pred_3 obj_13 obj_11)
(pred_1 obj_05 obj_04)
(pred_3 obj_05 obj_01)
(pred_3 obj_05 obj_10)
(pred_2 obj_06 obj_09)
(pred_2 obj_08 obj_04)
(pred_2 obj_07 obj_09)
(pred_2 obj_12 obj_03)
)
(:goal
(and
(pred_2 obj_06 obj_09)
(pred_2 obj_08 obj_04)
(pred_2 obj_07 obj_03)
(pred_2 obj_12 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_13 obj_09)))
)
)