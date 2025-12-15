(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_13 - type_1
obj_03 obj_12 obj_05 obj_10 - type_2
obj_04 obj_07 obj_02 obj_09 - type_3
obj_06 obj_08 obj_11 - object)
(:init
(pred_1 obj_01 obj_04)
(pred_4 obj_01 obj_03)
(pred_4 obj_01 obj_12)
(pred_1 obj_13 obj_07)
(pred_4 obj_13 obj_05)
(pred_4 obj_13 obj_10)
(pred_3 obj_06 obj_04)
(pred_3 obj_08 obj_07)
(pred_3 obj_11 obj_02)
)
(:goal
(and
(pred_3 obj_06 obj_04)
(pred_3 obj_08 obj_07)
(pred_3 obj_11 obj_07)
)
)

(:constraints
  (always (not (pred_1 obj_01 obj_02)))
)
)