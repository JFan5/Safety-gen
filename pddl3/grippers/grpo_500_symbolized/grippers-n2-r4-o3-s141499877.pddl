(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_01 - type_1
obj_10 obj_08 obj_03 obj_06 - type_3
obj_07 obj_11 obj_02 obj_05 - type_2
obj_04 obj_12 obj_09 - object)
(:init
(pred_3 obj_13 obj_07)
(pred_4 obj_13 obj_10)
(pred_4 obj_13 obj_08)
(pred_3 obj_01 obj_11)
(pred_4 obj_01 obj_03)
(pred_4 obj_01 obj_06)
(pred_2 obj_04 obj_02)
(pred_2 obj_12 obj_05)
(pred_2 obj_09 obj_11)
)
(:goal
(and
(pred_2 obj_04 obj_05)
(pred_2 obj_12 obj_05)
(pred_2 obj_09 obj_05)
)
)

(:constraints
  (always (not (pred_3 obj_13 obj_02)))
)
)