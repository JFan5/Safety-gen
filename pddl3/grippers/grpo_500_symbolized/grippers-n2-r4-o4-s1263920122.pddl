(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_12 - type_1
obj_01 obj_10 obj_07 obj_13 - type_3
obj_04 obj_02 obj_09 obj_14 - type_2
obj_11 obj_03 obj_08 obj_05 - object)
(:init
(pred_4 obj_06 obj_09)
(pred_2 obj_06 obj_01)
(pred_2 obj_06 obj_10)
(pred_4 obj_12 obj_09)
(pred_2 obj_12 obj_07)
(pred_2 obj_12 obj_13)
(pred_3 obj_11 obj_04)
(pred_3 obj_03 obj_09)
(pred_3 obj_08 obj_14)
(pred_3 obj_05 obj_04)
)
(:goal
(and
(pred_3 obj_11 obj_02)
(pred_3 obj_03 obj_02)
(pred_3 obj_08 obj_14)
(pred_3 obj_05 obj_09)
)
)

(:constraints
  (always (not (pred_4 obj_06 obj_02)))
)
)