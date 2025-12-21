(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_13 - type_1
obj_03 obj_10 obj_04 obj_06 - type_3
obj_12 obj_09 obj_02 obj_07 - type_2
obj_05 obj_08 obj_11 - object)
(:init
(pred_4 obj_01 obj_02)
(pred_2 obj_01 obj_03)
(pred_2 obj_01 obj_10)
(pred_4 obj_13 obj_09)
(pred_2 obj_13 obj_04)
(pred_2 obj_13 obj_06)
(pred_3 obj_05 obj_02)
(pred_3 obj_08 obj_12)
(pred_3 obj_11 obj_02)
)
(:goal
(and
(pred_3 obj_05 obj_09)
(pred_3 obj_08 obj_02)
(pred_3 obj_11 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_01 obj_07)))
)
)