(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_11 obj_09 - type_1
obj_02 obj_07 obj_03 obj_10 - type_2
obj_08 obj_05 obj_04 - type_3
obj_01 obj_06 obj_12 - object)
(:init
(pred_1 obj_11 obj_08)
(pred_3 obj_11 obj_02)
(pred_3 obj_11 obj_07)
(pred_1 obj_09 obj_08)
(pred_3 obj_09 obj_03)
(pred_3 obj_09 obj_10)
(pred_2 obj_01 obj_04)
(pred_2 obj_06 obj_05)
(pred_2 obj_12 obj_08)
)
(:goal
(and
(pred_2 obj_01 obj_08)
(pred_2 obj_06 obj_04)
(pred_2 obj_12 obj_05)
)
)

(:constraints
  (always (not (pred_1 obj_11 obj_04)))
)
)