(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_06 - type_1
obj_13 obj_04 obj_05 obj_09 - type_3
obj_02 obj_12 obj_07 obj_11 - type_2
obj_01 obj_08 obj_10 - object)
(:init
(pred_4 obj_03 obj_07)
(pred_2 obj_03 obj_13)
(pred_2 obj_03 obj_04)
(pred_4 obj_06 obj_11)
(pred_2 obj_06 obj_05)
(pred_2 obj_06 obj_09)
(pred_3 obj_01 obj_07)
(pred_3 obj_08 obj_02)
(pred_3 obj_10 obj_12)
)
(:goal
(and
(pred_3 obj_01 obj_07)
(pred_3 obj_08 obj_11)
(pred_3 obj_10 obj_12)
)
)

(:constraints
  (always (not (pred_4 obj_03 obj_11)))
)
)