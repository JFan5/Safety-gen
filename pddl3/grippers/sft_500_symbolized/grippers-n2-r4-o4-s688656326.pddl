(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_11 - type_2
obj_04 obj_14 obj_10 obj_01 - type_1
obj_03 obj_12 obj_02 obj_05 - type_3
obj_09 obj_06 obj_13 obj_08 - object)
(:init
(pred_2 obj_07 obj_05)
(pred_4 obj_07 obj_04)
(pred_4 obj_07 obj_14)
(pred_2 obj_11 obj_02)
(pred_4 obj_11 obj_10)
(pred_4 obj_11 obj_01)
(pred_3 obj_09 obj_12)
(pred_3 obj_06 obj_12)
(pred_3 obj_13 obj_02)
(pred_3 obj_08 obj_03)
)
(:goal
(and
(pred_3 obj_09 obj_05)
(pred_3 obj_06 obj_02)
(pred_3 obj_13 obj_03)
(pred_3 obj_08 obj_12)
)
)

(:constraints
  (always (not (pred_2 obj_07 obj_02)))
)
)