(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_04 - type_1
obj_11 obj_10 obj_05 obj_02 - type_3
obj_03 obj_13 obj_01 obj_12 - type_2
obj_07 obj_09 obj_08 - object)
(:init
(pred_3 obj_06 obj_13)
(pred_4 obj_06 obj_11)
(pred_4 obj_06 obj_10)
(pred_3 obj_04 obj_01)
(pred_4 obj_04 obj_05)
(pred_4 obj_04 obj_02)
(pred_2 obj_07 obj_01)
(pred_2 obj_09 obj_12)
(pred_2 obj_08 obj_12)
)
(:goal
(and
(pred_2 obj_07 obj_13)
(pred_2 obj_09 obj_01)
(pred_2 obj_08 obj_12)
)
)

(:constraints
  (always (not (pred_3 obj_06 obj_01)))
)
)