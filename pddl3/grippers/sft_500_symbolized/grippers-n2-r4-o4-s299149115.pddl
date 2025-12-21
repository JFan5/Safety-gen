(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_13 - type_1
obj_11 obj_08 obj_05 obj_12 - type_2
obj_01 obj_07 obj_14 obj_02 - type_3
obj_06 obj_03 obj_09 obj_10 - object)
(:init
(pred_1 obj_04 obj_14)
(pred_3 obj_04 obj_11)
(pred_3 obj_04 obj_08)
(pred_1 obj_13 obj_01)
(pred_3 obj_13 obj_05)
(pred_3 obj_13 obj_12)
(pred_2 obj_06 obj_01)
(pred_2 obj_03 obj_14)
(pred_2 obj_09 obj_14)
(pred_2 obj_10 obj_02)
)
(:goal
(and
(pred_2 obj_06 obj_02)
(pred_2 obj_03 obj_14)
(pred_2 obj_09 obj_14)
(pred_2 obj_10 obj_07)
)
)

(:constraints
  (always (not (pred_1 obj_04 obj_02)))
)
)