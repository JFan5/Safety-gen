(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_01 - type_1
obj_11 obj_09 obj_07 obj_08 - type_3
obj_05 obj_03 obj_04 obj_02 - type_2
obj_10 obj_06 obj_12 - object)
(:init
(pred_3 obj_13 obj_03)
(pred_4 obj_13 obj_11)
(pred_4 obj_13 obj_09)
(pred_3 obj_01 obj_03)
(pred_4 obj_01 obj_07)
(pred_4 obj_01 obj_08)
(pred_2 obj_10 obj_03)
(pred_2 obj_06 obj_02)
(pred_2 obj_12 obj_02)
)
(:goal
(and
(pred_2 obj_10 obj_04)
(pred_2 obj_06 obj_02)
(pred_2 obj_12 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_13 obj_04)))
)
)