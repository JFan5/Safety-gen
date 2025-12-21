(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_03 - type_1
obj_13 obj_08 obj_05 obj_02 - type_3
obj_12 obj_06 obj_11 obj_04 - type_2
obj_01 obj_09 obj_10 - object)
(:init
(pred_4 obj_07 obj_11)
(pred_2 obj_07 obj_13)
(pred_2 obj_07 obj_08)
(pred_4 obj_03 obj_11)
(pred_2 obj_03 obj_05)
(pred_2 obj_03 obj_02)
(pred_3 obj_01 obj_11)
(pred_3 obj_09 obj_11)
(pred_3 obj_10 obj_11)
)
(:goal
(and
(pred_3 obj_01 obj_11)
(pred_3 obj_09 obj_12)
(pred_3 obj_10 obj_04)
)
)

(:constraints
  (always (not (pred_4 obj_07 obj_04)))
)
)