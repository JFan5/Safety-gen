(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_03 - type_2
obj_07 obj_08 obj_10 obj_02 - type_1
obj_11 obj_12 obj_04 obj_05 - type_3
obj_09 obj_01 obj_13 - object)
(:init
(pred_4 obj_06 obj_05)
(pred_1 obj_06 obj_07)
(pred_1 obj_06 obj_08)
(pred_4 obj_03 obj_11)
(pred_1 obj_03 obj_10)
(pred_1 obj_03 obj_02)
(pred_2 obj_09 obj_11)
(pred_2 obj_01 obj_04)
(pred_2 obj_13 obj_12)
)
(:goal
(and
(pred_2 obj_09 obj_11)
(pred_2 obj_01 obj_11)
(pred_2 obj_13 obj_05)
)
)

(:constraints
  (always (not (pred_4 obj_06 obj_04)))
)
)