(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_03 - type_2
obj_01 obj_13 obj_04 obj_09 - type_3
obj_06 obj_05 obj_07 obj_10 - type_1
obj_08 obj_14 obj_12 obj_11 - object)
(:init
(pred_4 obj_02 obj_07)
(pred_3 obj_02 obj_01)
(pred_3 obj_02 obj_13)
(pred_4 obj_03 obj_10)
(pred_3 obj_03 obj_04)
(pred_3 obj_03 obj_09)
(pred_2 obj_08 obj_06)
(pred_2 obj_14 obj_05)
(pred_2 obj_12 obj_07)
(pred_2 obj_11 obj_10)
)
(:goal
(and
(pred_2 obj_08 obj_06)
(pred_2 obj_14 obj_10)
(pred_2 obj_12 obj_06)
(pred_2 obj_11 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_10)))
)
)