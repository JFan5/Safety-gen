(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_13 - type_2
obj_02 obj_05 obj_08 obj_04 - type_3
obj_14 obj_11 obj_10 obj_01 - type_1
obj_09 obj_07 obj_03 obj_12 - object)
(:init
(pred_1 obj_06 obj_14)
(pred_3 obj_06 obj_02)
(pred_3 obj_06 obj_05)
(pred_1 obj_13 obj_14)
(pred_3 obj_13 obj_08)
(pred_3 obj_13 obj_04)
(pred_2 obj_09 obj_14)
(pred_2 obj_07 obj_14)
(pred_2 obj_03 obj_10)
(pred_2 obj_12 obj_10)
)
(:goal
(and
(pred_2 obj_09 obj_11)
(pred_2 obj_07 obj_01)
(pred_2 obj_03 obj_14)
(pred_2 obj_12 obj_11)
)
)

(:constraints
  (always (not (pred_1 obj_06 obj_10)))
)
)