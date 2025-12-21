(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_06 - type_1
obj_07 obj_03 obj_01 obj_05 - type_2
obj_13 obj_11 obj_14 obj_10 - type_3
obj_02 obj_08 obj_09 obj_12 - object)
(:init
(pred_1 obj_04 obj_14)
(pred_3 obj_04 obj_07)
(pred_3 obj_04 obj_03)
(pred_1 obj_06 obj_10)
(pred_3 obj_06 obj_01)
(pred_3 obj_06 obj_05)
(pred_2 obj_02 obj_14)
(pred_2 obj_08 obj_11)
(pred_2 obj_09 obj_14)
(pred_2 obj_12 obj_10)
)
(:goal
(and
(pred_2 obj_02 obj_10)
(pred_2 obj_08 obj_10)
(pred_2 obj_09 obj_14)
(pred_2 obj_12 obj_10)
)
)

(:constraints
  (always (not (pred_1 obj_04 obj_10)))
)
)