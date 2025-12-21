(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_12 - type_1
obj_04 obj_13 obj_03 obj_01 - type_3
obj_05 obj_07 obj_10 obj_09 - type_2
obj_08 obj_02 obj_06 obj_14 - object)
(:init
(pred_4 obj_11 obj_05)
(pred_2 obj_11 obj_04)
(pred_2 obj_11 obj_13)
(pred_4 obj_12 obj_10)
(pred_2 obj_12 obj_03)
(pred_2 obj_12 obj_01)
(pred_3 obj_08 obj_07)
(pred_3 obj_02 obj_07)
(pred_3 obj_06 obj_07)
(pred_3 obj_14 obj_10)
)
(:goal
(and
(pred_3 obj_08 obj_05)
(pred_3 obj_02 obj_07)
(pred_3 obj_06 obj_10)
(pred_3 obj_14 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_11 obj_10)))
)
)