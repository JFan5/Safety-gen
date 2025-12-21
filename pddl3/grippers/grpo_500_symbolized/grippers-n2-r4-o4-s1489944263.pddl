(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_12 - type_1
obj_04 obj_05 obj_09 obj_06 - type_3
obj_07 obj_13 obj_03 obj_02 - type_2
obj_10 obj_11 obj_08 obj_01 - object)
(:init
(pred_4 obj_14 obj_03)
(pred_2 obj_14 obj_04)
(pred_2 obj_14 obj_05)
(pred_4 obj_12 obj_03)
(pred_2 obj_12 obj_09)
(pred_2 obj_12 obj_06)
(pred_3 obj_10 obj_03)
(pred_3 obj_11 obj_07)
(pred_3 obj_08 obj_07)
(pred_3 obj_01 obj_07)
)
(:goal
(and
(pred_3 obj_10 obj_02)
(pred_3 obj_11 obj_07)
(pred_3 obj_08 obj_07)
(pred_3 obj_01 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_14 obj_02)))
)
)