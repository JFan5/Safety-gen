(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_01 - type_1
obj_07 obj_14 obj_08 obj_06 - type_3
obj_05 obj_02 obj_04 obj_10 - type_2
obj_03 obj_12 obj_09 obj_13 - object)
(:init
(pred_3 obj_11 obj_04)
(pred_1 obj_11 obj_07)
(pred_1 obj_11 obj_14)
(pred_3 obj_01 obj_10)
(pred_1 obj_01 obj_08)
(pred_1 obj_01 obj_06)
(pred_4 obj_03 obj_10)
(pred_4 obj_12 obj_04)
(pred_4 obj_09 obj_02)
(pred_4 obj_13 obj_02)
)
(:goal
(and
(pred_4 obj_03 obj_02)
(pred_4 obj_12 obj_10)
(pred_4 obj_09 obj_10)
(pred_4 obj_13 obj_05)
)
)

(:constraints
  (always (not (pred_3 obj_11 obj_10)))
)
)