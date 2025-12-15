(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_03 - type_1
obj_08 obj_02 obj_05 obj_06 - type_3
obj_11 obj_04 obj_13 obj_07 - type_2
obj_12 obj_09 obj_01 - object)
(:init
(pred_3 obj_10 obj_13)
(pred_4 obj_10 obj_08)
(pred_4 obj_10 obj_02)
(pred_3 obj_03 obj_11)
(pred_4 obj_03 obj_05)
(pred_4 obj_03 obj_06)
(pred_2 obj_12 obj_13)
(pred_2 obj_09 obj_07)
(pred_2 obj_01 obj_07)
)
(:goal
(and
(pred_2 obj_12 obj_13)
(pred_2 obj_09 obj_13)
(pred_2 obj_01 obj_07)
)
)

(:constraints
  (always (not (pred_3 obj_10 obj_07)))
)
)