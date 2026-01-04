(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_06 - type_1
obj_13 obj_05 obj_04 obj_12 - type_3
obj_14 obj_10 obj_11 obj_02 - type_2
obj_09 obj_08 obj_01 obj_07 - object)
(:init
(pred_2 obj_03 obj_11)
(pred_3 obj_03 obj_13)
(pred_3 obj_03 obj_05)
(pred_2 obj_06 obj_02)
(pred_3 obj_06 obj_04)
(pred_3 obj_06 obj_12)
(pred_4 obj_09 obj_11)
(pred_4 obj_08 obj_10)
(pred_4 obj_01 obj_11)
(pred_4 obj_07 obj_02)
)
(:goal
(and
(pred_4 obj_09 obj_02)
(pred_4 obj_08 obj_02)
(pred_4 obj_01 obj_11)
(pred_4 obj_07 obj_02)
)
)

(:constraints
  (always (not (pred_2 obj_03 obj_02)))
)
)