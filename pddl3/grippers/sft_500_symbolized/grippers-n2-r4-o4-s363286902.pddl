(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_03 - type_2
obj_13 obj_07 obj_08 obj_06 - type_3
obj_01 obj_05 obj_02 obj_09 - type_1
obj_04 obj_14 obj_12 obj_11 - object)
(:init
(pred_1 obj_10 obj_02)
(pred_3 obj_10 obj_13)
(pred_3 obj_10 obj_07)
(pred_1 obj_03 obj_09)
(pred_3 obj_03 obj_08)
(pred_3 obj_03 obj_06)
(pred_2 obj_04 obj_01)
(pred_2 obj_14 obj_05)
(pred_2 obj_12 obj_02)
(pred_2 obj_11 obj_09)
)
(:goal
(and
(pred_2 obj_04 obj_01)
(pred_2 obj_14 obj_09)
(pred_2 obj_12 obj_01)
(pred_2 obj_11 obj_02)
)
)

(:constraints
  (always (not (pred_1 obj_10 obj_09)))
)
)