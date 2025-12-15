(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_07 - type_1
obj_14 obj_06 obj_12 obj_09 - type_3
obj_04 obj_05 obj_10 obj_02 - type_2
obj_08 obj_01 obj_03 obj_11 - object)
(:init
(pred_3 obj_13 obj_02)
(pred_4 obj_13 obj_14)
(pred_4 obj_13 obj_06)
(pred_3 obj_07 obj_02)
(pred_4 obj_07 obj_12)
(pred_4 obj_07 obj_09)
(pred_2 obj_08 obj_02)
(pred_2 obj_01 obj_05)
(pred_2 obj_03 obj_05)
(pred_2 obj_11 obj_10)
)
(:goal
(and
(pred_2 obj_08 obj_02)
(pred_2 obj_01 obj_10)
(pred_2 obj_03 obj_10)
(pred_2 obj_11 obj_04)
)
)

(:constraints
  (always (not (pred_3 obj_13 obj_10)))
)
)