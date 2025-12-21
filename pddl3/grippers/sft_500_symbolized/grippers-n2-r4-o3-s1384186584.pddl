(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_04 obj_13 - type_1
obj_06 obj_09 obj_02 obj_10 - type_2
obj_05 obj_12 obj_07 obj_08 - type_3
obj_03 obj_11 obj_01 - object)
(:init
(pred_1 obj_04 obj_05)
(pred_3 obj_04 obj_06)
(pred_3 obj_04 obj_09)
(pred_1 obj_13 obj_12)
(pred_3 obj_13 obj_02)
(pred_3 obj_13 obj_10)
(pred_2 obj_03 obj_07)
(pred_2 obj_11 obj_12)
(pred_2 obj_01 obj_07)
)
(:goal
(and
(pred_2 obj_03 obj_12)
(pred_2 obj_11 obj_05)
(pred_2 obj_01 obj_05)
)
)

(:constraints
  (always (not (pred_1 obj_04 obj_07)))
)
)