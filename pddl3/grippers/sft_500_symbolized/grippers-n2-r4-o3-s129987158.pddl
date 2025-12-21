(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_01 - type_1
obj_03 obj_13 obj_12 obj_11 - type_2
obj_05 obj_10 obj_02 obj_04 - type_3
obj_08 obj_07 obj_06 - object)
(:init
(pred_1 obj_09 obj_02)
(pred_3 obj_09 obj_03)
(pred_3 obj_09 obj_13)
(pred_1 obj_01 obj_05)
(pred_3 obj_01 obj_12)
(pred_3 obj_01 obj_11)
(pred_2 obj_08 obj_04)
(pred_2 obj_07 obj_05)
(pred_2 obj_06 obj_10)
)
(:goal
(and
(pred_2 obj_08 obj_05)
(pred_2 obj_07 obj_02)
(pred_2 obj_06 obj_05)
)
)

(:constraints
  (always (not (pred_1 obj_09 obj_04)))
)
)