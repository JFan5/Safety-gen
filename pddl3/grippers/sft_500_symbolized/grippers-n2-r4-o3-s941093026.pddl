(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_01 - type_1
obj_02 obj_12 obj_09 obj_04 - type_2
obj_05 obj_03 obj_07 obj_11 - type_3
obj_13 obj_06 obj_10 - object)
(:init
(pred_1 obj_08 obj_05)
(pred_3 obj_08 obj_02)
(pred_3 obj_08 obj_12)
(pred_1 obj_01 obj_03)
(pred_3 obj_01 obj_09)
(pred_3 obj_01 obj_04)
(pred_2 obj_13 obj_05)
(pred_2 obj_06 obj_05)
(pred_2 obj_10 obj_11)
)
(:goal
(and
(pred_2 obj_13 obj_11)
(pred_2 obj_06 obj_07)
(pred_2 obj_10 obj_03)
)
)

(:constraints
  (always (not (pred_1 obj_08 obj_07)))
)
)