(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_06 - type_1
obj_04 obj_08 obj_07 obj_02 - type_3
obj_09 obj_13 obj_03 obj_05 - type_2
obj_11 obj_12 obj_01 - object)
(:init
(pred_4 obj_10 obj_09)
(pred_2 obj_10 obj_04)
(pred_2 obj_10 obj_08)
(pred_4 obj_06 obj_05)
(pred_2 obj_06 obj_07)
(pred_2 obj_06 obj_02)
(pred_3 obj_11 obj_03)
(pred_3 obj_12 obj_05)
(pred_3 obj_01 obj_13)
)
(:goal
(and
(pred_3 obj_11 obj_03)
(pred_3 obj_12 obj_03)
(pred_3 obj_01 obj_03)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_03)))
)
)