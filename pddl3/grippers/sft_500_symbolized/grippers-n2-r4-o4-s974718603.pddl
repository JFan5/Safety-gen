(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_12 - type_1
obj_02 obj_07 obj_13 obj_04 - type_2
obj_06 obj_03 obj_09 obj_05 - type_3
obj_10 obj_11 obj_01 obj_08 - object)
(:init
(pred_1 obj_14 obj_03)
(pred_3 obj_14 obj_02)
(pred_3 obj_14 obj_07)
(pred_1 obj_12 obj_03)
(pred_3 obj_12 obj_13)
(pred_3 obj_12 obj_04)
(pred_2 obj_10 obj_03)
(pred_2 obj_11 obj_09)
(pred_2 obj_01 obj_05)
(pred_2 obj_08 obj_03)
)
(:goal
(and
(pred_2 obj_10 obj_06)
(pred_2 obj_11 obj_03)
(pred_2 obj_01 obj_03)
(pred_2 obj_08 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_14 obj_09)))
)
)