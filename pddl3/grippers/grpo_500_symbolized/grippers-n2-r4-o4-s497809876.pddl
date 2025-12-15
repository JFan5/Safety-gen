(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_14 - type_1
obj_08 obj_05 obj_12 obj_06 - type_3
obj_02 obj_11 obj_13 obj_10 - type_2
obj_03 obj_01 obj_09 obj_07 - object)
(:init
(pred_3 obj_04 obj_11)
(pred_4 obj_04 obj_08)
(pred_4 obj_04 obj_05)
(pred_3 obj_14 obj_13)
(pred_4 obj_14 obj_12)
(pred_4 obj_14 obj_06)
(pred_2 obj_03 obj_11)
(pred_2 obj_01 obj_02)
(pred_2 obj_09 obj_10)
(pred_2 obj_07 obj_13)
)
(:goal
(and
(pred_2 obj_03 obj_13)
(pred_2 obj_01 obj_10)
(pred_2 obj_09 obj_11)
(pred_2 obj_07 obj_10)
)
)

(:constraints
  (always (not (pred_3 obj_04 obj_13)))
)
)