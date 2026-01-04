(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_07 - type_2
obj_13 obj_04 obj_02 obj_01 - type_1
obj_05 obj_11 obj_10 obj_08 - type_3
obj_06 obj_03 obj_09 obj_14 - object)
(:init
(pred_2 obj_12 obj_11)
(pred_1 obj_12 obj_13)
(pred_1 obj_12 obj_04)
(pred_2 obj_07 obj_08)
(pred_1 obj_07 obj_02)
(pred_1 obj_07 obj_01)
(pred_3 obj_06 obj_10)
(pred_3 obj_03 obj_10)
(pred_3 obj_09 obj_11)
(pred_3 obj_14 obj_05)
)
(:goal
(and
(pred_3 obj_06 obj_05)
(pred_3 obj_03 obj_11)
(pred_3 obj_09 obj_10)
(pred_3 obj_14 obj_05)
)
)

(:constraints
  (always (not (pred_2 obj_12 obj_10)))
)
)