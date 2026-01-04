(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_11 - type_3
obj_10 obj_14 obj_09 obj_08 - type_2
obj_02 obj_12 obj_13 obj_07 - type_1
obj_06 obj_04 obj_01 obj_05 - object)
(:init
(pred_2 obj_03 obj_07)
(pred_1 obj_03 obj_10)
(pred_1 obj_03 obj_14)
(pred_2 obj_11 obj_12)
(pred_1 obj_11 obj_09)
(pred_1 obj_11 obj_08)
(pred_3 obj_06 obj_13)
(pred_3 obj_04 obj_12)
(pred_3 obj_01 obj_07)
(pred_3 obj_05 obj_12)
)
(:goal
(and
(pred_3 obj_06 obj_02)
(pred_3 obj_04 obj_13)
(pred_3 obj_01 obj_07)
(pred_3 obj_05 obj_07)
)
)

(:constraints
  (always (not (pred_2 obj_03 obj_13)))
)
)