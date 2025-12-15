(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_04 - type_1
obj_01 obj_05 obj_12 obj_07 - type_3
obj_08 obj_11 obj_14 obj_10 - type_2
obj_06 obj_09 obj_13 obj_03 - object)
(:init
(pred_3 obj_02 obj_08)
(pred_4 obj_02 obj_01)
(pred_4 obj_02 obj_05)
(pred_3 obj_04 obj_10)
(pred_4 obj_04 obj_12)
(pred_4 obj_04 obj_07)
(pred_2 obj_06 obj_14)
(pred_2 obj_09 obj_11)
(pred_2 obj_13 obj_08)
(pred_2 obj_03 obj_08)
)
(:goal
(and
(pred_2 obj_06 obj_08)
(pred_2 obj_09 obj_10)
(pred_2 obj_13 obj_14)
(pred_2 obj_03 obj_14)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_14)))
)
)