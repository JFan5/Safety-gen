(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_06 - type_1
obj_09 obj_12 obj_02 obj_07 - type_3
obj_08 obj_10 obj_13 obj_11 - type_2
obj_05 obj_01 obj_04 - object)
(:init
(pred_3 obj_03 obj_11)
(pred_4 obj_03 obj_09)
(pred_4 obj_03 obj_12)
(pred_3 obj_06 obj_08)
(pred_4 obj_06 obj_02)
(pred_4 obj_06 obj_07)
(pred_2 obj_05 obj_13)
(pred_2 obj_01 obj_10)
(pred_2 obj_04 obj_10)
)
(:goal
(and
(pred_2 obj_05 obj_11)
(pred_2 obj_01 obj_10)
(pred_2 obj_04 obj_10)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_13)))
)
)