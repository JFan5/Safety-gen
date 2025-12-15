(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_01 - type_1
obj_12 obj_10 obj_08 obj_07 - type_2
obj_04 obj_05 obj_02 obj_11 - type_3
obj_06 obj_13 obj_03 - object)
(:init
(pred_1 obj_09 obj_11)
(pred_4 obj_09 obj_12)
(pred_4 obj_09 obj_10)
(pred_1 obj_01 obj_11)
(pred_4 obj_01 obj_08)
(pred_4 obj_01 obj_07)
(pred_3 obj_06 obj_05)
(pred_3 obj_13 obj_02)
(pred_3 obj_03 obj_02)
)
(:goal
(and
(pred_3 obj_06 obj_02)
(pred_3 obj_13 obj_05)
(pred_3 obj_03 obj_11)
)
)

(:constraints
  (always (not (pred_1 obj_09 obj_02)))
)
)