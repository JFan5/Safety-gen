(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_06 - type_1
obj_02 obj_04 obj_07 obj_09 - type_3
obj_10 obj_13 obj_05 obj_11 - type_2
obj_12 obj_03 obj_08 - object)
(:init
(pred_3 obj_01 obj_13)
(pred_4 obj_01 obj_02)
(pred_4 obj_01 obj_04)
(pred_3 obj_06 obj_10)
(pred_4 obj_06 obj_07)
(pred_4 obj_06 obj_09)
(pred_2 obj_12 obj_10)
(pred_2 obj_03 obj_10)
(pred_2 obj_08 obj_13)
)
(:goal
(and
(pred_2 obj_12 obj_10)
(pred_2 obj_03 obj_11)
(pred_2 obj_08 obj_05)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_05)))
)
)