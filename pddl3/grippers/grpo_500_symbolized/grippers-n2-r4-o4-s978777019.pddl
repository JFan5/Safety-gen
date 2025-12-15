(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_05 - type_1
obj_03 obj_08 obj_02 obj_04 - type_3
obj_01 obj_10 obj_09 obj_13 - type_2
obj_06 obj_07 obj_12 obj_14 - object)
(:init
(pred_3 obj_11 obj_01)
(pred_4 obj_11 obj_03)
(pred_4 obj_11 obj_08)
(pred_3 obj_05 obj_01)
(pred_4 obj_05 obj_02)
(pred_4 obj_05 obj_04)
(pred_2 obj_06 obj_10)
(pred_2 obj_07 obj_09)
(pred_2 obj_12 obj_13)
(pred_2 obj_14 obj_09)
)
(:goal
(and
(pred_2 obj_06 obj_09)
(pred_2 obj_07 obj_01)
(pred_2 obj_12 obj_01)
(pred_2 obj_14 obj_13)
)
)

(:constraints
  (always (not (pred_3 obj_11 obj_09)))
)
)