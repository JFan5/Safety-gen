(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_07 - type_1
obj_09 obj_12 obj_05 obj_14 - type_2
obj_11 obj_06 obj_10 obj_01 - type_3
obj_13 obj_04 obj_03 obj_08 - object)
(:init
(pred_3 obj_02 obj_06)
(pred_2 obj_02 obj_09)
(pred_2 obj_02 obj_12)
(pred_3 obj_07 obj_01)
(pred_2 obj_07 obj_05)
(pred_2 obj_07 obj_14)
(pred_4 obj_13 obj_10)
(pred_4 obj_04 obj_10)
(pred_4 obj_03 obj_06)
(pred_4 obj_08 obj_11)
)
(:goal
(and
(pred_4 obj_13 obj_11)
(pred_4 obj_04 obj_06)
(pred_4 obj_03 obj_10)
(pred_4 obj_08 obj_11)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_10)))
)
)