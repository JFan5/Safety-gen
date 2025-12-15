(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_10 - type_3
obj_13 obj_02 obj_01 obj_07 - type_2
obj_05 obj_11 obj_12 obj_03 - type_1
obj_06 obj_04 obj_09 - object)
(:init
(pred_2 obj_08 obj_12)
(pred_3 obj_08 obj_13)
(pred_3 obj_08 obj_02)
(pred_2 obj_10 obj_05)
(pred_3 obj_10 obj_01)
(pred_3 obj_10 obj_07)
(pred_4 obj_06 obj_05)
(pred_4 obj_04 obj_12)
(pred_4 obj_09 obj_03)
)
(:goal
(and
(pred_4 obj_06 obj_05)
(pred_4 obj_04 obj_11)
(pred_4 obj_09 obj_11)
)
)

(:constraints
  (always (not (pred_2 obj_08 obj_03)))
)
)