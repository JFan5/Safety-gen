(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_07 - type_2
obj_09 obj_03 obj_05 obj_04 - type_1
obj_12 obj_08 obj_02 obj_11 - type_3
obj_01 obj_06 obj_10 - object)
(:init
(pred_2 obj_13 obj_08)
(pred_4 obj_13 obj_09)
(pred_4 obj_13 obj_03)
(pred_2 obj_07 obj_02)
(pred_4 obj_07 obj_05)
(pred_4 obj_07 obj_04)
(pred_3 obj_01 obj_02)
(pred_3 obj_06 obj_11)
(pred_3 obj_10 obj_11)
)
(:goal
(and
(pred_3 obj_01 obj_08)
(pred_3 obj_06 obj_02)
(pred_3 obj_10 obj_11)
)
)

(:constraints
  (always (not (pred_2 obj_13 obj_02)))
)
)