(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_11 - type_3
obj_12 obj_10 obj_05 obj_01 - type_2
obj_02 obj_14 obj_13 obj_07 - type_1
obj_06 obj_03 obj_08 obj_09 - object)
(:init
(pred_4 obj_04 obj_13)
(pred_1 obj_04 obj_12)
(pred_1 obj_04 obj_10)
(pred_4 obj_11 obj_02)
(pred_1 obj_11 obj_05)
(pred_1 obj_11 obj_01)
(pred_3 obj_06 obj_02)
(pred_3 obj_03 obj_13)
(pred_3 obj_08 obj_07)
(pred_3 obj_09 obj_14)
)
(:goal
(and
(pred_3 obj_06 obj_02)
(pred_3 obj_03 obj_14)
(pred_3 obj_08 obj_13)
(pred_3 obj_09 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_04 obj_14)))
)
)