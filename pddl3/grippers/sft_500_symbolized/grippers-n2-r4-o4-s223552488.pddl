(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_01 obj_08 - type_1
obj_03 obj_13 obj_06 obj_07 - type_3
obj_10 obj_05 obj_02 obj_12 - type_2
obj_14 obj_11 obj_09 obj_04 - object)
(:init
(pred_3 obj_01 obj_10)
(pred_1 obj_01 obj_03)
(pred_1 obj_01 obj_13)
(pred_3 obj_08 obj_05)
(pred_1 obj_08 obj_06)
(pred_1 obj_08 obj_07)
(pred_2 obj_14 obj_02)
(pred_2 obj_11 obj_10)
(pred_2 obj_09 obj_02)
(pred_2 obj_04 obj_12)
)
(:goal
(and
(pred_2 obj_14 obj_10)
(pred_2 obj_11 obj_10)
(pred_2 obj_09 obj_02)
(pred_2 obj_04 obj_10)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_02)))
)
)