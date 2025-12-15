(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_09 - type_1
obj_03 obj_06 obj_01 obj_02 - type_3
obj_12 obj_11 obj_05 obj_04 - type_2
obj_08 obj_10 obj_07 - object)
(:init
(pred_3 obj_13 obj_05)
(pred_4 obj_13 obj_03)
(pred_4 obj_13 obj_06)
(pred_3 obj_09 obj_05)
(pred_4 obj_09 obj_01)
(pred_4 obj_09 obj_02)
(pred_2 obj_08 obj_11)
(pred_2 obj_10 obj_04)
(pred_2 obj_07 obj_11)
)
(:goal
(and
(pred_2 obj_08 obj_04)
(pred_2 obj_10 obj_12)
(pred_2 obj_07 obj_04)
)
)

(:constraints
  (always (not (pred_3 obj_13 obj_04)))
)
)